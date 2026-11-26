import '../auth_repository.dart';
import '../profile_draft.dart';
import '../regions.dart';

/// Sends a WhatsApp code to [localNumber] in [region].
/// Throws [InvalidPhoneError] for numbers that can't be right.
class RequestOtp {
  const RequestOtp(this._auth);
  final AuthRepository _auth;

  Future<OtpRequest> call(Region region, String localNumber) {
    final phone = normalisePhone(region, localNumber);
    if (phone == null) throw InvalidPhoneError();
    return _auth.requestOtp(phone);
  }

  /// "+971501234567", or null if the local part isn't 7–12 digits.
  /// A leading 0 (local trunk prefix) is dropped.
  static String? normalisePhone(Region region, String localNumber) {
    var digits = localNumber.replaceAll(RegExp(r'[^0-9]'), '');
    if (digits.startsWith('0')) digits = digits.substring(1);
    if (digits.length < 7 || digits.length > 12) return null;
    return '${region.dialCode}$digits';
  }
}

class VerifyOtp {
  const VerifyOtp(this._auth);
  final AuthRepository _auth;

  Future<AuthResult> call(OtpRequest request, String code) {
    final c = code.trim();
    if (!RegExp(r'^\d{6}$').hasMatch(c)) throw InvalidOtpError();
    return _auth.verifyOtp(request, c);
  }
}

class SignInWithSocial {
  const SignInWithSocial(this._auth);
  final AuthRepository _auth;
  Future<AuthResult> call(SocialSignIn provider) => _auth.signInWith(provider);
}

class SignOut {
  const SignOut(this._auth);
  final AuthRepository _auth;
  Future<void> call() => _auth.signOut();
}

/// Validates and submits the profile for verification.
/// Throws [InvalidProfileError] listing what to fix.
class SubmitProfile {
  const SubmitProfile(this._onboarding, {required DateTime Function() now})
    : _now = now;
  final OnboardingRepository _onboarding;
  final DateTime Function() _now;

  static const maxCategories = 3;

  Future<void> call(ProfileDraft draft) {
    final errors = validate(draft, _now());
    if (errors.isNotEmpty) throw InvalidProfileError(errors);
    return _onboarding.submitProfile(
      ProfileDraft(
        name: draft.name.trim(),
        country: draft.country,
        city: draft.city,
        whatsapp: draft.whatsapp,
        handles: [
          for (final h in draft.handles)
            if (isValidHandle(h.handle))
              HandleDraft(platform: h.platform, handle: cleanHandle(h.handle)),
        ],
        categories: draft.categories,
        licenceNumber: draft.licenceNumber?.trim(),
        licenceExpiry: draft.licenceExpiry,
        licenceFile: draft.licenceFile,
      ),
    );
  }

  /// Empty when the draft can be submitted. The licence section is
  /// optional and never blocks submission (for now).
  static Set<ProfileField> validate(ProfileDraft d, DateTime now) {
    final hasHandle = d.handles.any((h) => isValidHandle(h.handle));
    return {
      if (d.name.trim().length < 2) ProfileField.name,
      if (!hasHandle) ProfileField.handles,
      if (d.categories.isEmpty || d.categories.length > maxCategories)
        ProfileField.categories,
    };
  }

  /// "sara.eats" / "instagram.com/sara.eats" → "@sara.eats"; links to
  /// other platforms are kept as they are.
  /// Never throws: input without a name part (e.g. "/") comes back as is;
  /// [isValidHandle] rejects it before submission.
  static String cleanHandle(String input) {
    final h = input.trim();
    if (h.startsWith('http')) return h;
    final parts = h.split('/').where((p) => p.isNotEmpty);
    if (parts.isEmpty) return h;
    final last = parts.last;
    return last.startsWith('@') ? last : '@$last';
  }

  /// A handle needs at least one letter or digit after cleaning.
  static bool isValidHandle(String input) =>
      RegExp(r'[A-Za-z0-9]').hasMatch(cleanHandle(input));
}
