import 'package:freezed_annotation/freezed_annotation.dart';

part 'creator.freezed.dart';

@freezed
abstract class SocialAccount with _$SocialAccount {
  const factory SocialAccount({
    /// "Instagram", "TikTok", "YouTube", … or a custom platform.
    required String platform,
    required String handle,
    @Default(false) bool verified,
    int? followers,

    /// Engagement rate in percent, e.g. 4.1.
    double? engagement,
  }) = _SocialAccount;
}

@freezed
abstract class Address with _$Address {
  const factory Address({
    required String id,

    /// "Home", "Work".
    required String label,
    required String recipient,

    /// Full line: "Villa 12, Street 4, Al Barsha 2, Dubai".
    required String line,

    /// Short form: "Home, Al Barsha".
    required String short,
    required String phone,
  }) = _Address;
}

@freezed
abstract class Licence with _$Licence {
  const factory Licence({
    required String number,
    DateTime? expiresAt,
    String? fileName,
  }) = _Licence;
}

@freezed
abstract class Creator with _$Creator {
  const Creator._();

  const factory Creator({
    required String id,
    required String name,
    required String country,
    required String city,
    required String whatsapp,

    /// Up to 3.
    @Default([]) List<String> categories,
    @Default([]) List<SocialAccount> socials,
    @Default([]) List<Address> addresses,
    Licence? licence,

    /// Offline creators are hidden from brands and can't apply.
    @Default(true) bool online,

    /// 3 strikes freezes the account.
    @Default(0) int strikes,

    /// e.g. "TM-CR-20481", encoded in the profile QR.
    required String creatorCode,
  }) = _Creator;

  static const maxStrikes = 3;
  static const maxCategories = 3;

  String get firstName => name.split(' ').first;

  /// Main handle, e.g. "@sara.eats".
  String? get primaryHandle => socials.isEmpty ? null : socials.first.handle;

  bool get frozen => strikes >= maxStrikes;
}
