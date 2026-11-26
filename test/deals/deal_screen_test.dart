import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:tag_me/app/routes.dart';
import 'package:tag_me/core/widgets/widgets.dart';
import 'package:tag_me/features/deals/domain/deal.dart';

import '../helpers.dart';

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  group('My collabs', () {
    testWidgets('shows the seeded counts and the rejection banner', (t) async {
      await pumpApp(t);
      await t.tap(find.text('Collabs'));
      await t.pumpAndSettle();

      expect(find.text('3 rejected · needs your fix'), findsOneWidget);
      // Applied 2 · Ongoing 8 · Done 4 · Closed 5
      for (final n in ['2', '8', '4', '5']) {
        expect(find.text(n), findsWidgets);
      }
      // Ongoing is sorted: rejections first.
      expect(find.text('✕ SCRIPT REJECTED'), findsOneWidget);
    });

    testWidgets('tabs and type filter narrow the list', (t) async {
      await pumpApp(t);
      await t.tap(find.text('Collabs'));
      await t.pumpAndSettle();

      await t.tap(find.text('Closed'));
      await t.pumpAndSettle();
      expect(find.text('Smart water bottle'), findsOneWidget);

      await t.tap(find.text('Exclusive offer · 1'));
      await t.pumpAndSettle();
      expect(find.text('1+1 brunch offer'), findsOneWidget);
      expect(find.text('Smart water bottle'), findsNothing);
    });
  });

  group('Deal screen', () {
    testWidgets('address → script → in review', (t) async {
      final b = await pumpApp(t);
      await openRoute(t, Routes.deal('d-glowhaus-vitc'));
      expect(find.text('Confirm your delivery address'), findsOneWidget);
      expect(find.text('Step 1 of 8'), findsOneWidget);

      await tapText(t, 'Home · Sara Al Mansoori');
      await tapText(t, 'Confirm this address');
      expect(b.deals.find('d-glowhaus-vitc')!.stage, DealStage.script);
      expect(find.text('Write your script'), findsOneWidget);

      await t.enterText(
        find.byType(TextField).first,
        'Scene 1: morning routine',
      );
      await tapText(t, 'Send script v1 to brand');
      expect(find.text('Script in review'), findsOneWidget);
      expect(b.deals.find('d-glowhaus-vitc')!.stage, DealStage.scriptReview);
    });

    testWidgets('rejected script shows the brand reason in chat', (t) async {
      await pumpApp(t);
      await openRoute(t, Routes.deal('d-kora-tote'));
      expect(find.text('Rework your script'), findsOneWidget);
      await scrollTo(t, 'Changes requested');
      expect(find.textContaining('reads like an ad'), findsOneWidget);
    });

    testWidgets('delivery: received moves to shoot, undo moves back', (
      t,
    ) async {
      final b = await pumpApp(t);
      // Put the barter deal into delivery, shipped.
      final repo = b.deals;
      await repo.confirmAddress('d-glowhaus-vitc', 'a-home');
      await repo.submitScript('d-glowhaus-vitc', 'x');
      repo.brandReviewScript('d-glowhaus-vitc', approve: true);
      repo.sim.enabled = true;
      repo.sim.shippingStep = Duration.zero;
      repo.brandShip('d-glowhaus-vitc');
      repo.sim.enabled = false;

      await openRoute(t, Routes.deal('d-glowhaus-vitc'));
      await t.pump(const Duration(milliseconds: 50));
      await t.pumpAndSettle();
      expect(find.text('Your order is on its way'), findsOneWidget);

      await tapText(t, "I've received it");
      expect(find.text('Shoot your reels'), findsOneWidget);

      await tapText(t, 'Undo');
      expect(find.text('Your order is on its way'), findsOneWidget);
    });

    testWidgets('upload needs a file before sending', (t) async {
      final b = await pumpApp(t);
      await openRoute(t, Routes.deal('d-verde-brush'));
      expect(find.text('Re-upload after the fix'), findsOneWidget);

      await scrollTo(t, 'Send round 2 to brand');
      final send = t.widget<TmButton>(
        find.widgetWithText(TmButton, 'Send round 2 to brand'),
      );
      expect(send.onPressed, isNull, reason: 'no file added yet');
      await tapText(t, '+ Add reels, videos or posters');
      await tapText(t, 'Send round 2 to brand');
      expect(b.deals.find('d-verde-brush')!.stage, DealStage.contentReview);
    });

    testWidgets('voucher: code shown; brand scan completes it', (t) async {
      final b = await pumpApp(t);
      await openRoute(t, Routes.deal('d-brewlab-coffee'));
      expect(find.text('BREW-TM-5520'), findsOneWidget);

      b.deals.brandRedeemCode('d-brewlab-coffee');
      await t.pumpAndSettle();
      expect(find.text('Completed!'), findsOneWidget);
    });

    testWidgets('ended collab shows the reason and the strike', (t) async {
      await pumpApp(t);
      await openRoute(t, Routes.deal('d-fitbite-box'));
      expect(find.textContaining("Didn't finish the shoot"), findsWidgets);
      expect(find.textContaining('strike'), findsWidgets);
      expect(
        find.text('Write to FitBite…'),
        findsNothing,
        reason: 'no chat on closed collabs',
      );
    });

    testWidgets('chat: sending adds a bubble', (t) async {
      final b = await pumpApp(t);
      await openRoute(t, Routes.deal('d-skyline-jazz'));
      await reveal(t, find.byTooltip('Send'));
      // Fields on this page: the script, then the chat box.
      await t.enterText(find.byType(TextField).last, 'Can I film at night?');
      await t.tap(find.byTooltip('Send'));
      await t.pumpAndSettle();
      expect(
        b.deals.find('d-skyline-jazz')!.chat.last.text,
        'Can I film at night?',
      );
      expect(find.text('Can I film at night?'), findsOneWidget);
    });
  });
}
