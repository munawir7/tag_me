import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:tag_me/app/routes.dart';
import 'package:tag_me/core/widgets/widgets.dart';

import 'helpers.dart';

/// A small phone (360×640) with large system text: where sheets used to
/// overflow.
void smallPhone(WidgetTester t) {
  t.view.physicalSize = const Size(360 * 2, 640 * 2);
  t.view.devicePixelRatio = 2;
  t.platformDispatcher.textScaleFactorTestValue = 1.3;
  addTearDown(t.platformDispatcher.clearTextScaleFactorTestValue);
}

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  testWidgets('country sheet fits, covers the tab bar and scrolls', (t) async {
    smallPhone(t);
    await pumpApp(t);
    await t.tap(find.text('UAE ▾'));
    await t.pumpAndSettle();

    expect(t.takeException(), isNull, reason: 'no overflow');
    // The sheet is above the tab bar, not squeezed inside the tab.
    final sheetTop = t.getTopLeft(find.byType(BottomSheet)).dy;
    final navTop = t.getTopLeft(find.byType(TmBottomNav)).dy;
    expect(
      t.getBottomLeft(find.byType(BottomSheet)).dy,
      greaterThan(navTop),
      reason: 'sheet reaches over the tab bar',
    );
    expect(sheetTop, greaterThan(0));

    // The last country is reachable by scrolling, and selecting works.
    await t.scrollUntilVisible(
      find.text('India'),
      100,
      scrollable: find.descendant(
        of: find.byType(BottomSheet),
        matching: find.byType(Scrollable),
      ),
    );
    await t.tap(find.text('India'));
    await t.pumpAndSettle();
    expect(find.text('India ▾'), findsOneWidget);
  });

  testWidgets('delivery-problem and address sheets do not overflow', (t) async {
    smallPhone(t);
    await pumpApp(t);
    await t.tap(find.text('Profile').last);
    await t.pumpAndSettle();
    await tapText(t, 'Delivery addresses · 2 saved');
    expect(t.takeException(), isNull);
    expect(find.text('Delivery addresses'), findsOneWidget);

    await t.tapAt(const Offset(10, 10)); // close
    await t.pumpAndSettle();
    await openRoute(t, Routes.deal('d-glowhaus-vitc'));
    await tapText(t, '+ Add a new address');
    expect(t.takeException(), isNull);
    expect(find.text('Add a delivery address'), findsOneWidget);
  });
}
