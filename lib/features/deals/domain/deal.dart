import 'package:freezed_annotation/freezed_annotation.dart';

import '../../campaigns/domain/campaign.dart';
import 'deal_rules.dart';

part 'deal.freezed.dart';

/// Who did something.
enum Actor { brand, you }

/// Where a collab is. The order a deal moves through depends on its
/// [CampaignType]; see [DealRules.stageOrder].
enum DealStage {
  /// Applied / requested; waiting for the brand. Credits on hold.
  applied,

  /// Approved; confirm the delivery address (barter, drop).
  address,

  /// Write and send the script.
  script,

  /// Brand is reviewing the script.
  scriptReview,

  /// Product is being prepared / shipped / delivered.
  delivery,

  /// Drop only: product received, choose to make content or not.
  choose,

  /// Shoot the content.
  shoot,

  /// Upload the content (also the rework step after a rejection).
  upload,

  /// Brand is reviewing the content.
  contentReview,

  /// Event / offer: code issued, waiting to be used at the venue.
  voucher,

  /// Finished.
  done,

  // --- closed ---

  /// Brand picked other creators. Credits refunded.
  notApproved,

  /// Creator withdrew.
  withdrawn,

  /// Brand ended the collab (reason, maybe a strike). No refund.
  ended,

  /// A deadline passed. No refund.
  expired,
}

/// The tabs on "My collabs".
enum CollabBucket { applied, ongoing, done, closed }

enum DeliveryStatus {
  /// Waiting for script approval before the brand ships (barter).
  hold,
  ready,
  packed,
  shipped,
  outForDelivery,
  delivered,

  /// Creator confirmed they have it.
  received,

  /// Creator reported a problem; brand will reship.
  issue,
}

enum CourierKind { thirdParty, ownTeam }

@freezed
abstract class Delivery with _$Delivery {
  const factory Delivery({
    @Default(DeliveryStatus.hold) DeliveryStatus status,
    required String courier,
    @Default(CourierKind.thirdParty) CourierKind courierKind,
    String? trackingNo,
    String? trackingUrl,
    DateTime? eta,
    required DateTime deliverBy,

    /// Set when [status] is [DeliveryStatus.issue].
    String? issue,

    /// How many times it has been shipped.
    @Default(0) int attempts,
  }) = _Delivery;
}

enum CodeKind {
  entryCode,
  coupon,
  voucher;

  String get label => switch (this) {
    entryCode => 'entry code',
    coupon => 'coupon',
    voucher => 'voucher',
  };
}

/// Entry code / coupon issued after the brand approves the content.
@freezed
abstract class IssuedCode with _$IssuedCode {
  const factory IssuedCode({
    required CodeKind kind,
    required String code,
    required String howToUse,
    DateTime? validUntil,

    /// Set when the brand scans it at the venue.
    DateTime? redeemedAt,
  }) = _IssuedCode;
}

/// One message in the deal's chat with the brand.
@freezed
abstract class ChatMessage with _$ChatMessage {
  const factory ChatMessage({
    required String id,
    required Actor from,
    required String text,
    required DateTime sentAt,

    /// e.g. "Changes requested", "♥ Thank-you".
    String? tag,

    /// Point in the video the brand is commenting on, e.g. "0:12".
    String? videoTimestamp,

    /// Attached file name / URL.
    String? attachment,
  }) = _ChatMessage;
}

/// One line in the deal's "Updates" timeline.
@freezed
abstract class DealEvent with _$DealEvent {
  const factory DealEvent({
    Actor? actor,
    required String text,
    required DateTime at,
  }) = _DealEvent;
}

@freezed
abstract class Deal with _$Deal {
  const Deal._();

  const factory Deal({
    required String id,
    required String campaignId,

    // Copied from the campaign so lists don't need to load it.
    required CampaignType type,
    required String title,
    required String brandName,
    required DealStage stage,

    /// Credits spent / held for this collab.
    required int credits,
    String? addressId,
    @Default(1) int scriptVersion,
    @Default(1) int contentRound,
    @Default(0) int scriptRejections,
    @Default(0) int contentRejections,
    String? scriptText,
    @Default([]) List<String> contentFiles,
    String? postLink,
    Delivery? delivery,
    IssuedCode? code,
    DateTime? shootDate,

    /// Drop only: whether the creator chose to make content.
    bool? madeContent,
    String? endReason,

    /// The brand added a strike when ending the collab.
    @Default(false) bool strike,
    @Default([]) List<ChatMessage> chat,

    /// Newest first.
    @Default([]) List<DealEvent> log,
    required DateTime appliedAt,
    required DateTime updatedAt,
  }) = _Deal;

  CollabBucket get bucket => switch (stage) {
    DealStage.applied => CollabBucket.applied,
    DealStage.voucher || DealStage.done => CollabBucket.done,
    DealStage.notApproved ||
    DealStage.withdrawn ||
    DealStage.ended ||
    DealStage.expired => CollabBucket.closed,
    _ => CollabBucket.ongoing,
  };

  /// Nothing for the creator to do right now.
  bool get waitingOnBrand =>
      stage == DealStage.applied ||
      stage == DealStage.scriptReview ||
      stage == DealStage.contentReview;

  /// The brand rejected the last script / content and wants a fix.
  bool get needsFix =>
      (stage == DealStage.script && scriptRejections > 0) ||
      (stage == DealStage.upload && contentRejections > 0);

  /// Zero-based position in [DealRules.stageOrder] (for the step bars);
  /// -1 when the stage isn't part of the flow (applied / closed).
  int get stepIndex => DealRules.stageOrder(type).indexOf(stage);

  int get stepCount => DealRules.stageOrder(type).length;

  /// The product has left the brand (shipped, out for delivery, delivered).
  bool get hasShipped => const {
    DeliveryStatus.shipped,
    DeliveryStatus.outForDelivery,
    DeliveryStatus.delivered,
  }.contains(delivery?.status);

  /// Nothing for the creator to do right now: waiting for a decision, or
  /// the brand is still preparing the shipment.
  bool get isBrandsTurn =>
      waitingOnBrand || (stage == DealStage.delivery && !hasShipped);

  bool get isClosed => bucket == CollabBucket.closed;
}
