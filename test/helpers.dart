import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tag_me/app/app.dart';
import 'package:tag_me/app/mock/mock_backend.dart';
import 'package:tag_me/app/providers.dart';
import 'package:tag_me/app/router.dart';
import 'package:tag_me/features/deals/data/mock_deal_repository.dart';
import 'package:tag_me/features/onboarding/application/session_controller.dart';

/// Scrolls the page (not inner fields) until [f] is on screen and tappable.
Future<void> reveal(WidgetTester t, Finder f) async {
  final page = t.state<ScrollableState>(find.byType(Scrollable).first);
  for (var i = 0; i < 80 && f.hitTestable().evaluate().isEmpty; i++) {
    if (f.evaluate().isNotEmpty) {
      await Scrollable.ensureVisible(t.element(f.first), alignment: 0.5);
    } else {
      final p = page.position;
      p.jumpTo((p.pixels + 200).clamp(0, p.maxScrollExtent));
    }
    await t.pump();
  }
  await t.pumpAndSettle();
}

/// Scrolls [text] into view (if needed) and taps it.
Future<void> tapText(WidgetTester t, String text) async {
  final f = find.text(text);
  await reveal(t, f);
  await t.tap(f.hitTestable().first);
  await t.pumpAndSettle();
}

/// Scrolls until [text] is on screen.
Future<void> scrollTo(WidgetTester t, String text) =>
    reveal(t, find.text(text));

/// The app with a seeded backend whose brand never acts by itself (so no
/// timers are left running), starting in [status].
Future<MockBackend> pumpApp(
  WidgetTester t, [
  SessionStatus status = SessionStatus.verified,
  MockBackend? custom,
]) async {
  final backend =
      custom ?? MockBackend(simulation: BrandSimulation()..enabled = false);
  addTearDown(backend.dispose);
  await t.pumpWidget(
    ProviderScope(
      overrides: [
        sessionProvider.overrideWith(() => FixedSession(status)),
        ...mockOverrides,
        mockBackendProvider.overrideWithValue(backend),
      ],
      child: const TagMeApp(),
    ),
  );
  await t.pumpAndSettle();
  return backend;
}

/// Opens [location] on top of the current page.
Future<void> openRoute(WidgetTester t, String location) async {
  ProviderScope.containerOf(
    t.element(find.byType(TagMeApp)),
  ).read(routerProvider).push(location);
  await t.pumpAndSettle();
}

class FixedSession extends SessionController {
  FixedSession(this.status);
  final SessionStatus status;
  @override
  SessionStatus build() => status;
}
