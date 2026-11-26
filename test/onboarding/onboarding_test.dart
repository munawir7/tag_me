import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:tag_me/app/app.dart';
import 'package:tag_me/app/mock/mock_backend.dart';
import 'package:tag_me/app/providers.dart';
import 'package:tag_me/core/widgets/widgets.dart';
import 'package:tag_me/features/deals/data/mock_deal_repository.dart';
import 'package:tag_me/features/onboarding/domain/profile_draft.dart';
import 'package:tag_me/features/onboarding/domain/regions.dart';
import 'package:tag_me/features/onboarding/domain/usecases/onboarding_usecases.dart';
import 'package:tag_me/features/wallet/data/mock_wallet_repository.dart';
import 'package:tag_me/features/wallet/domain/usecases/wallet_usecases.dart';
import 'package:tag_me/features/wallet/domain/wallet.dart';
import 'package:tag_me/features/wallet/domain/wallet_repository.dart';

import '../helpers.dart';

/// Starts the app signed out (the real start state).
Future<MockBackend> pumpSignedOut(WidgetTester t) async {
  final backend = MockBackend(simulation: BrandSimulation()..enabled = false);
  addTearDown(backend.dispose);
  await t.pumpWidget(
    ProviderScope(
      overrides: [
        ...mockOverrides,
        mockBackendProvider.overrideWithValue(backend),
      ],
      child: const TagMeApp(),
    ),
  );
  await t.pumpAndSettle();
  return backend;
}

