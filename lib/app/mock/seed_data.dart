import '../../features/campaigns/domain/campaign.dart';
import '../../features/deals/domain/deal.dart';
import '../../features/notifications/domain/app_notification.dart';
import '../../features/profile/domain/creator.dart';
import '../../features/wallet/domain/wallet.dart';
import '../../core/utils/dates.dart';

/// Sample data from the app prototype. All dates are relative to [now] so
/// the data always looks current.
class SeedData {
  SeedData(this.now) : _today = TmDates.dateOnly(now);

  final DateTime now;
  final DateTime _today;

  DateTime _day(int n) => _today.add(Duration(days: n));
  DateTime _ago({int days = 0, int hours = 0, int minutes = 0}) =>
      now.subtract(Duration(days: days, hours: hours, minutes: minutes));

  // ---------------------------------------------------------------------
  // Campaigns
  // ---------------------------------------------------------------------

  /// The brand's timeline per type, in days from today (from the prototype).
  static const _timelines = {
    CampaignType.barter: [
      (KeyDateKind.applyBy, 'Applications close', -3),
      (KeyDateKind.scriptDue, 'Scripts due', 1),
      (KeyDateKind.deliverBy, 'Products delivered by', 4),
      (KeyDateKind.shootFrom, 'Shoot window opens', 5),
      (KeyDateKind.shootTo, 'Shoot window closes', 10),
      (KeyDateKind.contentDue, 'Deliverables due', 12),
      (KeyDateKind.postFrom, 'Posting starts', 14),
      (KeyDateKind.postTo, 'Posting ends', 21),
    ],
    CampaignType.event: [
      (KeyDateKind.applyBy, 'Applications close', -3),
      (KeyDateKind.scriptDue, 'Scripts due', 1),
      (KeyDateKind.shootFrom, 'Event day', 7),
      (KeyDateKind.contentDue, 'Deliverables due', 9),
      (KeyDateKind.postFrom, 'Posting starts', 9),
      (KeyDateKind.postTo, 'Posting ends', 16),
    ],
    CampaignType.offer: [
      (KeyDateKind.applyBy, 'Applications close', -3),
      (KeyDateKind.scriptDue, 'Scripts due', 1),
      (KeyDateKind.shootFrom, 'Shoot window opens', 2),
      (KeyDateKind.shootTo, 'Shoot window closes', 6),
      (KeyDateKind.contentDue, 'Deliverables due', 8),
      (KeyDateKind.postFrom, 'Posting starts', 9),
      (KeyDateKind.postTo, 'Posting ends', 16),
      (KeyDateKind.validTo, 'Coupon valid until', 45),
    ],
    CampaignType.drop: [
      (KeyDateKind.applyBy, 'Requests close', -3),
      (KeyDateKind.dispatchBy, 'Products dispatched by', 1),
      (KeyDateKind.deliverBy, 'Products delivered by', 4),
      (KeyDateKind.contentDue, 'Content (optional) by', 14),
    ],
  };

  List<KeyDate> _timeline(CampaignType t, int shift) => [
    for (final (kind, label, n) in _timelines[t]!)
      KeyDate(kind: kind, label: label, date: _day(n + shift)),
  ];

  static const _steps = {
    CampaignType.barter: [
      'Apply with credits',
      'Brand approves',
      'Confirm your delivery address',
      'Send script, brand approves',
      'Product delivered, shoot your content',
      'Upload, brand approves, done',
    ],
    CampaignType.drop: [
      'Request with credits',
      'Brand approves',
      'Confirm your delivery address',
      'Product delivered',
      'Optional: upload content, finished',
    ],
    CampaignType.event: [
      'Apply with credits',
      'Brand approves',
      'Send script, brand approves',
      'Shoot and upload promo video',
      'Brand approves, entry code in app',
      'Show QR at the event',
    ],
    CampaignType.offer: [
      'Apply with credits',
      'Brand accepts',
      'Send script, brand approves',
      'Shoot and upload reel',
      'Brand approves, coupon in app',
      'Use the coupon',
    ],
  };

