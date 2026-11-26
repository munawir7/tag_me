import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Where the creator is in sign-up and verification.
enum SessionStatus {
  /// Not signed in: only splash, intro and register are reachable.
  signedOut,

  /// Signed in (OTP / Google / Apple) but the profile isn't submitted yet.
  needsProfile,

  /// Profile submitted; the TagMe team is checking it. The creator can
  /// browse campaigns but can't apply.
  underReview,

  /// Approved by the TagMe team. Full access.
  verified;

  bool get isSignedIn => this != signedOut;
  bool get canApply => this == verified;
}

/// Start state for development, e.g.
/// `flutter run --dart-define=TM_START=verified` to skip onboarding.
/// Defaults to [SessionStatus.signedOut], which is what real users get.
SessionStatus _startStatus() {
  const name = String.fromEnvironment('TM_START');
  return SessionStatus.values.firstWhere(
    (s) => s.name == name,
    orElse: () => SessionStatus.signedOut,
  );
}

/// Mock session. Step 5 swaps the bodies of these methods for real
/// WhatsApp-OTP / Google / Apple auth and the verification API.
class SessionController extends Notifier<SessionStatus> {
  @override
  SessionStatus build() => _startStatus();

  void signIn() => state = SessionStatus.needsProfile;
  void submitProfile() => state = SessionStatus.underReview;

  /// In the prototype the TagMe team approves by hand; here it's a dev button.
  void approve() => state = SessionStatus.verified;
  void signOut() => state = SessionStatus.signedOut;
}

final sessionProvider = NotifierProvider<SessionController, SessionStatus>(
  SessionController.new,
);
