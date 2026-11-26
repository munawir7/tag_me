// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deal_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DealDto _$DealDtoFromJson(Map<String, dynamic> json) => _DealDto(
  id: json['id'] as String,
  campaignId: json['campaign_id'] as String,
  type: json['type'] as String,
  title: json['title'] as String,
  brandName: json['brand_name'] as String,
  stage: json['stage'] as String,
  credits: (json['credits'] as num).toInt(),
  addressId: json['address_id'] as String?,
  scriptVersion: (json['script_version'] as num?)?.toInt() ?? 1,
  contentRound: (json['content_round'] as num?)?.toInt() ?? 1,
  scriptRejections: (json['script_rejections'] as num?)?.toInt() ?? 0,
  contentRejections: (json['content_rejections'] as num?)?.toInt() ?? 0,
  scriptText: json['script_text'] as String?,
  contentFiles:
      (json['content_files'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  postLink: json['post_link'] as String?,
  delivery: json['delivery'] == null
      ? null
      : DeliveryDto.fromJson(json['delivery'] as Map<String, dynamic>),
  code: json['code'] == null
      ? null
      : IssuedCodeDto.fromJson(json['code'] as Map<String, dynamic>),
  shootDate: json['shoot_date'] == null
      ? null
      : DateTime.parse(json['shoot_date'] as String),
  madeContent: json['made_content'] as bool?,
  endReason: json['end_reason'] as String?,
  strike: json['strike'] as bool? ?? false,
  chat:
      (json['chat'] as List<dynamic>?)
          ?.map((e) => ChatMessageDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  log:
      (json['log'] as List<dynamic>?)
          ?.map((e) => DealEventDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  appliedAt: DateTime.parse(json['applied_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$DealDtoToJson(_DealDto instance) => <String, dynamic>{
  'id': instance.id,
  'campaign_id': instance.campaignId,
  'type': instance.type,
  'title': instance.title,
  'brand_name': instance.brandName,
  'stage': instance.stage,
  'credits': instance.credits,
  'address_id': ?instance.addressId,
  'script_version': instance.scriptVersion,
  'content_round': instance.contentRound,
  'script_rejections': instance.scriptRejections,
  'content_rejections': instance.contentRejections,
  'script_text': ?instance.scriptText,
  'content_files': instance.contentFiles,
  'post_link': ?instance.postLink,
  'delivery': ?instance.delivery?.toJson(),
  'code': ?instance.code?.toJson(),
  'shoot_date': ?instance.shootDate?.toIso8601String(),
  'made_content': ?instance.madeContent,
  'end_reason': ?instance.endReason,
  'strike': instance.strike,
  'chat': instance.chat.map((e) => e.toJson()).toList(),
  'log': instance.log.map((e) => e.toJson()).toList(),
  'applied_at': instance.appliedAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};

_DeliveryDto _$DeliveryDtoFromJson(Map<String, dynamic> json) => _DeliveryDto(
  status: json['status'] as String,
  courier: json['courier'] as String,
  courierKind: json['courier_kind'] as String? ?? 'third_party',
  trackingNo: json['tracking_no'] as String?,
  trackingUrl: json['tracking_url'] as String?,
  eta: json['eta'] == null ? null : DateTime.parse(json['eta'] as String),
  deliverBy: DateTime.parse(json['deliver_by'] as String),
  issue: json['issue'] as String?,
  attempts: (json['attempts'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$DeliveryDtoToJson(_DeliveryDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'courier': instance.courier,
      'courier_kind': instance.courierKind,
      'tracking_no': ?instance.trackingNo,
      'tracking_url': ?instance.trackingUrl,
      'eta': ?instance.eta?.toIso8601String(),
      'deliver_by': instance.deliverBy.toIso8601String(),
      'issue': ?instance.issue,
      'attempts': instance.attempts,
    };

_IssuedCodeDto _$IssuedCodeDtoFromJson(Map<String, dynamic> json) =>
    _IssuedCodeDto(
      kind: json['kind'] as String,
      code: json['code'] as String,
      howToUse: json['how_to_use'] as String,
      validUntil: json['valid_until'] == null
          ? null
          : DateTime.parse(json['valid_until'] as String),
      redeemedAt: json['redeemed_at'] == null
          ? null
          : DateTime.parse(json['redeemed_at'] as String),
    );

Map<String, dynamic> _$IssuedCodeDtoToJson(_IssuedCodeDto instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'code': instance.code,
      'how_to_use': instance.howToUse,
      'valid_until': ?instance.validUntil?.toIso8601String(),
      'redeemed_at': ?instance.redeemedAt?.toIso8601String(),
    };

_ChatMessageDto _$ChatMessageDtoFromJson(Map<String, dynamic> json) =>
    _ChatMessageDto(
      id: json['id'] as String,
      from: json['from'] as String,
      text: json['text'] as String,
      sentAt: DateTime.parse(json['sent_at'] as String),
      tag: json['tag'] as String?,
      videoTimestamp: json['video_timestamp'] as String?,
      attachment: json['attachment'] as String?,
    );

Map<String, dynamic> _$ChatMessageDtoToJson(_ChatMessageDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'from': instance.from,
      'text': instance.text,
      'sent_at': instance.sentAt.toIso8601String(),
      'tag': ?instance.tag,
      'video_timestamp': ?instance.videoTimestamp,
      'attachment': ?instance.attachment,
    };

_DealEventDto _$DealEventDtoFromJson(Map<String, dynamic> json) =>
    _DealEventDto(
      actor: json['actor'] as String?,
      text: json['text'] as String,
      at: DateTime.parse(json['at'] as String),
    );

Map<String, dynamic> _$DealEventDtoToJson(_DealEventDto instance) =>
    <String, dynamic>{
      'actor': ?instance.actor,
      'text': instance.text,
      'at': instance.at.toIso8601String(),
    };