  static const _agreements = {
    CampaignType.barter:
        "If approved, I'll deliver every criteria point on time.",
    CampaignType.drop:
        'I understand content is optional and the product ships to my '
        'confirmed address.',
    CampaignType.event:
        "If approved, I'll deliver the promo video before the event.",
    CampaignType.offer:
        "If accepted, I'll deliver the reel as per the criteria.",
  };

  static const _deliverables = {
    CampaignType.barter: [
      '1 Instagram Reel, 30–60 sec',
      '3 Instagram Stories',
      'Tag the brand account',
    ],
    CampaignType.drop: [
      'Optional: any post or story',
      'Tag the brand if you post',
    ],
    CampaignType.event: [
      '1 Instagram Reel before the event',
      '2 Stories on the night',
      'Tag the venue',
    ],
    CampaignType.offer: [
      '1 Instagram Reel',
      '1 Google review',
      'Tag the brand account',
    ],
  };

  Campaign _campaign({
    required String id,
    required CampaignType type,
    required String brand,
    required String handle,
    required String title,
    required String category,
    required String worth,
    required int credits,
    required String youGet,
    required String youGetShort,
    String? meta,
    String? contentShort,
    List<String>? criteria,
    String? brief,
    List<String>? eligibility,
    List<String>? materials,
    int spotsLeft = 10,
    int spotsTotal = 40,
    bool isOpen = true,
  }) {
    final shift = isOpen ? 8 : 0;
    final timeline = _timeline(type, shift);
    final decideBy = _day(shift - 2);
    final b = Brand(id: 'b-$id', name: brand, handle: handle);
    return Campaign(
      id: id,
      type: type,
      brand: b,
      title: title,
      category: category,
      meta: meta,
      worth: worth,
      spotsLeft: spotsLeft,
      spotsTotal: spotsTotal,
      credits: credits,
      youGet: youGet,
      youGetShort: youGetShort,
      contentShort:
          contentShort ??
          switch (type) {
            CampaignType.barter => 'Script + 1 Reel + 1 Story',
            CampaignType.drop => 'Optional, no approval needed',
            CampaignType.event => 'Script + promo reel',
            CampaignType.offer => 'Script + 1 Reel',
          },
      criteria:
          criteria ??
          switch (type) {
            CampaignType.barter => [
              '1 Reel, 30–60 sec, following the brief',
              'Tag $handle',
              '1 Story with the product link',
              'Upload within 5 days of delivery',
              'Keep the post up for at least 30 days',
            ],
            CampaignType.drop => [
              'Unboxing or first reaction, any length',
              'Tag $handle',
              'Your own style, no script (UGC)',
            ],
            CampaignType.event => [
              '1 promo Reel, 30–45 sec, before the event',
              'Mention date and venue',
              'Tag $handle',
            ],
            CampaignType.offer => [
              '1 Reel about your experience',
              'Mention the creator offer in the first 5 sec',
              'Tag $handle',
            ],
          },
      brief: type == CampaignType.drop
          ? null
          : brief ?? 'Keep it natural and personal. Show the product in use.',
      eligibility:
          eligibility ??
          [
            'UAE-based',
            '$category or lifestyle',
            'Any follower count',
            'Instagram or TikTok',
          ],
      deliverables: _deliverables[type]!,
      materials:
          materials ??
          ['${brand.split(' ').first}_logo.png', 'Brand_guidelines.pdf'],
      contentReuse: type == CampaignType.barter || type == CampaignType.offer,
      timeline: timeline,
      howItWorks: _steps[type]!,
      agreement: _agreements[type]!,
      afterApply:
          '$brand decides by ${TmDates.short(decideBy)}. '
          '$credits credits are on hold until then, refunded if not approved.',
      isOpen: isOpen,
    );
  }

