import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/data/json_enum.dart';
import '../../../campaigns/domain/campaign.dart';
import '../../domain/deal.dart';

part 'deal_dto.freezed.dart';
part 'deal_dto.g.dart';

/// API shape of a collab. Maps to and from the domain [Deal].
@freezed
abstract class DealDto with _$DealDto {
  const DealDto._();

  const factory DealDto({
    required String id,
    required String campaignId,
    required String type,
    required String title,
    required String brandName,
    required String stage,
    required int credits,
    String? addressId,
    @Default(1) int scriptVersion,
    @Default(1) int contentRound,
    @Default(0) int scriptRejections,
    @Default(0) int contentRejections,
    String? scriptText,
    @Default([]) List<String> contentFiles,
    String? postLink,
    DeliveryDto? delivery,
    IssuedCodeDto? code,
    DateTime? shootDate,
    bool? madeContent,
    String? endReason,
    @Default(false) bool strike,
    @Default([]) List<ChatMessageDto> chat,
    @Default([]) List<DealEventDto> log,
    required DateTime appliedAt,
    required DateTime updatedAt,
  }) = _DealDto;

  factory DealDto.fromJson(Map<String, dynamic> json) =>
      _$DealDtoFromJson(json);

  factory DealDto.fromDomain(Deal d) => DealDto(
    id: d.id,
    campaignId: d.campaignId,
    type: enumToJson(d.type),
    title: d.title,
    brandName: d.brandName,
    stage: enumToJson(d.stage),
    credits: d.credits,
    addressId: d.addressId,
    scriptVersion: d.scriptVersion,
    contentRound: d.contentRound,
    scriptRejections: d.scriptRejections,
    contentRejections: d.contentRejections,
    scriptText: d.scriptText,
    contentFiles: d.contentFiles,
    postLink: d.postLink,
    delivery: d.delivery == null ? null : DeliveryDto.fromDomain(d.delivery!),
    code: d.code == null ? null : IssuedCodeDto.fromDomain(d.code!),
    shootDate: d.shootDate,
    madeContent: d.madeContent,
    endReason: d.endReason,
    strike: d.strike,
    chat: d.chat.map(ChatMessageDto.fromDomain).toList(),
    log: d.log.map(DealEventDto.fromDomain).toList(),
    appliedAt: d.appliedAt,
    updatedAt: d.updatedAt,
  );

  Deal toDomain() => Deal(
    id: id,
    campaignId: campaignId,
    type: enumFromJson(CampaignType.values, type, CampaignType.barter),
    title: title,
    brandName: brandName,
    // An unknown stage from a newer API shows as "applied" (waiting).
    stage: enumFromJson(DealStage.values, stage, DealStage.applied),
    credits: credits,
    addressId: addressId,
    scriptVersion: scriptVersion,
    contentRound: contentRound,
    scriptRejections: scriptRejections,
    contentRejections: contentRejections,
    scriptText: scriptText,
    contentFiles: contentFiles,
    postLink: postLink,
    delivery: delivery?.toDomain(),
    code: code?.toDomain(),
    shootDate: shootDate,
    madeContent: madeContent,
    endReason: endReason,
    strike: strike,
    chat: chat.map((m) => m.toDomain()).toList(),
    log: log.map((e) => e.toDomain()).toList(),
    appliedAt: appliedAt,
    updatedAt: updatedAt,
  );
}

@freezed
abstract class DeliveryDto with _$DeliveryDto {
  const DeliveryDto._();

  const factory DeliveryDto({
    required String status,
    required String courier,
    @Default('third_party') String courierKind,
    String? trackingNo,
    String? trackingUrl,
    DateTime? eta,
    required DateTime deliverBy,
    String? issue,
    @Default(0) int attempts,
  }) = _DeliveryDto;

  factory DeliveryDto.fromJson(Map<String, dynamic> json) =>
      _$DeliveryDtoFromJson(json);

  factory DeliveryDto.fromDomain(Delivery d) => DeliveryDto(
    status: enumToJson(d.status),
    courier: d.courier,
    courierKind: enumToJson(d.courierKind),
    trackingNo: d.trackingNo,
    trackingUrl: d.trackingUrl,
    eta: d.eta,
    deliverBy: d.deliverBy,
    issue: d.issue,
    attempts: d.attempts,
  );

  Delivery toDomain() => Delivery(
    status: enumFromJson(DeliveryStatus.values, status, DeliveryStatus.hold),
    courier: courier,
    courierKind: enumFromJson(
      CourierKind.values,
      courierKind,
      CourierKind.thirdParty,
    ),
    trackingNo: trackingNo,
    trackingUrl: trackingUrl,
    eta: eta,
    deliverBy: deliverBy,
    issue: issue,
    attempts: attempts,
  );
}

@freezed
abstract class IssuedCodeDto with _$IssuedCodeDto {
  const IssuedCodeDto._();

  const factory IssuedCodeDto({
    required String kind,
    required String code,
    required String howToUse,
    DateTime? validUntil,
    DateTime? redeemedAt,
  }) = _IssuedCodeDto;

  factory IssuedCodeDto.fromJson(Map<String, dynamic> json) =>
      _$IssuedCodeDtoFromJson(json);

  factory IssuedCodeDto.fromDomain(IssuedCode c) => IssuedCodeDto(
    kind: enumToJson(c.kind),
    code: c.code,
    howToUse: c.howToUse,
    validUntil: c.validUntil,
    redeemedAt: c.redeemedAt,
  );

  IssuedCode toDomain() => IssuedCode(
    kind: enumFromJson(CodeKind.values, kind, CodeKind.voucher),
    code: code,
    howToUse: howToUse,
    validUntil: validUntil,
    redeemedAt: redeemedAt,
  );
}

@freezed
abstract class ChatMessageDto with _$ChatMessageDto {
  const ChatMessageDto._();

  const factory ChatMessageDto({
    required String id,
    required String from,
    required String text,
    required DateTime sentAt,
    String? tag,
    String? videoTimestamp,
    String? attachment,
  }) = _ChatMessageDto;

  factory ChatMessageDto.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageDtoFromJson(json);

  factory ChatMessageDto.fromDomain(ChatMessage m) => ChatMessageDto(
    id: m.id,
    from: enumToJson(m.from),
    text: m.text,
    sentAt: m.sentAt,
    tag: m.tag,
    videoTimestamp: m.videoTimestamp,
    attachment: m.attachment,
  );

  ChatMessage toDomain() => ChatMessage(
    id: id,
    from: enumFromJson(Actor.values, from, Actor.brand),
    text: text,
    sentAt: sentAt,
    tag: tag,
    videoTimestamp: videoTimestamp,
    attachment: attachment,
  );
}

@freezed
abstract class DealEventDto with _$DealEventDto {
  const DealEventDto._();

  const factory DealEventDto({
    String? actor,
    required String text,
    required DateTime at,
  }) = _DealEventDto;

  factory DealEventDto.fromJson(Map<String, dynamic> json) =>
      _$DealEventDtoFromJson(json);

  factory DealEventDto.fromDomain(DealEvent e) => DealEventDto(
    actor: e.actor == null ? null : enumToJson(e.actor!),
    text: e.text,
    at: e.at,
  );

  DealEvent toDomain() => DealEvent(
    actor: enumFromJsonOrNull(Actor.values, actor),
    text: text,
    at: at,
  );
}
