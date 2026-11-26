import 'dart:async';

import '../../../core/mock/live_value.dart';
import '../../../core/utils/dates.dart';
import '../../campaigns/data/mock_campaign_repository.dart';
import '../../campaigns/domain/campaign.dart';
import '../../notifications/data/mock_notification_repository.dart';
import '../../profile/data/mock_profile_repository.dart';
import '../../wallet/data/mock_wallet_repository.dart';
import '../domain/deal.dart';
import '../domain/deal_repository.dart';
import '../domain/deal_rules.dart';
import '../domain/dev_brand_controls.dart';

/// How the simulated brand behaves. Change these at runtime (dev hub) or
/// in tests.
class BrandSimulation {
  /// Turn off to drive the brand only through the `brand*` methods.
  bool enabled = true;

  /// Reject the first script and the first content once, then approve,
  /// like the prototype's "Reject once" default.
  bool rejectFirst = true;

  /// Approve applications by itself after [replyDelay].
  bool autoApproveApplications = true;

  Duration replyDelay = const Duration(seconds: 4);
  Duration chatReplyDelay = const Duration(milliseconds: 2500);

  /// Time between delivery updates (ready → packed → shipped → out).
  Duration shippingStep = const Duration(milliseconds: 1600);
}

/// In-memory deals plus a pretend brand on the other side. When a real
/// backend exists, the brand's actions arrive from the server instead and
/// this class is replaced by an API-backed [DealRepository].
class MockDealRepository implements DealRepository, DevBrandControls {
  MockDealRepository({
    required List<Deal> deals,
    required this.campaigns,
    required this.wallet,
    required this.notifications,
    required this.profile,
    required this.now,
    BrandSimulation? simulation,
  }) : sim = simulation ?? BrandSimulation(),
       _deals = LiveValue(_sorted(deals));

  final MockCampaignRepository campaigns;
  final MockWalletRepository wallet;
  final MockNotificationRepository notifications;
  final MockProfileRepository profile;
  final DateTime Function() now;
  final BrandSimulation sim;

  final LiveValue<List<Deal>> _deals;
  final _timers = <Timer>{};
  var _seq = 0;

  List<Deal> get current => _deals.value;
  Deal? find(String id) {
    for (final d in _deals.value) {
      if (d.id == id) return d;
    }
    return null;
  }

  // ---------------------------------------------------------------------
  // Creator actions
  // ---------------------------------------------------------------------

  @override
  Stream<List<Deal>> watchAll() => _deals.stream;

  @override
  Stream<Deal?> watch(String id) => _deals.stream
      .map((all) => all.where((d) => d.id == id).firstOrNull)
      .distinct();

  @override
  Future<Deal> apply(Campaign c, {String? note}) async {
    if (current.any(
      (d) => d.campaignId == c.id && d.bucket != CollabBucket.closed,
    )) {
      throw DealActionError('Already applied to ${c.title}');
    }
    final id = 'd-${c.id}-${++_seq}';
    wallet.hold(id, c.credits, c.title); // throws InsufficientCreditsError
    final t = now();
    final deal = Deal(
      id: id,
      campaignId: c.id,
      type: c.type,
      title: c.title,
      brandName: c.brand.name,
      stage: DealStage.applied,
      credits: c.credits,
      appliedAt: t,
      updatedAt: t,
      log: [
        DealEvent(
          actor: Actor.you,
          text: c.type == CampaignType.drop
              ? 'Requested · credits held'
              : 'Applied · credits held',
          at: t,
        ),
      ],
    );
    _put(deal);
    if (sim.enabled && sim.autoApproveApplications) {
      _later(sim.replyDelay, () => brandApproveApplication(id));
    }
    return deal;
  }

  @override
  Future<void> withdraw(String dealId) async {
    final d = _get(dealId);
    if (d.bucket == CollabBucket.closed || d.bucket == CollabBucket.done) {
      throw DealActionError('This collab is already finished');
    }
    if (d.stage == DealStage.applied) {
      wallet.refund(d.id, d.title, reason: 'withdrawn');
    }
    _update(
      d,
      Actor.you,
      'Withdrew from this collab',
      stage: DealStage.withdrawn,
    );
  }