  late final List<Campaign> campaigns = [
    // ---- open (Home) ----
    _campaign(
      id: 'glowhaus-vitc',
      type: CampaignType.barter,
      brand: 'Glowhaus Skincare',
      handle: '@glowhaus',
      title: 'Vitamin C serum kit',
      category: 'Beauty',
      meta: 'Beauty · product sent to you',
      worth: 'AED 220',
      credits: 8,
      spotsLeft: 20,
      youGet:
          'The full Vitamin C kit (serum, toner, SPF), yours to keep. '
          'Delivered free to your confirmed address after your script is '
          'approved.',
      youGetShort: 'Full kit to keep, worth AED 220',
      criteria: const [
        '1 Reel, 30–60 sec, showing your routine',
        'Tag @glowhaus and use #GlowhausGlow',
        '1 Story with the product link',
        'Upload within 5 days of delivery',
        'Keep the post up for at least 30 days',
      ],
      brief:
          'Show your morning routine with the kit: cleanse, serum, SPF. '
          'Talk about how your skin feels after a week. Natural light, no '
          'filters.',
      eligibility: const [
        'UAE address',
        'Beauty or lifestyle',
        '1K–50K followers',
        'Instagram or TikTok',
      ],
      materials: const [
        'Glowhaus_logo.png',
        'Product_photos.zip',
        'Brand_guidelines.pdf',
        'Background_track.mp3',
      ],
    ),
    _campaign(
      id: 'aero-earbuds',
      type: CampaignType.barter,
      brand: 'Aero Audio',
      handle: '@aeroaudio',
      title: 'Wireless earbuds',
      category: 'Tech',
      meta: 'Tech · product sent to you',
      worth: 'AED 450',
      credits: 14,
      youGet: 'Wireless earbuds, yours to keep.',
      youGetShort: 'Earbuds to keep, worth AED 450',
      contentShort: 'Script + 2 Reels',
    ),
    _campaign(
      id: 'noor-cookies',
      type: CampaignType.drop,
      brand: 'Noor Bakehouse',
      handle: '@noorbakehouse',
      title: 'Signature cookie box',
      category: 'Food',
      meta: 'Food · content optional',
      worth: 'AED 150',
      credits: 3,
      spotsLeft: 30,
      spotsTotal: 50,
      youGet:
          'A box of 12 signature cookies, yours to keep. Delivered free '
          'to your confirmed address.',
      youGetShort: 'Box of 12, worth AED 150',
      criteria: const [
        'Unboxing or first-bite reaction, any length',
        'Tag @noorbakehouse',
        'Your own style, no script (UGC)',
      ],
      eligibility: const [
        'UAE address',
        'Food or lifestyle',
        'Any follower count',
        'Instagram or TikTok',
      ],
      materials: const ['Noor_logo.png', 'Box_photos.zip'],
    ),
    _campaign(
      id: 'lumi-candles',
      type: CampaignType.drop,
      brand: 'Lumi Candles',
      handle: '@lumicandles',
      title: 'Scented candle set',
      category: 'Home',
      meta: 'Home · content optional',
      worth: 'AED 180',
      credits: 3,
      spotsLeft: 50,
      spotsTotal: 80,
      youGet: 'A set of 3 scented candles, yours to keep.',
      youGetShort: '3 candles, worth AED 180',
      contentShort: 'Optional UGC',
    ),
    _campaign(
      id: 'skyline-jazz',
      type: CampaignType.event,
      brand: 'Skyline Lounge',
      handle: '@skylinelounge',
      title: 'Rooftop Jazz Night',
      category: 'Music',
      meta: 'Music · Downtown',
      worth: 'AED 300',
      credits: 10,
      spotsLeft: 12,
      spotsTotal: 20,
      youGet:
          'Entry for you + 1. Your entry code and QR are generated in '
          'TagMe once your promo video is approved.',
      youGetShort: 'Entry code for 2, in the app',
      criteria: const [
        '1 promo Reel, 30–45 sec, before the event',
        'Mention date and venue',
        'Tag @skylinelounge',
        'Upload before the deliverables date',
      ],
      brief:
          'Hype the night: show the rooftop and band line-up, mention the '
          'date, end with "limited spots, link in bio".',
      eligibility: const [
        'Dubai-based',
        'Music or lifestyle',
        '2K–80K followers',
        'Instagram',
      ],
      materials: const [
        'Skyline_logo.png',
        'Lineup_poster.jpg',
        'Venue_map.pdf',
      ],
    ),
    _campaign(
      id: 'marina-food',
      type: CampaignType.event,
      brand: 'Marina Food Fest',
      handle: '@marinafoodfest',
      title: 'Preview night',
      category: 'Food',
      meta: 'Food · 3-day festival',
      worth: 'AED 400',
      credits: 15,
      youGet: 'VIP entry code for 2 to the preview night.',
      youGetShort: 'VIP entry code for 2',
      contentShort: 'Script + 1 Reel + 2 Stories',
    ),
    _campaign(
      id: 'aura-facial',
      type: CampaignType.offer,
      brand: 'Aura Clinic',
      handle: '@auraclinic',
      title: '30% off a glow facial',
      category: 'Wellness',
      meta: 'Wellness · Jumeirah',
      worth: '30% off',
      credits: 4,
      spotsLeft: 25,
      youGet:
          'A 30% coupon with QR, unlocked in TagMe once your reel is '
          'approved. Use it when you book.',
      youGetShort: '30% coupon with QR, after approval',
      criteria: const [
        '1 Reel about your skincare routine',
        'Mention the 30% creator offer in the first 5 sec',
        'Tag @auraclinic',
      ],
      brief:
          'Short, honest reel on your routine and why you want the facial. '
          'Mention the 30% TagMe offer clearly.',
      materials: const [
        'Aura_logo.png',
        'Offer_card.jpg',
        'Clinic_guidelines.pdf',
      ],
    ),
    _campaign(
      id: 'brewlab-coffee',
      type: CampaignType.offer,
      brand: 'Brew Lab',
      handle: '@brewlab',
      title: 'Free coffee all week',
      category: 'Café',
      meta: 'Café · 4 branches',
      worth: '7 coffees',
      credits: 3,
      spotsLeft: 100,
      spotsTotal: 150,
      youGet: 'A voucher for one free coffee a day for 7 days, at any branch.',
      youGetShort: 'Voucher with QR, after approval',
    ),

    // ---- closed (only referenced by past / ongoing collabs) ----
    for (final (id, type, brand, handle, title, category) in const [
      (
        'kora-tote',
        CampaignType.barter,
        'Kora Studio',
        '@korastudio',
        'Linen tote bag',
        'Fashion',
      ),
      (
        'verde-brush',
        CampaignType.barter,
        'Verde Living',
        '@verdeliving',
        'Bamboo brush set',
        'Home',
      ),
      (
        'micdrop-standup',
        CampaignType.event,
        'Mic Drop Club',
        '@micdropclub',
        'Stand-up special',
        'Comedy',
      ),
      (
        'laughlab-comedy',
        CampaignType.event,
        'The Laugh Lab',
        '@thelaughlab',
        'Comedy night',
        'Comedy',
      ),
      (
        'glowhaus-liptint',
        CampaignType.barter,
        'Glowhaus Skincare',
        '@glowhaus',
        'Lip tint set',
        'Beauty',
      ),
      (
        'velo-launch',
        CampaignType.event,
        'Velo Motors',
        '@velomotors',
        'Car launch night',
        'Auto',
      ),
      (
        'leaf-tea',
        CampaignType.drop,
        'Leaf & Co',
        '@leafandco',
        'Herbal tea sampler',
        'Food',
      ),
      (
        'hydra-bottle',
        CampaignType.barter,
        'Hydra',
        '@hydra',
        'Smart water bottle',
        'Fitness',
      ),
      (
        'zest-juice',
        CampaignType.barter,
        'Zest Juicery',
        '@zestjuicery',
        'Cold-press juice pack',
        'Food',
      ),
      (
        'oliveoak-brunch',
        CampaignType.offer,
        'Olive & Oak',
        '@oliveandoak',
        '1+1 brunch offer',
        'Food',
      ),
      (
        'atelier-pass',
        CampaignType.event,
        'Atelier DXB',
        '@atelierdxb',
        'Fashion week pass',
        'Fashion',
      ),
      (
        'fitbite-box',
        CampaignType.barter,
        'FitBite',
        '@fitbite',
        'Protein snack box',
        'Fitness',
      ),
    ])
      _campaign(
        id: id,
        type: type,
        brand: brand,
        handle: handle,
        title: title,
        category: category,
        worth: 'AED 150',
        credits: type == CampaignType.drop ? 3 : 8,
        youGet: '$title, yours to keep.',
        youGetShort: title,
        isOpen: false,
      ),
  ];

