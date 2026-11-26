import '../../campaigns/domain/campaign.dart';
import '../../deals/domain/deal.dart';

/// A code the creator shows at a venue: an event entry code, or an offer's
/// coupon / voucher. Built from a collab that has an issued code.
class Voucher {
  const Voucher({
    required this.dealId,
    required this.type,
    required this.kind,
    required this.code,
    required this.title,
    required this.brandName,
    required this.howToUse,
    this.validUntil,
    this.eventDate,
    this.where,
    this.redeemedAt,
  });

  /// Builds the voucher for [deal]; null when the deal has no code.
  /// [campaign] adds the event date and location when available.
  static Voucher? fromDeal(Deal deal, Campaign? campaign) {
    final code = deal.code;
    if (code == null) return null;
    return Voucher(
      dealId: deal.id,
      type: deal.type,
      kind: code.kind,
      code: code.code,
      title: deal.title,
      brandName: deal.brandName,
      howToUse: code.howToUse,
      validUntil: code.validUntil,
      eventDate: deal.type == CampaignType.event
          ? campaign?.dateOf(KeyDateKind.shootFrom)
          : null,
      where: campaign?.meta?.split(' · ').last,
      redeemedAt: code.redeemedAt,
    );
  }

  final String dealId;
  final CampaignType type;
  final CodeKind kind;
  final String code;
  final String title;
  final String brandName;
  final String howToUse;
  final DateTime? validUntil;

  /// Event entry only: the day of the event.
  final DateTime? eventDate;

  /// Venue / area, e.g. "Downtown", "Jumeirah".
  final String? where;
  final DateTime? redeemedAt;

  /// Event entry admits the creator plus one guest.
  int get admits => kind == CodeKind.entryCode ? 2 : 1;

  bool isExpired(DateTime now) {
    final until = validUntil;
    if (until == null) return false;
    final lastDay = DateTime(until.year, until.month, until.day + 1);
    return !now.isBefore(lastDay);
  }

  /// Can still be shown and scanned.
  bool isUsable(DateTime now) => redeemedAt == null && !isExpired(now);
}