  @override
  Future<void> confirmAddress(String dealId, String addressId) async {
    final d = _expect(dealId, [DealStage.address]);
    final addr = profile.current.addresses
        .where((a) => a.id == addressId)
        .firstOrNull;
    if (addr == null) throw DealActionError('Unknown address');
    final next = DealRules.next(d.type, DealStage.address);
    final updated = _update(
      d.copyWith(addressId: addressId),
      Actor.you,
      'Confirmed delivery address · ${addr.short}',
      stage: next,
    );
    // Drops ship straight away; barter kits ship after script approval.
    if (next == DealStage.delivery && sim.enabled) brandShip(updated.id);
  }

  @override
  Future<void> submitScript(String dealId, String text) async {
    final d = _expect(dealId, [DealStage.script]);
    if (text.trim().isEmpty) throw DealActionError('Write your script first');
    _update(
      d.copyWith(scriptText: text.trim()),
      Actor.you,
      'Sent script v${d.scriptVersion} for approval',
      stage: DealStage.scriptReview,
    );
    if (sim.enabled) {
      _later(sim.replyDelay, () {
        if (find(dealId)?.stage != DealStage.scriptReview) return;
        brandReviewScript(
          dealId,
          approve: !(sim.rejectFirst && _get(dealId).scriptRejections == 0),
        );
      });
    }
  }

  @override
  Future<void> markReceived(String dealId) async {
    final d = _expect(dealId, [DealStage.delivery]);
    const shipped = {
      DeliveryStatus.shipped,
      DeliveryStatus.outForDelivery,
      DeliveryStatus.delivered,
    };
    if (!shipped.contains(d.delivery?.status)) {
      throw DealActionError("It hasn't shipped yet");
    }
    _update(
      d.copyWith(
        delivery: d.delivery!.copyWith(status: DeliveryStatus.received),
      ),
      Actor.you,
      d.type == CampaignType.drop ? 'Received the box' : 'Received the kit',
      stage: DealRules.next(d.type, DealStage.delivery),
    );
  }

  @override
  Future<void> undoReceived(String dealId) async {
    final d = _expect(dealId, [DealStage.shoot, DealStage.choose]);
    if (d.delivery?.status != DeliveryStatus.received) {
      throw DealActionError('Nothing to undo');
    }
    _update(
      d.copyWith(
        delivery: d.delivery!.copyWith(status: DeliveryStatus.outForDelivery),
      ),
      Actor.you,
      'Undid “received” · not delivered yet',
      stage: DealStage.delivery,
    );
  }

  @override
  Future<void> reportDeliveryProblem(String dealId, String issue) async {
    final d = _expect(dealId, [DealStage.delivery]);
    _update(
      d.copyWith(
        delivery: d.delivery!.copyWith(
          status: DeliveryStatus.issue,
          issue: issue,
        ),
      ),
      Actor.you,
      'Reported a delivery problem · $issue',
    );
    if (sim.enabled) {
      _later(sim.chatReplyDelay, () => brandShip(dealId, reship: true));
    }
  }

  @override
  Future<void> chooseContent(String dealId, {required bool makeContent}) async {
    final d = _expect(dealId, [DealStage.choose]);
    _update(
      d.copyWith(madeContent: makeContent),
      Actor.you,
      makeContent ? 'Making content' : 'Finished without content',
      stage: makeContent ? DealStage.upload : DealStage.done,
    );
  }

  @override
  Future<void> proposeShootDate(String dealId, DateTime date) async {
    final d = _expect(dealId, [DealStage.shoot]);
    _update(
      d.copyWith(shootDate: date),
      Actor.you,
      'Proposed shoot date · ${TmDates.short(date)}',
    );
  }

  @override
  Future<void> shootDone(String dealId) async {
    final d = _expect(dealId, [DealStage.shoot]);
    _update(d, Actor.you, 'Shoot done', stage: DealStage.upload);
  }

  @override
  Future<void> submitContent(
    String dealId,
    List<String> files, {
    String? postLink,
  }) async {
    final d = _expect(dealId, [DealStage.upload]);
    if (files.isEmpty) throw DealActionError('Add at least one file');
    final withFiles = d.copyWith(contentFiles: files, postLink: postLink);

    if (d.type == CampaignType.drop) {
      // No review for drops: submitting finishes the deal.
      _update(
        withFiles,
        Actor.you,
        'Uploaded ${files.length} file(s) · deal finished',
        stage: DealStage.done,
      );
      return;
    }
    _update(
      withFiles,
      Actor.you,
      'Sent ${d.type.contentWord} (round ${d.contentRound}) for review',
      stage: DealStage.contentReview,
    );
    if (sim.enabled) {
      _later(sim.replyDelay, () {
        if (find(dealId)?.stage != DealStage.contentReview) return;
        brandReviewContent(
          dealId,
          approve: !(sim.rejectFirst && _get(dealId).contentRejections == 0),
        );
      });
    }
  }