  Campaign campaign(String id) => campaigns.firstWhere((c) => c.id == id);

  // ---------------------------------------------------------------------
  // Deals (one or more in every state, matching "My collabs")
  // ---------------------------------------------------------------------

  Deal _deal(
    String campaignId,
    DealStage stage, {
    required List<DealEvent> log,
    String? addressId,
    Delivery? delivery,
    List<ChatMessage> chat = const [],
    int scriptVersion = 1,
    int contentRound = 1,
    int scriptRejections = 0,
    int contentRejections = 0,
    IssuedCode? code,
    bool? madeContent,
    String? endReason,
    bool strike = false,
    List<String> contentFiles = const [],
  }) {
    final c = campaign(campaignId);
    return Deal(
      id: 'd-$campaignId',
      campaignId: campaignId,
      type: c.type,
      title: c.title,
      brandName: c.brand.name,
      stage: stage,
      credits: c.credits,
      addressId: addressId,
      delivery: delivery,
      chat: chat,
      scriptVersion: scriptVersion,
      contentRound: contentRound,
      scriptRejections: scriptRejections,
      contentRejections: contentRejections,
      code: code,
      madeContent: madeContent,
      endReason: endReason,
      strike: strike,
      contentFiles: contentFiles,
      log: log,
      appliedAt: log.last.at,
      updatedAt: log.first.at,
    );
  }

