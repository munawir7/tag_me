/// Every path in the app. Use these instead of string literals.
class Routes {
  Routes._();

  // Onboarding (no tab bar)
  static const splash = '/splash';
  static const intro = '/intro';
  static const register = '/register';
  static const profileSetup = '/profile-setup';
  static const review = '/review';
  static const welcome = '/welcome';

  // The four tabs
  static const home = '/home';
  static const collabs = '/collabs';
  static const credits = '/credits';
  static const profile = '/profile';

  // Full-screen pages pushed over the tabs
  static const notifications = '/notifications';
  static const vouchers = '/vouchers';

  /// Vouchers, opened on one collab's code.
  static String voucher(String dealId) => '/vouchers?deal=$dealId';
  static const uiKit = '/dev/ui-kit';

  static String campaign(String id) => '/campaigns/$id';
  static String apply(String campaignId) => '/campaigns/$campaignId/apply';
  static String deal(String id) => '/deals/$id';
  static String tracking(String dealId) => '/deals/$dealId/tracking';

  /// The four tab roots.
  static const tabs = {home, collabs, credits, profile};

  /// Reachable without signing in.
  static const public = {splash, intro, register};
}
