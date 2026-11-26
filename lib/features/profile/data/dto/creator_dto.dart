import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/creator.dart';

part 'creator_dto.freezed.dart';
part 'creator_dto.g.dart';

@freezed
abstract class CreatorDto with _$CreatorDto {
  const CreatorDto._();

  const factory CreatorDto({
    required String id,
    required String name,
    required String country,
    required String city,
    required String whatsapp,
    @Default([]) List<String> categories,
    @Default([]) List<SocialAccountDto> socials,
    @Default([]) List<AddressDto> addresses,
    LicenceDto? licence,
    @Default(true) bool online,
    @Default(0) int strikes,
    required String creatorCode,
  }) = _CreatorDto;

  factory CreatorDto.fromJson(Map<String, dynamic> json) =>
      _$CreatorDtoFromJson(json);

  factory CreatorDto.fromDomain(Creator c) => CreatorDto(
    id: c.id,
    name: c.name,
    country: c.country,
    city: c.city,
    whatsapp: c.whatsapp,
    categories: c.categories,
    socials: c.socials.map(SocialAccountDto.fromDomain).toList(),
    addresses: c.addresses.map(AddressDto.fromDomain).toList(),
    licence: c.licence == null ? null : LicenceDto.fromDomain(c.licence!),
    online: c.online,
    strikes: c.strikes,
    creatorCode: c.creatorCode,
  );

  Creator toDomain() => Creator(
    id: id,
    name: name,
    country: country,
    city: city,
    whatsapp: whatsapp,
    categories: categories,
    socials: socials.map((s) => s.toDomain()).toList(),
    addresses: addresses.map((a) => a.toDomain()).toList(),
    licence: licence?.toDomain(),
    online: online,
    strikes: strikes,
    creatorCode: creatorCode,
  );
}

@freezed
abstract class SocialAccountDto with _$SocialAccountDto {
  const SocialAccountDto._();

  const factory SocialAccountDto({
    required String platform,
    required String handle,
    @Default(false) bool verified,
    int? followers,
    double? engagement,
  }) = _SocialAccountDto;

  factory SocialAccountDto.fromJson(Map<String, dynamic> json) =>
      _$SocialAccountDtoFromJson(json);

  factory SocialAccountDto.fromDomain(SocialAccount s) => SocialAccountDto(
    platform: s.platform,
    handle: s.handle,
    verified: s.verified,
    followers: s.followers,
    engagement: s.engagement,
  );

  SocialAccount toDomain() => SocialAccount(
    platform: platform,
    handle: handle,
    verified: verified,
    followers: followers,
    engagement: engagement,
  );
}

@freezed
abstract class AddressDto with _$AddressDto {
  const AddressDto._();

  const factory AddressDto({
    required String id,
    required String label,
    required String recipient,
    required String line,
    required String short,
    required String phone,
  }) = _AddressDto;

  factory AddressDto.fromJson(Map<String, dynamic> json) =>
      _$AddressDtoFromJson(json);

  factory AddressDto.fromDomain(Address a) => AddressDto(
    id: a.id,
    label: a.label,
    recipient: a.recipient,
    line: a.line,
    short: a.short,
    phone: a.phone,
  );

  Address toDomain() => Address(
    id: id,
    label: label,
    recipient: recipient,
    line: line,
    short: short,
    phone: phone,
  );
}

@freezed
abstract class LicenceDto with _$LicenceDto {
  const LicenceDto._();

  const factory LicenceDto({
    required String number,
    DateTime? expiresAt,
    String? fileName,
  }) = _LicenceDto;

  factory LicenceDto.fromJson(Map<String, dynamic> json) =>
      _$LicenceDtoFromJson(json);

  factory LicenceDto.fromDomain(Licence l) => LicenceDto(
    number: l.number,
    expiresAt: l.expiresAt,
    fileName: l.fileName,
  );

  Licence toDomain() =>
      Licence(number: number, expiresAt: expiresAt, fileName: fileName);
}