  @override
  Future<void> sendMessage(
    String dealId,
    String text, {
    String? attachment,
  }) async {
    final d = _get(dealId);
    if (text.trim().isEmpty && attachment == null) return;
    _set(
      d.copyWith(
        chat: [
          ...d.chat,
          ChatMessage(
            id: 'm-${++_seq}',
            from: Actor.you,
            text: text.trim(),
            sentAt: now(),
            attachment: attachment,
          ),
        ],
      ),
    );
    if (sim.enabled) {
      _later(sim.chatReplyDelay, () {
        final latest = find(dealId);
        if (latest == null) return;
        _brandSays(
          latest,
          latest.needsFix
              ? 'Thanks, that works. Go ahead and resubmit.'
              : 'Thanks! Yes, that works. Keep it natural.',
        );
        notifications.push(
          title: '${latest.brandName} replied',
          link: _link(dealId),
        );
      });
    }
  }

  @override
  Future<void> sendPostLink(String dealId, String link) async {
    final d = _expect(dealId, [DealStage.done]);
    _update(d.copyWith(postLink: link), Actor.you, 'Sent the post link');
  }

  // ---------------------------------------------------------------------
  // Brand side (what the brand portal does). Public so the dev hub and
  // tests can trigger them directly.
  // ---------------------------------------------------------------------

  @override
  void brandApproveApplication(String dealId) {
    final d = find(dealId);
    if (d == null || d.stage != DealStage.applied) return;
    wallet.capture(d.id);
    final c = campaigns.find(d.campaignId);
    final first = DealRules.firstStage(d.type);
    _update(
      d.copyWith(
        delivery: d.type.shipsProduct
            ? Delivery(
                courier: 'Aramex',
                trackingUrl: 'https://www.aramex.com/',
                deliverBy:
                    c?.dateOf(KeyDateKind.deliverBy) ??
                    now().add(const Duration(days: 4)),
              )
            : null,
      ),
      Actor.brand,
      d.type == CampaignType.offer
          ? 'Accepted your request'
          : 'Approved your application',
      stage: first,
    );
    notifications.push(
      title:
          '${d.brandName} approved your '
          '${d.type == CampaignType.drop ? 'request' : 'application'}',
      body: first == DealStage.address
          ? 'Confirm your address to start'
          : 'Write your script to start',
      urgent: true,
      actionLabel: first == DealStage.address
          ? 'Confirm address'
          : 'Write script',
      link: _link(d.id),
    );
  }

  @override
  void brandRejectApplication(String dealId) {
    final d = find(dealId);
    if (d == null || d.stage != DealStage.applied) return;
    wallet.refund(d.id, d.title, reason: 'not approved');
    _update(
      d,
      Actor.brand,
      'Picked other creators · credits refunded',
      stage: DealStage.notApproved,
    );
    notifications.push(
      title: 'Credits refunded: ${d.brandName} picked other creators',
      link: '/credits',
    );
  }

  void brandReviewScript(String dealId, {required bool approve}) {
    final d = find(dealId);
    if (d == null || d.stage != DealStage.scriptReview) return;
    if (!approve) {
      final reworked = _brandSays(
        d.copyWith(
          scriptRejections: d.scriptRejections + 1,
          scriptVersion: d.scriptVersion + 1,
        ),
        _scriptReject[d.type]!,
        tag: 'Changes requested',
      );
      _update(
        reworked,
        Actor.brand,
        'Rejected script v${d.scriptVersion} · see chat',
        stage: DealStage.script,
      );
      notifications.push(
        title: '${d.brandName} rejected your script',
        body: 'See why in the chat',
        urgent: true,
        actionLabel: 'Open chat',
        link: _link(d.id),
      );
      return;
    }
    final next = DealRules.next(d.type, DealStage.scriptReview);
    final updated = _update(
      d,
      Actor.brand,
      'Approved your script',
      stage: next,
    );
    notifications.push(
      title: '${d.brandName} approved your script!',
      link: _link(d.id),
    );
    if (next == DealStage.delivery && sim.enabled) brandShip(updated.id);
  }

