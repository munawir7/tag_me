import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tag_me/app/mock/mock_backend.dart';
import 'package:tag_me/app/mock/seed_data.dart';
import 'package:tag_me/features/deals/data/mock_deal_repository.dart';
import 'package:tag_me/features/deals/domain/deal.dart';
import 'package:tag_me/features/deals/domain/deal_repository.dart';
import 'package:tag_me/features/wallet/data/mock_wallet_repository.dart';
import 'package:tag_me/features/wallet/domain/wallet.dart';

final _start = DateTime(2026, 11, 26, 10);

/// Runs [body] with a fake clock and a backend with no seeded collabs, so
/// every campaign can be applied to.
void _run(
  void Function(FakeAsync async, MockBackend b) body, {
  bool rejectFirst = true,
  bool autoApprove = true,
}) {
  fakeAsync((async) {
    final b = MockBackend(
      now: () => _start.add(async.elapsed),
      seedDeals: false,
      simulation: BrandSimulation()
        ..rejectFirst = rejectFirst
        ..autoApproveApplications = autoApprove,
    );
    body(async, b);
    b.dispose();
    async.flushMicrotasks();
  });
}

/// Runs [f] to completion and returns the error it threw, if any.
Object? _errorOf(FakeAsync async, Future<Object?> f) {
  Object? error;
  f.then<void>(
    (_) {},
    onError: (Object e) {
      error = e;
    },
  );
  async.flushMicrotasks();
  return error;
}

const _reply = Duration(seconds: 4);
const _shipping = Duration(seconds: 6);

