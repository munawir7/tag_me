// Opens every screen on a small phone (360×640) with large system text
// and scrolls through it: any layout overflow fails the test.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tag_me/app/app.dart';
import 'package:tag_me/app/mock/mock_backend.dart';
import 'package:tag_me/app/providers.dart';
import 'package:tag_me/features/deals/data/mock_deal_repository.dart';
import 'package:tag_me/features/onboarding/application/session_controller.dart';
import 'helpers.dart';
import 'sheets_test.dart' show smallPhone;

const routes = [
  '/home',
  '/collabs',
  '/credits',
  '/profile',
  '/notifications',
  '/vouchers',
  '/campaigns/glowhaus-vitc',
  '/campaigns/noor-cookies',
  '/campaigns/skyline-jazz',
  '/campaigns/aura-facial',
  '/campaigns/marina-food',
  '/campaigns/marina-food/apply',
  '/campaigns/noor-cookies/apply',
  '/deals/d-aero-earbuds',
  '/deals/d-kora-tote',
  '/deals/d-verde-brush',
  '/deals/d-micdrop-standup',
  '/deals/d-glowhaus-vitc',
  '/deals/d-noor-cookies',
  '/deals/d-skyline-jazz',
  '/deals/d-aura-facial',
  '/deals/d-laughlab-comedy',
  '/deals/d-brewlab-coffee',
  '/deals/d-glowhaus-liptint',
  '/deals/d-velo-launch',
  '/deals/d-leaf-tea',
  '/deals/d-hydra-bottle',
  '/deals/d-zest-juice',
  '/deals/d-atelier-pass',
  '/deals/d-fitbite-box',
  '/deals/d-verde-brush/tracking',
  '/review',
  '/welcome',
];
void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);
  for (final r in routes) {
    testWidgets('verified $r', (t) async {
      smallPhone(t);
      await pumpApp(t);
      if (r != '/home') await openRoute(t, r);
      // Scroll through the whole page so every part is laid out.
      for (var i = 0; i < 30; i++) {
        final s = find.byType(Scrollable);
        if (s.evaluate().isEmpty) break;
        final p = t.state<ScrollableState>(s.first).position;
        if (p.pixels >= p.maxScrollExtent) break;
        p.jumpTo((p.pixels + 300).clamp(0, p.maxScrollExtent));
        await t.pump();
      }
    });
  }
  for (final s in [
    SessionStatus.signedOut,
    SessionStatus.needsProfile,
    SessionStatus.underReview,
  ]) {
    testWidgets('onboarding ${s.name}', (t) async {
      smallPhone(t);
      final b = MockBackend(simulation: BrandSimulation()..enabled = false);
      addTearDown(b.dispose);
      await t.pumpWidget(
        ProviderScope(
          overrides: [
            sessionProvider.overrideWith(() => FixedSession(s)),
            ...mockOverrides,
            mockBackendProvider.overrideWithValue(b),
          ],
          child: const TagMeApp(),
        ),
      );
      await t.pumpAndSettle();
      if (s == SessionStatus.signedOut) {
        await openRoute(t, '/intro');
        await openRoute(t, '/register');
      }
    });
  }
}
