// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CampaignDto _$CampaignDtoFromJson(Map<String, dynamic> json) => _CampaignDto(
  id: json['id'] as String,
  type: json['type'] as String,
  brand: BrandDto.fromJson(json['brand'] as Map<String, dynamic>),
  title: json['title'] as String,
  category: json['category'] as String,
  meta: json['meta'] as String?,
  worth: json['worth'] as String,
  spotsLeft: (json['spots_left'] as num).toInt(),
  spotsTotal: (json['spots_total'] as num).toInt(),
  credits: (json['credits'] as num).toInt(),
  youGet: json['you_get'] as String,
  youGetShort: json['you_get_short'] as String,
  contentShort: json['content_short'] as String,
  criteria:
      (json['criteria'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  brief: json['brief'] as String?,
  eligibility:
      (json['eligibility'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  deliverables:
      (json['deliverables'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  materials:
      (json['materials'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  contentReuse: json['content_reuse'] as bool? ?? false,
  timeline:
      (json['timeline'] as List<dynamic>?)
          ?.map((e) => KeyDateDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  howItWorks:
      (json['how_it_works'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  agreement: json['agreement'] as String,
  afterApply: json['after_apply'] as String,
  country: json['country'] as String? ?? 'UAE',
  isOpen: json['is_open'] as bool? ?? true,
  photoUrl: json['photo_url'] as String?,
);

Map<String, dynamic> _$CampaignDtoToJson(_CampaignDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'brand': instance.brand.toJson(),
      'title': instance.title,
      'category': instance.category,
      'meta': ?instance.meta,
      'worth': instance.worth,
      'spots_left': instance.spotsLeft,
      'spots_total': instance.spotsTotal,
      'credits': instance.credits,
      'you_get': instance.youGet,
      'you_get_short': instance.youGetShort,
      'content_short': instance.contentShort,
      'criteria': instance.criteria,
      'brief': ?instance.brief,
      'eligibility': instance.eligibility,
      'deliverables': instance.deliverables,
      'materials': instance.materials,
      'content_reuse': instance.contentReuse,
      'timeline': instance.timeline.map((e) => e.toJson()).toList(),
      'how_it_works': instance.howItWorks,
      'agreement': instance.agreement,
      'after_apply': instance.afterApply,
      'country': instance.country,
      'is_open': instance.isOpen,
      'photo_url': ?instance.photoUrl,
    };

_BrandDto _$BrandDtoFromJson(Map<String, dynamic> json) => _BrandDto(
  id: json['id'] as String,
  name: json['name'] as String,
  handle: json['handle'] as String,
  value: (json['value'] as num?)?.toInt() ?? 4,
  logoUrl: json['logo_url'] as String?,
);

Map<String, dynamic> _$BrandDtoToJson(_BrandDto instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'handle': instance.handle,
  'value': instance.value,
  'logo_url': ?instance.logoUrl,
};

_KeyDateDto _$KeyDateDtoFromJson(Map<String, dynamic> json) => _KeyDateDto(
  kind: json['kind'] as String,
  label: json['label'] as String,
  date: DateTime.parse(json['date'] as String),
);

Map<String, dynamic> _$KeyDateDtoToJson(_KeyDateDto instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'label': instance.label,
      'date': instance.date.toIso8601String(),
    };
