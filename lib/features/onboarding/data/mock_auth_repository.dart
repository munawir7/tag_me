import '../../profile/data/mock_profile_repository.dart';
import '../domain/auth_repository.dart';
import '../domain/profile_draft.dart';

/// Pretend WhatsApp-OTP / Google / Apple sign-in. Every code except
/// [devCode] is rejected, so the error path can be tried too.
class MockAuthRepository implements AuthRepository {
  MockAuthRepository({this.latency = Duration.zero});

  /// The only code the mock accepts (shown on screen in debug builds).
  static const devCode = '123456';

  final Duration latency;
  var _seq = 0;

  @override
  Future<OtpRequest> requestOtp(String phone) async {
    await Future<void>.delayed(latency);
    return OtpRequest(
      id: 'otp-${++_seq}',
      phone: phone,
      resendAfter: const Duration(seconds: 30),
    );
  }

  @override
  Future<AuthResult> verifyOtp(OtpRequest request, String code) async {
    await Future<void>.delayed(latency);
    if (code != devCode) throw InvalidOtpError();
    return const AuthResult(hasProfile: false);
  }

  @override
  Future<AuthResult> signInWith(SocialSignIn provider) async {
    await Future<void>.delayed(latency);
    return const AuthResult(hasProfile: false);
  }

  @override
  Future<void> signOut() async {}
}

/// Stores the submitted profile on the (mock) creator record.
class MockOnboardingRepository implements OnboardingRepository {
  MockOnboardingRepository(this._profile, {this.latency = Duration.zero});

  final MockProfileRepository _profile;
  final Duration latency;

  ProfileDraft? lastSubmitted;

  @override
  Future<void> submitProfile(ProfileDraft draft) async {
    await Future<void>.delayed(latency);
    lastSubmitted = draft;
    _profile.applyDraft(draft);
  }
}
