import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/campaigns/presentation/apply_page.dart';
import '../features/campaigns/presentation/campaign_detail_page.dart';
import '../features/collabs/presentation/collabs_page.dart';
import '../features/deals/presentation/deal_page.dart';
import '../features/deals/presentation/tracking_page.dart';
import '../features/dev/presentation/ui_kit_page.dart';
import '../features/home/presentation/home_page.dart';
import '../features/notifications/presentation/notifications_page.dart';
import '../features/onboarding/application/session_controller.dart';
import '../features/onboarding/presentation/intro_page.dart';
import '../features/onboarding/presentation/profile_setup_page.dart';
import '../features/onboarding/presentation/register_page.dart';
import '../features/onboarding/presentation/review_page.dart';
import '../features/onboarding/presentation/splash_page.dart';
import '../features/onboarding/presentation/welcome_page.dart';
import '../features/profile/presentation/profile_page.dart';
import '../features/vouchers/presentation/vouchers_page.dart';
import '../features/wallet/presentation/credits_page.dart';
import 'routes.dart';
import 'tab_shell.dart';

final _rootKey = GlobalKey<NavigatorState>(debugLabel: 'root');

/// Decides where a creator may go for a given [status].
/// Returns the path to send them to, or null to allow [location].
String? redirectFor(SessionStatus status, String location) {
  final isPublic = Routes.public.contains(location);
  switch (status) {
    case SessionStatus.signedOut:
      return isPublic ? null : Routes.splash;
    case SessionStatus.needsProfile:
      return location == Routes.profileSetup ? null : Routes.profileSetup;
    case SessionStatus.underReview:
      return isPublic || location == Routes.profileSetup ? Routes.review : null;
    case SessionStatus.verified:
      return isPublic || location == Routes.profileSetup ? Routes.home : null;
  }
}

final routerProvider = Provider<GoRouter>((ref) {
  // Re-run the redirect whenever the session changes (sign in / out etc).
  final refresh = ValueNotifier(0);
  ref.listen(sessionProvider, (_, _) => refresh.value++);
  ref.onDispose(refresh.dispose);

  final router = GoRouter(
    navigatorKey: _rootKey,
    initialLocation: Routes.home,
    refreshListenable: refresh,
    redirect: (_, state) =>
        redirectFor(ref.read(sessionProvider), state.matchedLocation),
    routes: [
      // Onboarding
      GoRoute(path: Routes.splash, builder: (_, _) => const SplashPage()),
      GoRoute(path: Routes.intro, builder: (_, _) => const IntroPage()),
      GoRoute(path: Routes.register, builder: (_, _) => const RegisterPage()),
      GoRoute(
        path: Routes.profileSetup,
        builder: (_, _) => const ProfileSetupPage(),
      ),
      GoRoute(path: Routes.review, builder: (_, _) => const ReviewPage()),
      GoRoute(path: Routes.welcome, builder: (_, _) => const WelcomePage()),

      // Four tabs. Each keeps its own back stack when you switch tabs.
      StatefulShellRoute.indexedStack(
        builder: (_, _, shell) => TabShell(shell: shell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(path: Routes.home, builder: (_, _) => const HomePage()),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.collabs,
                builder: (_, _) => const CollabsPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.credits,
                builder: (_, _) => const CreditsPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.profile,
                builder: (_, _) => const ProfilePage(),
              ),
            ],
          ),
        ],
      ),

      // Full-screen pages over the tabs (no bottom nav), like the prototype.
      GoRoute(
        path: '/campaigns/:id',
        parentNavigatorKey: _rootKey,
        builder: (_, s) => CampaignDetailPage(id: s.pathParameters['id']!),
        routes: [
          GoRoute(
            path: 'apply',
            parentNavigatorKey: _rootKey,
            builder: (_, s) => ApplyPage(campaignId: s.pathParameters['id']!),
          ),
        ],
      ),
      GoRoute(
        path: '/deals/:id',
        parentNavigatorKey: _rootKey,
        builder: (_, s) => DealPage(id: s.pathParameters['id']!),
        routes: [
          GoRoute(
            path: 'tracking',
            parentNavigatorKey: _rootKey,
            builder: (_, s) => TrackingPage(dealId: s.pathParameters['id']!),
          ),
        ],
      ),
      GoRoute(
        path: Routes.notifications,
        parentNavigatorKey: _rootKey,
        builder: (_, _) => const NotificationsPage(),
      ),
      GoRoute(
        path: Routes.vouchers,
        parentNavigatorKey: _rootKey,
        builder: (_, s) => VouchersPage(dealId: s.uri.queryParameters['deal']),
      ),
      GoRoute(
        path: Routes.uiKit,
        parentNavigatorKey: _rootKey,
        builder: (_, _) => const UiKitPage(),
      ),
    ],
  );
  ref.onDispose(router.dispose);
  return router;
});

extension PopOrGo on BuildContext {
  /// Pops if there's a page underneath, otherwise goes to [fallback].
  /// Needed when a page was opened directly (deep link, notification).
  void popOrGo([String fallback = Routes.home]) =>
      canPop() ? pop() : go(fallback);
}

extension OpenAppLink on BuildContext {
  /// Opens an in-app link (from a notification or alert): tab pages are
  /// switched to, everything else opens on top.
  void openLink(String link) =>
      Routes.tabs.contains(Uri.parse(link).path) ? go(link) : push(link);
}
