import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'package:tag_me/app/mock/mock_backend.dart';
import 'package:tag_me/app/mock/seed_data.dart';
import 'package:tag_me/app/routes.dart';
import 'package:tag_me/features/deals/data/mock_deal_repository.dart';
import 'package:tag_me/features/deals/domain/collab_stats.dart';
import 'package:tag_me/features/profile/domain/usecases/profile_usecases.dart';

import '../helpers.dart';

Future<void> openProfile(WidgetTester t) async {
  await t.tap(find.text('Profile').last);
  await t.pumpAndSettle();
}

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  group('domain', () {
    test('CollabStats counts done, ongoing and applied', () {
      final s = CollabStats.of(SeedData(DateTime(2026, 11, 26)).deals);
      expect((s.completed, s.active, s.applied), (4, 8, 2));
    });

    test('AddAddress validates and builds the short form', () async {
      expect(AddAddress.validate(line: 'x', area: '', phone: '123'), {
        AddressField.line,
        AddressField.area,
        AddressField.phone,
      });
      final b = MockBackend(simulation: BrandSimulation()..enabled = false);
      addTearDown(b.dispose);
      final a = await AddAddress(b.profile)(
        label: 'Other',
        recipient: 'Sara',
        line: 'Flat 2, Tower 5',
        area: 'Marina, Dubai',
        phone: '+971 50 000 0000',
      );
      expect(a.short, 'Other, Marina, Dubai');
      expect(b.profile.current.addresses.last.id, a.id);
    });
  });

  testWidgets('shows the creator, stats and accounts', (t) async {
    await pumpApp(t);
    await openProfile(t);
    expect(find.text('Sara Al Mansoori'), findsOneWidget);
    expect(find.text('@sara.eats · Dubai'), findsOneWidget);
    expect(find.text('1 / 3'), findsOneWidget);
    await scrollTo(t, 'Instagram');
    expect(find.textContaining('8.4K followers'), findsOneWidget);
  });

  testWidgets('going offline shows the banner on Home', (t) async {
    final b = await pumpApp(t);
    await openProfile(t);
    await t.tap(find.byType(Switch));
    await t.pumpAndSettle();
    expect(b.profile.current.online, isFalse);
    expect(find.text('Offline'), findsOneWidget);

    await t.tap(find.text('Home').last);
    await t.pumpAndSettle();
    expect(find.text("You're offline"), findsOneWidget);
  });

  testWidgets('My QR shows the creator code', (t) async {
    await pumpApp(t);
    await openProfile(t);
    await t.tap(find.text('My QR'));
    await t.pumpAndSettle();
    expect(find.text('TM-CR-20481'), findsOneWidget);
    expect(find.byType(QrImageView), findsOneWidget);
    await t.tap(find.byTooltip('Close'));
    await t.pumpAndSettle();
    expect(find.text('TM-CR-20481'), findsNothing);
  });

  testWidgets('add an address from a deal and it gets selected', (t) async {
    final b = await pumpApp(t);
    await openRoute(t, Routes.deal('d-glowhaus-vitc'));
    await tapText(t, '+ Add a new address');

    // Invalid first: errors shown, nothing saved.
    await tapText(t, 'Save address');
    expect(find.text('Add the full address'), findsOneWidget);
    expect(b.profile.current.addresses, hasLength(2));

    final fields = find.byType(TextField);
    await t.enterText(fields.at(1), 'Flat 2, Tower 5');
    await t.enterText(fields.at(2), 'Marina, Dubai');
    await tapText(t, 'Save address');

    expect(b.profile.current.addresses, hasLength(3));
    expect(
      find.text('Confirm this address'),
      findsOneWidget,
      reason: 'the new address is selected',
    );
  });
}