  DealEvent _you(String t, DateTime at) =>
      DealEvent(actor: Actor.you, text: t, at: at);
  DealEvent _brand(String t, DateTime at) =>
      DealEvent(actor: Actor.brand, text: t, at: at);

  Delivery _delivery(String campaignId, DeliveryStatus status) => Delivery(
    status: status,
    courier: 'Aramex',
    trackingUrl: 'https://www.aramex.com/',
    trackingNo: status.index >= DeliveryStatus.shipped.index
        ? 'AR40571288'
        : null,
    deliverBy: campaign(campaignId).dateOf(KeyDateKind.deliverBy)!,
    attempts: status.index >= DeliveryStatus.shipped.index ? 1 : 0,
  );

  late final List<Deal> deals = [
    // ---- Applied ----
    _deal(
      'aero-earbuds',
      DealStage.applied,
      log: [_you('Applied · credits held', _ago(days: 1))],
    ),
    _deal(
      'lumi-candles',
      DealStage.applied,
      log: [_you('Requested · credits held', _ago(days: 2))],
    ),

    // ---- Ongoing: rejected, needs a fix ----
    _deal(
      'kora-tote',
      DealStage.script,
      addressId: 'a-home',
      delivery: _delivery('kora-tote', DeliveryStatus.hold),
      scriptVersion: 2,
      scriptRejections: 1,
      chat: [
        ChatMessage(
          id: 'm-kora-1',
          from: Actor.brand,
          text:
              'The script reads like an ad. Please make it personal: your '
              'real routine and how it fits your day.',
          sentAt: _ago(hours: 1),
          tag: 'Changes requested',
        ),
      ],
      log: [
        _brand('Rejected script v1 · see chat', _ago(hours: 1)),
        _you('Sent script v1 for approval', _ago(days: 1)),
        _you('Confirmed delivery address · Home, Al Barsha', _ago(days: 3)),
        _brand('Approved your application', _ago(days: 3)),
        _you('Applied · credits held', _ago(days: 5)),
      ],
    ),
    _deal(
      'verde-brush',
      DealStage.upload,
      addressId: 'a-home',
      delivery: _delivery('verde-brush', DeliveryStatus.received),
      contentRound: 2,
      contentRejections: 1,
      contentFiles: const ['Verde_reel.mp4'],
      chat: [
        ChatMessage(
          id: 'm-verde-1',
          from: Actor.brand,
          text:
              "Lighting is too dark and the label isn't visible. Please "
              'reshoot in daylight.',
          sentAt: _ago(hours: 2),
          tag: 'Changes requested',
          videoTimestamp: '0:12',
          attachment: 'screenshot_0-12.jpg',
        ),
      ],
      log: [
        _brand('Rejected the reels · see chat', _ago(hours: 2)),
        _you('Sent reels (round 1) for review', _ago(days: 1)),
        _you('Received the kit', _ago(days: 4)),
        _brand('Approved your script', _ago(days: 6)),
        _brand('Approved your application', _ago(days: 8)),
        _you('Applied · credits held', _ago(days: 10)),
      ],
    ),
    _deal(
      'micdrop-standup',
      DealStage.upload,
      contentRound: 2,
      contentRejections: 1,
      contentFiles: const ['Standup_promo.mp4'],
      chat: [
        ChatMessage(
          id: 'm-mic-1',
          from: Actor.brand,
          text:
              'Audio is hard to hear. Please add captions or a voiceover '
              'and re-upload.',
          sentAt: _ago(hours: 3),
          tag: 'Changes requested',
          videoTimestamp: '0:08',
        ),
      ],
      log: [
        _brand('Rejected the video · see chat', _ago(hours: 3)),
        _you('Sent video (round 1) for review', _ago(days: 1)),
        _brand('Approved your script', _ago(days: 3)),
        _brand('Approved your application', _ago(days: 5)),
        _you('Applied · credits held', _ago(days: 7)),
      ],
    ),

    // ---- Ongoing: your turn ----
    _deal(
      'glowhaus-vitc',
      DealStage.address,
      delivery: _delivery('glowhaus-vitc', DeliveryStatus.hold),
      log: [
        _brand('Approved your application', _ago(minutes: 30)),
        _you('Applied · credits held', _ago(days: 2)),
      ],
    ),
    _deal(
      'noor-cookies',
      DealStage.address,
      delivery: _delivery('noor-cookies', DeliveryStatus.hold),
      log: [
        _brand('Approved your request', _ago(hours: 5)),
        _you('Requested · credits held', _ago(days: 2)),
      ],
    ),
    _deal(
      'skyline-jazz',
      DealStage.script,
      log: [
        _brand('Approved your application', _ago(hours: 8)),
        _you('Applied · credits held', _ago(days: 2)),
      ],
    ),
    _deal(
      'aura-facial',
      DealStage.script,
      log: [
        _brand('Accepted your request', _ago(days: 1)),
        _you('Applied · credits held', _ago(days: 3)),
      ],
    ),

    // ---- Ongoing: waiting on brand ----
    _deal(
      'laughlab-comedy',
      DealStage.contentReview,
      contentFiles: const ['Comedy_promo.mp4'],
      log: [
        _you('Sent video (round 1) for review', _ago(hours: 5)),
        _brand('Approved your script', _ago(days: 2)),
        _brand('Approved your application', _ago(days: 4)),
        _you('Applied · credits held', _ago(days: 6)),
      ],
    ),

    // ---- Done ----
    _deal(
      'brewlab-coffee',
      DealStage.voucher,
      code: IssuedCode(
        kind: CodeKind.voucher,
        code: 'BREW-TM-5520',
        howToUse: 'Show the QR at any Brew Lab counter. One coffee a day.',
        validUntil: _day(35),
      ),
      log: [
        _brand('Approved your reel · voucher issued', _ago(days: 3)),
        _you('Sent reel (round 1) for review', _ago(days: 4)),
        _brand('Approved your script', _ago(days: 6)),
        _brand('Accepted your request', _ago(days: 8)),
        _you('Applied · credits held', _ago(days: 9)),
      ],
    ),
    _deal(
      'glowhaus-liptint',
      DealStage.done,
      addressId: 'a-home',
      delivery: _delivery('glowhaus-liptint', DeliveryStatus.received),
      log: [
        _brand('Approved your reels', _ago(days: 12)),
        _you('Applied · credits held', _ago(days: 30)),
      ],
    ),
    _deal(
      'velo-launch',
      DealStage.done,
      code: IssuedCode(
        kind: CodeKind.entryCode,
        code: 'TM-EVT-0884',
        howToUse: 'Show the QR at the entrance.',
        redeemedAt: _ago(days: 15),
      ),
      log: [
        _brand(
          'Entry code scanned at the venue · collab complete',
          _ago(days: 15),
        ),
        _you('Applied · credits held', _ago(days: 28)),
      ],
    ),
    _deal(
      'leaf-tea',
      DealStage.done,
      addressId: 'a-home',
      madeContent: true,
      contentFiles: const ['Tea_unboxing.mp4', 'Tea_story.mp4'],
      delivery: _delivery('leaf-tea', DeliveryStatus.received),
      log: [
        _you('Uploaded 2 file(s) · deal finished', _ago(days: 20)),
        _you('Requested · credits held', _ago(days: 30)),
      ],
    ),

    // ---- Closed ----
    _deal(
      'hydra-bottle',
      DealStage.notApproved,
      log: [
        _brand('Picked other creators · credits refunded', _ago(days: 14)),
        _you('Applied · credits held', _ago(days: 18)),
      ],
    ),
    _deal(
      'zest-juice',
      DealStage.ended,
      endReason: 'Logo not visible in both rounds',
      log: [
        _brand(
          'Ended the collaboration · Logo not visible in both rounds',
          _ago(days: 20),
        ),
        _you('Applied · credits held', _ago(days: 35)),
      ],
    ),
    _deal(
      'oliveoak-brunch',
      DealStage.notApproved,
      log: [
        _brand('Offer filled · credits refunded', _ago(days: 22)),
        _you('Applied · credits held', _ago(days: 25)),
      ],
    ),
    _deal(
      'atelier-pass',
      DealStage.expired,
      log: [
        DealEvent(
          text: "Script not sent before the brand's deadline",
          at: _ago(days: 24),
        ),
        _you('Applied · credits held', _ago(days: 32)),
      ],
    ),
    _deal(
      'fitbite-box',
      DealStage.ended,
      endReason: "Didn't finish the shoot by the deadline",
      strike: true,
      log: [
        _brand(
          "Ended the collaboration · Didn't finish the shoot by the "
          'deadline',
          _ago(days: 26),
        ),
        _you('Applied · credits held', _ago(days: 40)),
      ],
    ),
  ];

