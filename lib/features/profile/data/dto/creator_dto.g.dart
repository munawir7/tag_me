// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creator_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreatorDto _$CreatorDtoFromJson(Map<String, dynamic> json) => _CreatorDto(
  id: json['id'] as String,
  name: json['name'] as String,
  country: json['country'] as String,
  city: json['city'] as String,
  whatsapp: json['whatsapp'] as String,
  categories:
      (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  socials:
      (json['socials'] as List<dynamic>?)
          ?.map((e) => SocialAccountDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  addresses:
      (json['addresses'] as List<dynamic>?)
          ?.map((e) => AddressDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  licence: json['licence'] == null
      ? null
      : LicenceDto.fromJson(json['licence'] as Map<String, dynamic>),
  online: json['online'] as bool? ?? true,
  strikes: (json['strikes'] as num?)?.toInt() ?? 0,
  creatorCode: json['creator_code'] as String,
);

Map<String, dynamic> _$CreatorDtoToJson(_CreatorDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'country': instance.country,
      'city': instance.city,
      'whatsapp': instance.whatsapp,
      'categories': instance.categories,
      'socials': instance.socials.map((e) => e.toJson()).toList(),
      'addresses': instance.addresses.map((e) => e.toJson()).toList(),
      'licence': ?instance.licence?.toJson(),
      'online': instance.online,
      'strikes': instance.strikes,
      'creator_code': instance.creatorCode,
    };

_SocialAccountDto _$SocialAccountDtoFromJson(Map<String, dynamic> json) =>
    _SocialAccountDto(
      platform: json['platform'] as String,
      handle: json['handle'] as String,
      verified: json['verified'] as bool? ?? false,
      followers: (json['followers'] as num?)?.toInt(),
      engagement: (json['engagement'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SocialAccountDtoToJson(_SocialAccountDto instance) =>
    <String, dynamic>{
      'platform': instance.platform,
      'handle': instance.handle,
      'verified': instance.verified,
      'followers': ?instance.followers,
      'engagement': ?instance.engagement,
    };

_AddressDto _$AddressDtoFromJson(Map<String, dynamic> json) => _AddressDto(
  id: json['id'] as String,
  label: json['label'] as String,
  recipient: json['recipient'] as String,
  line: json['line'] as String,
  short: json['short'] as String,
  phone: json['phone'] as String,
);

Map<String, dynamic> _$AddressDtoToJson(_AddressDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'recipient': instance.recipient,
      'line': instance.line,
      'short': instance.short,
      'phone': instance.phone,
    };

_LicenceDto _$LicenceDtoFromJson(Map<String, dynamic> json) => _LicenceDto(
  number: json['number'] as String,
  expiresAt: json['expires_at'] == null
      ? null
      : DateTime.parse(json['expires_at'] as String),
  fileName: json['file_name'] as String?,
);

Map<String, dynamic> _$LicenceDtoToJson(_LicenceDto instance) =>
    <String, dynamic>{
      'number': instance.number,
      'expires_at': ?instance.expiresAt?.toIso8601String(),
      'file_name': ?instance.fileName,
    };
