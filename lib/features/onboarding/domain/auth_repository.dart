/// A code sent on WhatsApp, waiting to be verified.
class OtpRequest {
  const OtpRequest({
    required this.id,
    required this.phone,
    required this.resendAfter,
  });

  final String id;

  /// Full number with dial code, e.g. "+971501234567".
  final String phone;

  /// How long before "Resend" is allowed.
  final Duration resendAfter;
}

enum SocialSignIn { google, apple }

/// The result of signing in.
class AuthResult {
  const AuthResult({required this.hasProfile});

  /// False for new creators, who continue to profile setup.
  final bool hasProfile;
}

class InvalidPhoneError implements Exception {
  @override
  String toString() => 'InvalidPhoneError';
}

class InvalidOtpError implements Exception {
  @override
  String toString() => 'InvalidOtpError';
}

abstract interface class AuthRepository {
  /// Sends a 6-digit code on WhatsApp.
  Future<OtpRequest> requestOtp(String phone);

  /// Throws [InvalidOtpError] when the code is wrong.
  Future<AuthResult> verifyOtp(OtpRequest request, String code);

  Future<AuthResult> signInWith(SocialSignIn provider);

  Future<void> signOut();
}