  // ---------------------------------------------------------------------
  // Creator, wallet, notifications
  // ---------------------------------------------------------------------

  Creator get creator => const Creator(
    id: 'cr-20481',
    name: 'Sara Al Mansoori',
    country: 'UAE',
    city: 'Dubai',
    whatsapp: '+971 50 123 4567',
    categories: ['Food', 'Lifestyle'],
    socials: [
      SocialAccount(
        platform: 'Instagram',
        handle: '@sara.eats',
        verified: true,
        followers: 8400,
        engagement: 4.1,
      ),
    ],
    addresses: [
      Address(
        id: 'a-home',
        label: 'Home',
        recipient: 'Sara Al Mansoori',
        line: 'Villa 12, Street 4, Al Barsha 2, Dubai',
        short: 'Home, Al Barsha',
        phone: '+971 50 123 4567',
      ),
      Address(
        id: 'a-work',
        label: 'Work',
        recipient: 'Sara Al Mansoori',
        line: 'Office 1804, Cluster X, JLT, Dubai',
        short: 'Work, JLT',
        phone: '+971 50 123 4567',
      ),
    ],
    strikes: 1,
    creatorCode: 'TM-CR-20481',
  );

  /// Credits held by the two "Applied" deals.
  Map<String, int> get holds => {
    for (final d in deals.where((d) => d.stage == DealStage.applied))
      d.id: d.credits,
  };