  void brandReviewContent(String dealId, {required bool approve}) {
    final d = find(dealId);
    if (d == null || d.stage != DealStage.contentReview) return;
    final what = d.type.contentWord;
    if (!approve) {
      final reworked = _brandSays(
        d.copyWith(
          contentRejections: d.contentRejections + 1,
          contentRound: d.contentRound + 1,
        ),
        _contentReject[d.type]!,
        tag: 'Changes requested',
        videoTimestamp: '0:12',
        attachment: 'screenshot_0-12.jpg',
      );
      _update(
        reworked,
        Actor.brand,
        'Rejected the $what · see chat',
        stage: DealStage.upload,
      );
      notifications.push(
        title: '${d.brandName} rejected your $what',
        body: 'See why in the chat',
        urgent: true,
        actionLabel: 'Open chat',
        link: _link(d.id),
      );
      return;
    }
    final next = DealRules.next(d.type, DealStage.contentReview);
    final code = next == DealStage.voucher ? _issueCode(d) : null;
    _update(
      d.copyWith(code: code),
      Actor.brand,
      code == null
          ? 'Approved your $what'
          : 'Approved your $what · ${code.kind.label} issued',
      stage: next,
    );
    notifications.push(
      title: code == null
          ? '${d.brandName} approved your $what!'
          : '${d.brandName} approved your $what. ${_cap(code.kind.label)} ready',
      link: code == null ? _link(d.id) : '/vouchers?deal=${d.id}',
    );
  }

  /// Ships (or reships) the product, stepping through the delivery states.
  void brandShip(String dealId, {bool reship = false}) {
    final start = find(dealId);
    if (start == null || start.delivery == null) return;
    final steps = [
      if (!reship) (DeliveryStatus.packed, 'Packed your order', null),
      (
        DeliveryStatus.shipped,
        '${reship ? 'Reshipped' : 'Shipped'} with ${start.delivery!.courier}',
        '${reship ? 'Reshipped' : 'Shipped'}: your order is on its way',
      ),
      (
        DeliveryStatus.outForDelivery,
        'Out for delivery',
        'Your order is out for delivery today',
      ),
    ];
    _setDelivery(start, DeliveryStatus.ready);
    var wait = Duration.zero;
    for (final (status, logText, push) in steps) {
      wait += sim.shippingStep;
      _later(wait, () {
        final d = find(dealId);
        if (d == null || d.stage != DealStage.delivery) return;
        final shipped = status == DeliveryStatus.shipped;
        _update(
          d.copyWith(
            delivery: d.delivery!.copyWith(
              status: status,
              issue: null,
              trackingNo: shipped
                  ? 'AR${40000000 + _seq * 7919}'
                  : d.delivery!.trackingNo,
              eta: shipped ? d.delivery!.deliverBy : d.delivery!.eta,
              attempts: shipped
                  ? d.delivery!.attempts + 1
                  : d.delivery!.attempts,
            ),
          ),
          Actor.brand,
          logText,
        );
        if (push != null) notifications.push(title: push, link: _link(dealId));
      });
    }
  }

  @override
  void brandRedeemCode(String dealId) {
    final d = find(dealId);
    if (d == null || d.stage != DealStage.voucher || d.code == null) return;
    _update(
      d.copyWith(code: d.code!.copyWith(redeemedAt: now())),
      Actor.brand,
      '${_cap(d.code!.kind.label)} scanned at the venue · collab complete',
      stage: DealStage.done,
    );
    notifications.push(
      title:
          '${d.brandName} scanned your ${d.code!.kind.label}. '
          'Collab complete',
      link: _link(d.id),
    );
  }

  @override
  void brandSendThankYou(String dealId) {
    final d = find(dealId);
    if (d == null) return;
    final withMsg = _brandSays(
      d,
      'Thank you for the lovely content! It was great working with you, '
      'and we hope to collab again soon.',
      tag: '♥ Thank-you',
    );
    _update(withMsg, Actor.brand, 'Sent you a thank-you');
    notifications.push(
      title: '${d.brandName} sent you a thank-you',
      link: _link(d.id),
    );
  }

