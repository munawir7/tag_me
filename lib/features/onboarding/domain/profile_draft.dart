/// One social account entered during sign-up.
class HandleDraft {
  const HandleDraft({required this.platform, required this.handle});
  final String platform;
  final String handle;

  HandleDraft copyWith({String? handle}) =>
      HandleDraft(platform: platform, handle: handle ?? this.handle);
}

/// Everything the creator fills in on "Tell brands who you are".
class ProfileDraft {
  const ProfileDraft({
    required this.name,
    required this.country,
    required this.city,
    required this.whatsapp,
    required this.handles,
    required this.categories,
    this.licenceNumber,
    this.licenceExpiry,
    this.licenceFile,
  });

  final String name;
  final String country;
  final String city;
  final String whatsapp;
  final List<HandleDraft> handles;
  final List<String> categories;
  final String? licenceNumber;
  final DateTime? licenceExpiry;
  final String? licenceFile;

  bool get hasLicence =>
      (licenceNumber?.trim().isNotEmpty ?? false) || licenceFile != null;
}

/// Fields that need fixing before the profile can be submitted.
enum ProfileField { name, handles, categories }

class InvalidProfileError implements Exception {
  InvalidProfileError(this.fields);
  final Set<ProfileField> fields;
  @override
  String toString() => 'InvalidProfileError(${fields.map((f) => f.name)})';
}

abstract interface class OnboardingRepository {
  /// Sends the profile to the TagMe team for verification.
  Future<void> submitProfile(ProfileDraft draft);
}