void main() {
  group('seed data', () {
    final seed = SeedData(_start);

    test('fills every "My collabs" tab like the prototype', () {
      int count(CollabBucket b) =>
          seed.deals.where((d) => d.bucket == b).length;
      expect(count(CollabBucket.applied), 2);
      expect(count(CollabBucket.ongoing), 8);
      expect(count(CollabBucket.done), 4);
      expect(count(CollabBucket.closed), 5);
      expect(seed.deals.where((d) => d.needsFix).length, 3);
    });

    test('every deal points at a real campaign', () {
      final ids = seed.campaigns.map((c) => c.id).toSet();
      for (final d in seed.deals) {
        expect(ids, contains(d.campaignId));
      }
    });
  });

  test('barter: full flow with one script and one content rejection', () {
    _run((async, b) {
      final deals = b.deals;
      deals.apply(b.campaigns.find('glowhaus-vitc')!);
      async.flushMicrotasks();
      final id = deals.current.single.id;
      expect(b.wallet.current.available, 42 - 8);
      expect(b.wallet.current.onHold, 8);

      async.elapse(_reply); // brand approves the application
      expect(deals.find(id)!.stage, DealStage.address);
      expect(b.wallet.current.onHold, 0, reason: 'credits spent on approval');
      expect(b.notifications.current.first.urgent, isTrue);

      deals.confirmAddress(id, 'a-home');
      deals.submitScript(id, 'Scene 1: my morning routine');
      async.elapse(_reply);
      var d = deals.find(id)!;
      expect(d.stage, DealStage.script, reason: 'first script rejected');
      expect(d.needsFix, isTrue);
      expect(d.scriptVersion, 2);
      expect(d.chat.last.from, Actor.brand);

      deals.submitScript(id, 'Scene 1: honest, personal version');
      async.elapse(_reply);
      expect(deals.find(id)!.stage, DealStage.delivery);

      async.elapse(_shipping); // brand ships
      d = deals.find(id)!;
      expect(d.delivery!.status, DeliveryStatus.outForDelivery);
      expect(d.delivery!.trackingNo, isNotNull);

      deals.markReceived(id);
      deals.shootDone(id);
      deals.submitContent(id, ['reel.mp4']);
      async.elapse(_reply);
      d = deals.find(id)!;
      expect(d.stage, DealStage.upload, reason: 'first content rejected');
      expect(d.chat.last.videoTimestamp, '0:12');

      deals.submitContent(id, ['reel_v2.mp4']);
      async.elapse(_reply);
      d = deals.find(id)!;
      expect(d.stage, DealStage.done);
      expect(d.bucket, CollabBucket.done);
    });
  });

  test('drop: ships after address, finishes without content or review', () {
    _run((async, b) {
      final deals = b.deals;
      deals.apply(b.campaigns.find('noor-cookies')!);
      async.flushMicrotasks();
      final id = deals.current.single.id;
      async.elapse(_reply);

      deals.confirmAddress(id, 'a-work');
      async.elapse(_shipping);
      expect(deals.find(id)!.delivery!.status, DeliveryStatus.outForDelivery);

      deals.markReceived(id);
      expect(deals.find(id)!.stage, DealStage.choose);
      deals.chooseContent(id, makeContent: false);
      final d = deals.find(id)!;
      expect(d.stage, DealStage.done);
      expect(d.madeContent, isFalse);
    });
  });

  test('event: approved video issues an entry code the brand scans', () {
    _run(rejectFirst: false, (async, b) {
      final deals = b.deals;
      deals.apply(b.campaigns.find('skyline-jazz')!);
      async.flushMicrotasks();
      final id = deals.current.single.id;
      async.elapse(_reply);
      expect(deals.find(id)!.stage, DealStage.script);

      deals.submitScript(id, 'Rooftop, band, date, limited spots');
      async.elapse(_reply);
      deals.shootDone(id);
      deals.submitContent(id, ['promo.mp4']);
      async.elapse(_reply);

      var d = deals.find(id)!;
      expect(d.stage, DealStage.voucher);
      expect(d.code!.kind, CodeKind.entryCode);
      expect(d.code!.validUntil, isNotNull);

      deals.brandRedeemCode(id);
      d = deals.find(id)!;
      expect(d.stage, DealStage.done);
      expect(d.code!.redeemedAt, isNotNull);
    });
  });

  test('not approved: credits are refunded', () {
    _run(autoApprove: false, (async, b) {
      b.deals.apply(b.campaigns.find('aero-earbuds')!);
      async.flushMicrotasks();
      final id = b.deals.current.single.id;
      expect(b.wallet.current.available, 42 - 14);

      b.deals.brandRejectApplication(id);
      expect(b.deals.find(id)!.bucket, CollabBucket.closed);
      expect(b.wallet.current.available, 42);
      expect(b.wallet.current.onHold, 0);
    });
  });

  test('cannot apply without enough credits, or twice', () {
    _run(autoApprove: false, (async, b) {
      for (final id in ['aero-earbuds', 'marina-food', 'skyline-jazz']) {
        b.deals.apply(b.campaigns.find(id)!);
      }
      expect(
        _errorOf(async, b.deals.apply(b.campaigns.find('glowhaus-vitc')!)),
        isA<InsufficientCreditsError>(),
      );
      expect(
        _errorOf(async, b.deals.apply(b.campaigns.find('aero-earbuds')!)),
        isA<DealActionError>(),
      );
    });
  });

  test('actions out of order are refused', () {
    _run((async, b) {
      b.deals.apply(b.campaigns.find('glowhaus-vitc')!);
      async.flushMicrotasks();
      final id = b.deals.current.single.id;
      async.elapse(_reply);

      expect(
        _errorOf(async, b.deals.submitScript(id, 'too early')),
        isA<DealActionError>(),
        reason: 'address comes first',
      );
    });
  });

  test('delivery problem: brand reships', () {
    _run(rejectFirst: false, (async, b) {
      final deals = b.deals;
      deals.apply(b.campaigns.find('noor-cookies')!);
      async.flushMicrotasks();
      final id = deals.current.single.id;
      async.elapse(_reply);
      deals.confirmAddress(id, 'a-home');
      async.elapse(_shipping);

      deals.reportDeliveryProblem(id, 'Not received');
      expect(deals.find(id)!.delivery!.status, DeliveryStatus.issue);
      async.elapse(_shipping);
      final del = deals.find(id)!.delivery!;
      expect(del.status, DeliveryStatus.outForDelivery);
      expect(del.attempts, 2);
      expect(del.issue, isNull);
    });
  });

  test('brand ending a collab with a strike adds it to the profile', () {
    _run((async, b) {
      b.deals.apply(b.campaigns.find('aura-facial')!);
      async.flushMicrotasks();
      final id = b.deals.current.single.id;
      async.elapse(_reply);

      b.deals.brandEndCollab(id, reason: 'No response', strike: true);
      expect(b.deals.find(id)!.stage, DealStage.ended);
      expect(b.profile.current.strikes, 2);
    });
  });

  test('chat: brand replies', () {
    _run((async, b) {
      b.deals.apply(b.campaigns.find('aura-facial')!);
      async.flushMicrotasks();
      final id = b.deals.current.single.id;
      async.elapse(_reply);

      b.deals.sendMessage(id, 'Can I film in the evening?');
      async.elapse(const Duration(seconds: 3));
      final chat = b.deals.find(id)!.chat;
      expect(chat.map((m) => m.from), [Actor.you, Actor.brand]);
    });
  });

  test('wallet: promo code works once, welcome bonus once', () {
    _run((async, b) {
      b.wallet.redeemPromo('tagme25');
      // The seeded creator already had the joining bonus.
      b.wallet.claimWelcomeBonus();
      async.flushMicrotasks();
      expect(b.wallet.current.available, 42 + 25);

      // A brand-new creator gets it exactly once.
      final fresh = MockWalletRepository(
        const Wallet(available: 0, onHold: 0, referralCode: 'NEW-TM1'),
        now: () => _start,
      );
      fresh.claimWelcomeBonus();
      fresh.claimWelcomeBonus();
      async.flushMicrotasks();
      expect(fresh.current.available, 50);

      expect(
        _errorOf(async, b.wallet.redeemPromo('TAGME25')),
        isNotNull,
        reason: 'each promo code works once',
      );
    });
  });
}
