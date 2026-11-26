import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:tag_me/features/wallet/domain/wallet.dart';

import '../helpers.dart';

Future<void> openCredits(WidgetTester t) async {
  await t.tap(find.text('Credits').last);
  await t.pumpAndSettle();
}

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  testWidgets('shows balance, holds and history', (t) async {
    await pumpApp(t);
    await openCredits(t);
    expect(find.text('42'), findsOneWidget);
    expect(find.text('17 credits · 2 applications'), findsOneWidget);
    await scrollTo(t, 'Welcome bonus · AED 50');
    expect(find.text('+ 50'), findsOneWidget);
  });

  testWidgets('promo code adds credits once', (t) async {
    final b = await pumpApp(t);
    await openCredits(t);
    await reveal(t, find.text('Apply'));
    await t.enterText(find.byType(TextField), 'tagme25');
    await tapText(t, 'Apply');

    expect(
      find.textContaining('TAGME25 applied. 25 credits added'),
      findsOneWidget,
    );
    expect(b.wallet.current.available, 42 + 25);
    expect(b.wallet.current.history.first.kind, TxnKind.promo);

    await t.enterText(find.byType(TextField), 'TAGME25');
    await tapText(t, 'Apply');
    expect(
      find.text("That code isn't valid or was already used."),
      findsOneWidget,
    );
    expect(b.wallet.current.available, 42 + 25);
  });

  testWidgets('choosing a pack and buying sends a request', (t) async {
    await pumpApp(t);
    await openCredits(t);
    expect(
      find.text('Buy 120 credits'),
      findsOneWidget,
      reason: 'POPULAR pack is preselected',
    );

    await tapText(t, '300');
    await tapText(t, 'Buy 300 credits');
    expect(find.textContaining('Request sent for 300 credits'), findsOneWidget);
  });
}