ProfileDraft draft({
  String name = 'Layla Haddad',
  List<HandleDraft> handles = const [
    HandleDraft(platform: 'Instagram', handle: 'layla.eats'),
  ],
  List<String> categories = const ['Food'],
  String? licenceNumber,
  DateTime? licenceExpiry,
}) => ProfileDraft(
  name: name,
  country: 'UAE',
  city: 'Dubai',
  whatsapp: '+971501234567',
  handles: handles,
  categories: categories,
  licenceNumber: licenceNumber,
  licenceExpiry: licenceExpiry,
);

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  group('domain rules', () {
    final uae = regionNamed('UAE');

    test('phone numbers are normalised with the dial code', () {
      expect(RequestOtp.normalisePhone(uae, '50 123 4567'), '+971501234567');
      expect(
        RequestOtp.normalisePhone(uae, '050 123 4567'),
        '+971501234567',
        reason: 'local leading 0 dropped',
      );
      expect(RequestOtp.normalisePhone(uae, '123'), isNull);
      expect(
        RequestOtp.normalisePhone(regionNamed('India'), '98765 43210'),
        '+919876543210',
      );
    });

    test('profile needs a name, a handle and 1–3 categories', () {
      final now = DateTime(2026, 11, 26);
      expect(SubmitProfile.validate(draft(), now), isEmpty);
      expect(
        SubmitProfile.validate(
          draft(
            name: ' ',
            handles: const [HandleDraft(platform: 'Instagram', handle: ' ')],
            categories: const ['Food', 'Beauty', 'Tech', 'Auto'],
          ),
          now,
        ),
        {ProfileField.name, ProfileField.handles, ProfileField.categories},
      );
    });

    test('the licence is optional and never blocks submission', () {
      final now = DateTime(2026, 11, 26);
      expect(SubmitProfile.validate(draft(), now), isEmpty);
      expect(
        SubmitProfile.validate(draft(licenceNumber: '123'), now),
        isEmpty,
        reason: 'a number without an expiry date is fine',
      );
      expect(
        SubmitProfile.validate(
          draft(licenceNumber: '123', licenceExpiry: DateTime(2020)),
          now,
        ),
        isEmpty,
        reason: 'even a past date does not block',
      );
    });

    test('handles are cleaned to @name', () {
      expect(SubmitProfile.cleanHandle('layla.eats'), '@layla.eats');
      expect(SubmitProfile.cleanHandle('@layla.eats'), '@layla.eats');
      expect(
        SubmitProfile.cleanHandle('instagram.com/layla.eats/'),
        '@layla.eats',
      );
      expect(
        SubmitProfile.cleanHandle('https://youtube.com/c/layla'),
        'https://youtube.com/c/layla',
      );
    });

    test('referral codes must look like MAYA-TM25', () async {
      final w = MockWalletRepository(
        const Wallet(available: 0, onHold: 0, referralCode: 'X-TM1'),
        now: DateTime.now,
      );
      await AddReferrer(w)('maya-tm25');
      expect(
        () => AddReferrer(w)('hello'),
        throwsA(isA<InvalidPromoCodeError>()),
      );
    });
  });

  testWidgets('full sign-up: OTP → profile → review → bonus → Home', (t) async {
    final b = await pumpSignedOut(t);
    expect(find.text('Collabs for every creator.'), findsOneWidget);

    // Intro slides.
    await tapText(t, 'Get started');
    expect(find.text('Brands post.\nYou pick.'), findsOneWidget);
    await tapText(t, 'Next');
    await tapText(t, 'Create my account');

    // Register: number, then a wrong and a right code.
    await t.enterText(find.byType(TextField).first, '50 123 4567');
    await tapText(t, 'Send code on WhatsApp');
    expect(find.text('Enter the code sent to +971501234567'), findsOneWidget);
    await t.enterText(find.byType(TextField).last, '000000');
    await t.pumpAndSettle();
    expect(find.textContaining("That code didn't work"), findsOneWidget);
    await t.enterText(find.byType(TextField).last, '123456');
    await t.pumpAndSettle();

    // Profile setup: errors first, then a valid profile.
    expect(find.text('Tell brands\nwho you are.'), findsOneWidget);
    await tapText(t, 'Submit for verification');
    expect(find.text('Enter your name'), findsOneWidget);
    expect(
      find.text('Please add your name, a handle, 1 to 3 categories.'),
      findsOneWidget,
    );

    await t.enterText(find.byType(TextField).at(0), 'Layla Haddad');
    await t.enterText(find.byType(TextField).at(1), 'layla.eats');
    await tapText(t, 'Food');
    await tapText(t, 'Submit for verification');

    // Review → approval.
    expect(find.text("Thanks, Layla.\nWe're checking."), findsOneWidget);
    expect(b.profile.current.name, 'Layla Haddad');
    expect(b.profile.current.socials.single.handle, '@layla.eats');
    await tapText(t, 'Prototype: TagMe team approves →');
    expect(find.text("You're verified!"), findsOneWidget);

    // Welcome bonus, then a friend's code.
    await tapText(t, 'Claim my welcome bonus');
    await tapText(t, 'Claim AED 50 bonus');
    expect(find.text('added as credits ✓'), findsOneWidget);
    await tapText(t, 'Continue');
    await t.enterText(find.byType(TextField), 'maya-tm25');
    await tapText(t, 'Add code');
    expect(
      find.textContaining('MAYA-TM25 gets their referral reward'),
      findsOneWidget,
    );
    await tapText(t, 'Find my first collab');

    expect(find.text('Hi, Layla'), findsOneWidget);
    expect(find.byType(TmBottomNav), findsOneWidget);
  });

  test('odd handles never crash and count as missing', () {
    expect(SubmitProfile.cleanHandle('/'), '/');
    expect(SubmitProfile.isValidHandle('/'), isFalse);
    expect(SubmitProfile.isValidHandle('@'), isFalse);
    expect(SubmitProfile.isValidHandle('sara.eats'), isTrue);
    expect(
      SubmitProfile.validate(
        draft(
          handles: const [HandleDraft(platform: 'Instagram', handle: '/')],
        ),
        DateTime(2026, 11, 26),
      ),
      {ProfileField.handles},
    );
  });

  testWidgets('submit with a problem says what to fix', (t) async {
    await pumpSignedOut(t);
    await tapText(t, 'I already have an account');
    await tapText(t, 'Google');
    await t.enterText(find.byType(TextField).at(0), 'Sara Test');
    await t.enterText(find.byType(TextField).at(1), '/');
    await tapText(t, 'Food');
    await tapText(t, 'Submit for verification');
    expect(find.text('Please add a handle.'), findsOneWidget);
    expect(find.text('Add at least one handle'), findsOneWidget);
  });

  testWidgets('Google sign-in goes straight to profile setup', (t) async {
    await pumpSignedOut(t);
    await tapText(t, 'I already have an account');
    await tapText(t, 'Google');
    expect(find.text('Tell brands\nwho you are.'), findsOneWidget);
  });

  testWidgets('changing country updates dial code and cities', (t) async {
    await pumpSignedOut(t);
    await tapText(t, 'I already have an account');
    expect(find.text('+971'), findsOneWidget);
    await t.tap(find.text('UAE'));
    await t.pumpAndSettle();
    await t.tap(find.text('India').last);
    await t.pumpAndSettle();
    expect(find.text('+91'), findsOneWidget);
    expect(find.text('Mumbai'), findsOneWidget);
  });
}