  /// Placeholder numbers until credit pricing is decided.
  Wallet get wallet {
    final held = holds.values.fold(0, (a, b) => a + b);
    final welcomeAt = _ago(days: 21);
    final referralAt = _ago(days: 20);
    DateTime yearLater(DateTime d) => DateTime(d.year + 1, d.month, d.day);
    return Wallet(
      available: 42,
      onHold: held,
      holds: holds.length,
      referralCode: 'SARA-TM25',
      history: [
        for (final d in deals.where((d) => d.stage == DealStage.applied))
          CreditTxn(
            id: 'txn-seed-${d.id}',
            kind: TxnKind.hold,
            amount: -d.credits,
            title: 'Applied · ${d.title}',
            note: '${TmDates.short(d.appliedAt)} · on hold',
            at: d.appliedAt,
            dealId: d.id,
          ),
        CreditTxn(
          id: 'txn-seed-hydra',
          kind: TxnKind.refund,
          amount: 8,
          title: 'Refund · Smart water bottle',
          note: '${TmDates.short(_ago(days: 14))} · not approved',
          at: _ago(days: 14),
          dealId: 'd-hydra-bottle',
        ),
        CreditTxn(
          id: 'txn-seed-ref',
          kind: TxnKind.referral,
          amount: 10,
          title: 'Referral · Maya joined with your code',
          note:
              '${TmDates.short(referralAt)} · valid till '
              '${TmDates.long(yearLater(referralAt))}',
          at: referralAt,
          expiresAt: yearLater(referralAt),
        ),
        CreditTxn(
          id: 'txn-seed-welcome',
          kind: TxnKind.welcomeBonus,
          amount: 50,
          title: 'Welcome bonus · AED 50',
          note:
              '${TmDates.short(welcomeAt)} · valid till '
              '${TmDates.long(yearLater(welcomeAt))}',
          at: welcomeAt,
          expiresAt: yearLater(welcomeAt),
        ),
      ],
    );
  }

