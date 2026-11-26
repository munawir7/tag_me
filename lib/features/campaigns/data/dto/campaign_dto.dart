import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/data/json_enum.dart';
import '../../domain/campaign.dart';

part 'campaign_dto.freezed.dart';
part 'campaign_dto.g.dart';

/// API shape of a campaign. Maps to and from the domain [Campaign].
@freezed
abstract class CampaignDto with _$CampaignDto {
  const CampaignDto._();

  const factory CampaignDto({
    required String id,
    required String type,
    required BrandDto brand,
    required String title,
    required String category,
    String? meta,
    required String worth,
    required int spotsLeft,
    required int spotsTotal,
    required int credits,
    required String youGet,
    required String youGetShort,
    required String contentShort,
    @Default([]) List<String> criteria,
    String? brief,
    @Default([]) List<String> eligibility,
    @Default([]) List<String> deliverables,
    @Default([]) List<String> materials,
    @Default(false) bool contentReuse,
    @Default([]) List<KeyDateDto> timeline,
    @Default([]) List<String> howItWorks,
    required String agreement,
    required String afterApply,
    @Default('UAE') String country,
    @Default(true) bool isOpen,
    String? photoUrl,
  }) = _CampaignDto;

  factory CampaignDto.fromJson(Map<String, dynamic> json) =>
      _$CampaignDtoFromJson(json);

  factory CampaignDto.fromDomain(Campaign c) => CampaignDto(
    id: c.id,
    type: enumToJson(c.type),
    brand: BrandDto.fromDomain(c.brand),
    title: c.title,
    category: c.category,
    meta: c.meta,
    worth: c.worth,
    spotsLeft: c.spotsLeft,
    spotsTotal: c.spotsTotal,
    credits: c.credits,
    youGet: c.youGet,
    youGetShort: c.youGetShort,
    contentShort: c.contentShort,
    criteria: c.criteria,
    brief: c.brief,
    eligibility: c.eligibility,
    deliverables: c.deliverables,
    materials: c.materials,
    contentReuse: c.contentReuse,
    timeline: c.timeline.map(KeyDateDto.fromDomain).toList(),
    howItWorks: c.howItWorks,
    agreement: c.agreement,
    afterApply: c.afterApply,
    country: c.country,
    isOpen: c.isOpen,
    photoUrl: c.photoUrl,
  );

  Campaign toDomain() => Campaign(
    id: id,
    type: enumFromJson(CampaignType.values, type, CampaignType.barter),
    brand: brand.toDomain(),
    title: title,
    category: category,
    meta: meta,
    worth: worth,
    spotsLeft: spotsLeft,
    spotsTotal: spotsTotal,
    credits: credits,
    youGet: youGet,
    youGetShort: youGetShort,
    contentShort: contentShort,
    criteria: criteria,
    brief: brief,
    eligibility: eligibility,
    deliverables: deliverables,
    materials: materials,
    contentReuse: contentReuse,
    // Unknown date kinds from a newer API are skipped.
    timeline: [
      for (final k in timeline)
        if (k.toDomain() case final d?) d,
    ],
    howItWorks: howItWorks,
    agreement: agreement,
    afterApply: afterApply,
    country: country,
    isOpen: isOpen,
    photoUrl: photoUrl,
  );
}

@freezed
abstract class BrandDto with _$BrandDto {
  const BrandDto._();

  const factory BrandDto({
    required String id,
    required String name,
    required String handle,
    @Default(4) int value,
    String? logoUrl,
  }) = _BrandDto;

  factory BrandDto.fromJson(Map<String, dynamic> json) =>
      _$BrandDtoFromJson(json);

  factory BrandDto.fromDomain(Brand b) => BrandDto(
    id: b.id,
    name: b.name,
    handle: b.handle,
    value: b.value,
    logoUrl: b.logoUrl,
  );

  Brand toDomain() =>
      Brand(id: id, name: name, handle: handle, value: value, logoUrl: logoUrl);
}

@freezed
abstract class KeyDateDto with _$KeyDateDto {
  const KeyDateDto._();

  const factory KeyDateDto({
    required String kind,
    required String label,
    required DateTime date,
  }) = _KeyDateDto;

  factory KeyDateDto.fromJson(Map<String, dynamic> json) =>
      _$KeyDateDtoFromJson(json);

  factory KeyDateDto.fromDomain(KeyDate k) =>
      KeyDateDto(kind: enumToJson(k.kind), label: k.label, date: k.date);

  /// Null when the API sends a date kind this app doesn't know.
  KeyDate? toDomain() {
    final k = enumFromJsonOrNull(KeyDateKind.values, kind);
    return k == null ? null : KeyDate(kind: k, label: label, date: date);
  }
}
