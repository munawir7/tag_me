import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:tag_me/app/router.dart';
import 'package:tag_me/app/routes.dart';
import 'package:tag_me/core/widgets/widgets.dart';
import 'package:tag_me/features/deals/domain/deal.dart';
import 'package:tag_me/features/onboarding/application/session_controller.dart';

import 'helpers.dart';

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  group('redirectFor', () {
    test('signed out can only see public pages', () {
      expect(redirectFor(SessionStatus.signedOut, Routes.intro), isNull);
      expect(redirectFor(SessionStatus.signedOut, Routes.home), Routes.splash);
      expect(redirectFor(SessionStatus.signedOut, '/deals/x'), Routes.splash);
    });

    test('signed in without profile is held on profile setup', () {
      expect(
        redirectFor(SessionStatus.needsProfile, Routes.home),
        Routes.profileSetup,
      );
      expect(
        redirectFor(SessionStatus.needsProfile, Routes.profileSetup),
        isNull,
      );
    });

    test('under review can browse; onboarding pages go to review', () {
      expect(redirectFor(SessionStatus.underReview, Routes.home), isNull);
      expect(
        redirectFor(SessionStatus.underReview, Routes.register),
        Routes.review,
      );
    });

    test('verified skips onboarding', () {
      expect(redirectFor(SessionStatus.verified, Routes.splash), Routes.home);
      expect(redirectFor(SessionStatus.verified, '/deals/x'), isNull);
    });
  });

  testWidgets('Home lists campaigns for the selected type', (t) async {
    await pumpApp(t, SessionStatus.verified);
    expect(find.text('Barter deals in UAE'), findsOneWidget);
    expect(find.text('Vitamin C serum kit'), findsOneWidget);

    await t.tap(find.text('Event entry'));
    await t.pumpAndSettle();
    expect(find.text('Rooftop Jazz Night'), findsOneWidget);
    expect(find.text('Vitamin C serum kit'), findsNothing);
  });

  testWidgets('Apply to a campaign holds credits and shows Applied!', (
    t,
  ) async {
    final backend = await pumpApp(t, SessionStatus.verified);
    await t.tap(find.text('Event entry'));
    await t.pumpAndSettle();
    await tapText(t, 'Preview night');
    expect(find.text('Refunded if not approved'), findsOneWidget);

    await tapText(t, 'Apply now');
    expect(find.text('Confirm application'), findsOneWidget);
    await tapText(t, 'Spend 15 credits and apply');

    expect(find.text('Applied!'), findsOneWidget);
    expect(backend.wallet.current.available, 42 - 15);
    expect(
      backend.deals.current
          .where((d) => d.campaignId == 'marina-food')
          .single
          .stage,
      DealStage.applied,
    );

    await tapText(t, 'Keep browsing');
    // Back on Home (which keeps its scroll position).
    expect(find.text('Applied!'), findsNothing);
    expect(find.byType(TmBottomNav), findsOneWidget);
  });

  testWidgets('Already-applied campaign shows its state', (t) async {
    await pumpApp(t, SessionStatus.verified);
    await tapText(t, 'Wireless earbuds');
    expect(find.text('Applied · waiting on the brand'), findsOneWidget);
    expect(find.text('✓ Applied'), findsOneWidget);
  });

  testWidgets('Under review cannot apply', (t) async {
    await pumpApp(t, SessionStatus.underReview);
    expect(find.text('Account under review'), findsOneWidget);
    await t.tap(find.text('Event entry'));
    await t.pumpAndSettle();
    await tapText(t, 'Preview night');
    final apply = t.widget<TmButton>(
      find.widgetWithText(TmButton, 'Apply now'),
    );
    expect(apply.onPressed, isNull);
    expect(find.text('Unlocks after verification'), findsOneWidget);
  });

  testWidgets('Tabs switch, deals open full screen, back returns', (t) async {
    await pumpApp(t, SessionStatus.verified);

    await t.tap(find.text('Collabs'));
    await t.pumpAndSettle();
    expect(find.text('My collabs'), findsOneWidget);

    await tapText(t, 'Fix script and resend');
    expect(find.text('Rework your script'), findsOneWidget);
    expect(find.byType(TmBottomNav), findsNothing);

    await t.tap(find.byType(TmBackButton));
    await t.pumpAndSettle();
    expect(find.text('Fix script and resend'), findsOneWidget);
    expect(find.byType(TmBottomNav), findsOneWidget);
  });

  testWidgets('Log out returns to splash', (t) async {
    await pumpApp(t, SessionStatus.verified);
    await t.tap(find.text('Profile'));
    await t.pumpAndSettle();
    await tapText(t, 'Log out');
    expect(find.text('Collabs for every creator.'), findsOneWidget);
  });

  testWidgets('Disabled TmButton ignores taps', (t) async {
    await t.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: TmButton(label: 'Off', onPressed: null)),
      ),
    );
    await t.tap(find.text('Off'));
    expect(t.takeException(), isNull);
  });
}