  List<AppNotification> get notifications => [
    AppNotification(
      id: 'n-1',
      title: 'Glowhaus approved your application',
      body: 'Barter · confirm your address to start',
      urgent: true,
      actionLabel: 'Confirm address',
      link: '/deals/d-glowhaus-vitc',
      at: _ago(minutes: 30),
    ),
    AppNotification(
      id: 'n-2',
      title: 'Kora Studio rejected your script',
      body: 'Barter · see why in the chat',
      urgent: true,
      actionLabel: 'Open chat',
      link: '/deals/d-kora-tote',
      at: _ago(hours: 1),
    ),
    AppNotification(
      id: 'n-3',
      title: 'Brew Lab approved your reel. Voucher ready',
      link: '/vouchers?deal=d-brewlab-coffee',
      at: _ago(days: 3),
      read: true,
    ),
    AppNotification(
      id: 'n-4',
      title: 'The Laugh Lab is reviewing your promo video',
      link: '/deals/d-laughlab-comedy',
      at: _ago(hours: 5),
      read: true,
    ),
    AppNotification(
      id: 'n-5',
      title: 'Noor Bakehouse approved your request. Confirm address',
      link: '/deals/d-noor-cookies',
      at: _ago(hours: 5),
      read: true,
    ),
    AppNotification(
      id: 'n-6',
      title: 'Credits refunded: Hydra picked other creators',
      link: '/credits',
      at: _ago(days: 14),
      read: true,
    ),
  ];
}
