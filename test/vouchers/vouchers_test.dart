import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'package:tag_me/app/mock/mock_backend.dart';
import 'package:tag_me/app/mock/seed_data.dart';
import 'package:tag_me/app/routes.dart';
import 'package:tag_me/core/widgets/widgets.dart';
import 'package:tag_me/features/deals/data/mock_deal_repository.dart';
import 'package:tag_me/features/deals/domain/deal.dart';
import 'package:tag_me/features/onboarding/application/session_controller.dart';
import 'package:tag_me/features/vouchers/domain/usecases/voucher_usecases.dart';
import 'package:tag_me/features/vouchers/domain/voucher.dart';

import '../helpers.dart';

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  final now = DateTime(2026, 11, 26, 10);
  final seed = SeedData(now);
  Deal deal(String c) => seed.deals.firstWhere((d) => d.campaignId == c);

  group('Voucher (domain)', () {
    test('built only for collabs with a code', () {
      expect(Voucher.fromDeal(deal('skyline-jazz'), null), isNull);
      final v = Voucher.fromDeal(
        deal('brewlab-coffee'),
        seed.campaign('brewlab-coffee'),
      )!;
      expect(v.code, 'BREW-TM-5520');
      expect(v.where, '4 branches');
    });

    test('used or expired codes are not usable', () {
      final used = Voucher.fromDeal(deal('velo-launch'), null)!;
      expect(used.isUsable(now), isFalse);

      final brew = Voucher.fromDeal(deal('brewlab-coffee'), null)!;
      expect(brew.isUsable(now), isTrue);
      final lastDay = brew.validUntil!;
      expect(
        brew.isUsable(lastDay.add(const Duration(hours: 20))),
        isTrue,
        reason: 'valid through the whole last day',
      );
      expect(brew.isUsable(lastDay.add(const Duration(days: 1))), isFalse);
    });

    test('event entry carries the event day and admits two', () {
      final d = deal('skyline-jazz').copyWith(
        stage: DealStage.voucher,
        code: const IssuedCode(
          kind: CodeKind.entryCode,
          code: 'TM-EVT-1',
          howToUse: 'Show it',
        ),
      );
      final c = seed.campaign('skyline-jazz');
      final v = Voucher.fromDeal(d, c)!;
      expect(v.eventDate, isNotNull);
      expect(v.admits, 2);
    });
  });

  test('WatchUsableVouchers lists only usable codes', () async {
    final b = MockBackend(simulation: BrandSimulation()..enabled = false);
    addTearDown(b.dispose);
    final list = await WatchUsableVouchers(
      deals: b.deals,
      campaigns: b.campaigns,
      now: DateTime.now,
    )().first;
    expect(list.map((v) => v.dealId), [
      'd-brewlab-coffee',
    ], reason: 'the Velo entry code was already scanned');
  });

  group('Vouchers screen', () {
    testWidgets('shows the ticket with a QR code', (t) async {
      await pumpApp(t);
      await openRoute(t, Routes.voucher('d-brewlab-coffee'));
      expect(find.text('Free coffee all week'), findsOneWidget);
      expect(find.text('BREW-TM-5520'), findsOneWidget);
      expect(find.byType(QrImageView), findsOneWidget);
    });

    testWidgets('a new code appears once the brand approves', (t) async {
      final b = await pumpApp(t);
      // Take the Skyline event deal to an approved video.
      final r = b.deals;
      await r.submitScript('d-skyline-jazz', 'Script');
      r.brandReviewScript('d-skyline-jazz', approve: true);
      await r.shootDone('d-skyline-jazz');
      await r.submitContent('d-skyline-jazz', ['promo.mp4']);
      r.brandReviewContent('d-skyline-jazz', approve: true);

      await openRoute(t, Routes.voucher('d-skyline-jazz'));
      expect(find.text('Rooftop Jazz Night'), findsWidgets);
      expect(find.text('You + 1'), findsOneWidget);
      // Both codes are listed as chips to switch between.
      expect(
        find.widgetWithText(TmFilterChip, 'Free coffee all week'),
        findsOneWidget,
      );
    });

    testWidgets('empty state when there are no codes', (t) async {
      await pumpApp(
        t,
        SessionStatus.verified,
        MockBackend(
          simulation: BrandSimulation()..enabled = false,
          seedDeals: false,
        ),
      );
      await openRoute(t, Routes.vouchers);
      expect(find.text('No codes yet'), findsOneWidget);
    });
  });
}