  @override
  void brandEndCollab(
    String dealId, {
    required String reason,
    bool strike = false,
  }) {
    final d = find(dealId);
    if (d == null || d.bucket == CollabBucket.closed) return;
    if (strike) profile.addStrike();
    _update(
      d.copyWith(endReason: reason, strike: strike),
      Actor.brand,
      'Ended the collaboration · $reason',
      stage: DealStage.ended,
    );
    notifications.push(
      title: '${d.brandName} ended the collaboration',
      body: 'See why',
      urgent: true,
      actionLabel: 'See why',
      link: _link(d.id),
    );
  }

  // ---------------------------------------------------------------------
  // Internals
  // ---------------------------------------------------------------------

  static const _scriptReject = {
    CampaignType.barter:
        'The script reads like an ad. Please make it personal: your real '
        'routine and how your skin felt after a week.',
    CampaignType.event:
        'Please mention the date and that spots are limited. Keep it under '
        '45 seconds.',
    CampaignType.offer:
        'Please mention the 30% creator offer clearly in the first 5 seconds.',
    CampaignType.drop: 'Please follow the brief.',
  };

  static const _contentReject = {
    CampaignType.barter:
        "Lighting is too dark and the product label isn't visible. Please "
        'reshoot in daylight.',
    CampaignType.event:
        'The audio is hard to hear over the music. Please add captions or a '
        'voiceover and re-upload.',
    CampaignType.offer:
        'The offer text on screen is too small. Please make it bigger and '
        're-upload.',
    CampaignType.drop: 'Please follow the brief.',
  };

  IssuedCode _issueCode(Deal d) {
    final c = campaigns.find(d.campaignId);
    final kind = DealRules.codeKind(d.type)!;
    final prefix = d.brandName.split(' ').first.toUpperCase();
    return IssuedCode(
      kind: kind,
      code: kind == CodeKind.entryCode
          ? 'TM-EVT-${1000 + (_seq * 37) % 9000}'
          : '$prefix-TM${(_seq * 13) % 90 + 10}',
      howToUse: kind == CodeKind.entryCode
          ? 'Show the QR at the guest-list entrance. Admits you + 1.'
          : 'Show the QR or read out the code when you book or pay.',
      validUntil: kind == CodeKind.entryCode
          ? c?.dateOf(KeyDateKind.shootFrom)
          : c?.dateOf(KeyDateKind.validTo),
    );
  }

  Deal _brandSays(
    Deal d,
    String text, {
    String? tag,
    String? videoTimestamp,
    String? attachment,
  }) => _set(
    d.copyWith(
      chat: [
        ...d.chat,
        ChatMessage(
          id: 'm-${++_seq}',
          from: Actor.brand,
          text: text,
          sentAt: now(),
          tag: tag,
          videoTimestamp: videoTimestamp,
          attachment: attachment,
        ),
      ],
    ),
  );

  void _setDelivery(Deal d, DeliveryStatus status) =>
      _set(d.copyWith(delivery: d.delivery!.copyWith(status: status)));

  Deal _get(String id) =>
      find(id) ?? (throw DealActionError('Collab not found'));

  Deal _expect(String id, List<DealStage> allowed) {
    final d = _get(id);
    if (!allowed.contains(d.stage)) {
      throw DealActionError("Can't do that at this step (${d.stage.name})");
    }
    return d;
  }

  /// Adds a timeline entry, optionally moves the stage, and saves.
  Deal _update(Deal d, Actor actor, String text, {DealStage? stage}) => _set(
    d.copyWith(
      stage: stage ?? d.stage,
      log: [
        DealEvent(actor: actor, text: text, at: now()),
        ...d.log,
      ],
    ),
  );

  Deal _set(Deal d) {
    final saved = d.copyWith(updatedAt: now());
    _deals.value = _sorted([
      for (final x in _deals.value)
        if (x.id != saved.id) x,
      saved,
    ]);
    return saved;
  }

  void _put(Deal d) => _deals.value = _sorted([..._deals.value, d]);

  static List<Deal> _sorted(List<Deal> deals) =>
      [...deals]..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));

  void _later(Duration delay, void Function() action) {
    late final Timer t;
    t = Timer(delay, () {
      _timers.remove(t);
      action();
    });
    _timers.add(t);
  }

  static String _link(String dealId) => '/deals/$dealId';
  static String _cap(String s) => s[0].toUpperCase() + s.substring(1);

  Future<void> dispose() async {
    for (final t in _timers) {
      t.cancel();
    }
    _timers.clear();
    await _deals.close();
  }
}
