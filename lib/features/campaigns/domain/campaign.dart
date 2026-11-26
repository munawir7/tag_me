import 'package:freezed_annotation/freezed_annotation.dart';

part 'campaign.freezed.dart';

/// The four kinds of collab. Most rules in the app depend on this.
enum CampaignType {
  /// Product sent to the creator in exchange for approved content.
  barter,

  /// Free product; content optional, no approvals.
  drop,

  /// Promo video before an event, then an entry code + QR.
  event,

  /// Reel, then a discount coupon + QR.
  offer;

  String get label => switch (this) {
    barter => 'Barter',
    drop => 'Product drop',
    event => 'Event entry',
    offer => 'Exclusive offer',
  };

  /// Home tile / section name.
  String get plural => switch (this) {
    barter => 'Barter deals',
    drop => 'Product drops',
    event => 'Event entry',
    offer => 'Exclusive offers',
  };

  String get tagline => switch (this) {
    barter => 'Get the product, create content to the brief',
    drop => 'Free products, content optional',
    event => 'Promote the event, get an entry code',
    offer => 'Make a reel, unlock a coupon',
  };

  /// A physical product is shipped, so a delivery address is required.
  bool get shipsProduct => this == barter || this == drop;

  /// Script → brand review before shooting.
  bool get needsScript => this != drop;

  /// Content is reviewed by the brand (with rejections / rework).
  bool get reviewsContent => this != drop;

  /// A code + QR is issued after content approval.
  bool get issuesCode => this == event || this == offer;

  /// "apply" or "request" (drops are requested).
  String get applyVerb => this == drop ? 'request' : 'apply';

  /// What the creator uploads, as the brand calls it.
  String get contentWord => switch (this) {
    barter => 'reels',
    drop => 'content',
    event => 'video',
    offer => 'reel',
  };
}

/// The brand's campaign dates (set in the brand portal).
enum KeyDateKind {
  applyBy,
  scriptDue,
  dispatchBy,
  deliverBy,
  shootFrom,
  shootTo,
  contentDue,
  postFrom,
  postTo,
  validTo,
}

@freezed
abstract class KeyDate with _$KeyDate {
  const factory KeyDate({
    required KeyDateKind kind,

    /// As the brand worded it, e.g. "Scripts due", "Event day".
    required String label,
    required DateTime date,
  }) = _KeyDate;
}

@freezed
abstract class Brand with _$Brand {
  const Brand._();

  const factory Brand({
    required String id,
    required String name,

    /// Social handle creators tag, e.g. "@glowhaus".
    required String handle,

    /// "Brand value" bars on the campaign page, 1–5.
    @Default(4) int value,
    String? logoUrl,
  }) = _Brand;

  String get initial => name.isEmpty ? '?' : name[0].toUpperCase();
}

@freezed
abstract class Campaign with _$Campaign {
  const Campaign._();

  const factory Campaign({
    required String id,
    required CampaignType type,
    required Brand brand,
    required String title,

    /// e.g. "Beauty", "Music".
    required String category,

    /// Extra card meta, e.g. "Sat 22 Nov · Downtown", "4 branches".
    String? meta,

    /// Display value: "AED 220", "30% off".
    required String worth,
    required int spotsLeft,
    required int spotsTotal,

    /// Credits held when applying.
    required int credits,

    /// Full "YOU GET" paragraph on the detail page.
    required String youGet,

    /// One-liner for the home card, e.g. "Full kit to keep, worth AED 220".
    required String youGetShort,

    /// One-liner for the home card, e.g. "Script + 1 Reel + 1 Story".
    required String contentShort,
    required List<String> criteria,

    /// Script brief; null when there is no script (drops).
    String? brief,

    /// "Who can apply" chips.
    required List<String> eligibility,

    /// "What to deliver".
    required List<String> deliverables,

    /// Brand materials creators can download (file names for now).
    @Default([]) List<String> materials,

    /// The brand may reuse approved content in its own channels and ads.
    @Default(false) bool contentReuse,
    required List<KeyDate> timeline,
    required List<String> howItWorks,

    /// Checkbox text on the apply screen.
    required String agreement,

    /// Text on the "Applied!" screen.
    required String afterApply,
    @Default('UAE') String country,

    /// False once the campaign is closed or full; hidden from Home.
    @Default(true) bool isOpen,
    String? photoUrl,
  }) = _Campaign;

  DateTime? dateOf(KeyDateKind kind) {
    for (final d in timeline) {
      if (d.kind == kind) return d.date;
    }
    return null;
  }

  /// "20 spots left" / "30 boxes left" / "25 left".
  String get spotsLabel => switch (type) {
    CampaignType.drop => '$spotsLeft left',
    _ => '$spotsLeft spots left',
  };
}
