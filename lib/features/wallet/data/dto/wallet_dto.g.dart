// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WalletDto _$WalletDtoFromJson(Map<String, dynamic> json) => _WalletDto(
  available: (json['available'] as num).toInt(),
  onHold: (json['on_hold'] as num).toInt(),
  holds: (json['holds'] as num?)?.toInt() ?? 0,
  nextExpiryAmount: (json['next_expiry_amount'] as num?)?.toInt(),
  nextExpiryDate: json['next_expiry_date'] == null
      ? null
      : DateTime.parse(json['next_expiry_date'] as String),
  referralCode: json['referral_code'] as String,
  history:
      (json['history'] as List<dynamic>?)
          ?.map((e) => CreditTxnDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$WalletDtoToJson(_WalletDto instance) =>
    <String, dynamic>{
      'available': instance.available,
      'on_hold': instance.onHold,
      'holds': instance.holds,
      'next_expiry_amount': ?instance.nextExpiryAmount,
      'next_expiry_date': ?instance.nextExpiryDate?.toIso8601String(),
      'referral_code': instance.referralCode,
      'history': instance.history.map((e) => e.toJson()).toList(),
    };

_CreditTxnDto _$CreditTxnDtoFromJson(Map<String, dynamic> json) =>
    _CreditTxnDto(
      id: json['id'] as String,
      kind: json['kind'] as String,
      amount: (json['amount'] as num).toInt(),
      title: json['title'] as String,
      note: json['note'] as String,
      at: DateTime.parse(json['at'] as String),
      expiresAt: json['expires_at'] == null
          ? null
          : DateTime.parse(json['expires_at'] as String),
      dealId: json['deal_id'] as String?,
    );

Map<String, dynamic> _$CreditTxnDtoToJson(_CreditTxnDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kind': instance.kind,
      'amount': instance.amount,
      'title': instance.title,
      'note': instance.note,
      'at': instance.at.toIso8601String(),
      'expires_at': ?instance.expiresAt?.toIso8601String(),
      'deal_id': ?instance.dealId,
    };

_CreditPackDto _$CreditPackDtoFromJson(Map<String, dynamic> json) =>
    _CreditPackDto(
      id: json['id'] as String,
      credits: (json['credits'] as num).toInt(),
      priceAed: (json['price_aed'] as num?)?.toInt(),
      tag: json['tag'] as String?,
    );

Map<String, dynamic> _$CreditPackDtoToJson(_CreditPackDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'credits': instance.credits,
      'price_aed': ?instance.priceAed,
      'tag': ?instance.tag,
    };
