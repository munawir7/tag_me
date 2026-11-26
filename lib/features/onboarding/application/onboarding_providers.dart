import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/auth_repository.dart';
import '../domain/profile_draft.dart';
import '../domain/usecases/onboarding_usecases.dart';

// Ports: provided by the app's composition root (see app/providers.dart).
final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => throw UnimplementedError('authRepositoryProvider not provided'),
);
final onboardingRepositoryProvider = Provider<OnboardingRepository>(
  (ref) =>
      throw UnimplementedError('onboardingRepositoryProvider not provided'),
);

/// Shown under the code boxes in debug builds (null for a real backend).
final devOtpHintProvider = Provider<String?>((ref) => null);

final requestOtpProvider = Provider(
  (ref) => RequestOtp(ref.watch(authRepositoryProvider)),
);
final verifyOtpProvider = Provider(
  (ref) => VerifyOtp(ref.watch(authRepositoryProvider)),
);
final signInWithSocialProvider = Provider(
  (ref) => SignInWithSocial(ref.watch(authRepositoryProvider)),
);
final signOutProvider = Provider(
  (ref) => SignOut(ref.watch(authRepositoryProvider)),
);
final submitProfileProvider = Provider(
  (ref) =>
      SubmitProfile(ref.watch(onboardingRepositoryProvider), now: DateTime.now),
);

/// Country, city and number chosen on the register screen, reused by
/// profile setup.
class SignUpDetails {
  const SignUpDetails({
    this.country = 'UAE',
    this.city = 'Dubai',
    this.phone = '',
  });
  final String country;
  final String city;
  final String phone;
}

class SignUpDetailsNotifier extends Notifier<SignUpDetails> {
  @override
  SignUpDetails build() => const SignUpDetails();
  void set(SignUpDetails d) => state = d;
}

final signUpDetailsProvider =
    NotifierProvider<SignUpDetailsNotifier, SignUpDetails>(
      SignUpDetailsNotifier.new,
    );
