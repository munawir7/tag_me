import '../../../core/utils/dates.dart';
import '../../../core/widgets/widgets.dart';
import '../../deals/domain/apply_eligibility.dart';
import '../domain/campaign.dart';

/// Display helpers for campaigns (wording used across screens).
extension CampaignTypeUi on CampaignType {
  TmIcons get icon => switch (this) {
    CampaignType.barter => TmIcons.barter,
    CampaignType.drop => TmIcons.drop,
    CampaignType.event => TmIcons.event,
    CampaignType.offer => TmIcons.offer,
  };

  /// Short CTA on cards: "Apply" / "Request".
  String get cta => this == CampaignType.drop ? 'Request' : 'Apply';

  /// CTA on the detail page: "Apply now" / "Request".
  String get ctaLong => this == CampaignType.drop ? 'Request' : 'Apply now';

  /// "CRITERIA" or, for drops, "CONTENT".
  String get contentHeading =>
      this == CampaignType.drop ? 'Content' : 'Criteria';

  String get criteriaTitle =>
      this == CampaignType.drop ? "Brand's requirements" : 'Criteria';
}

extension CampaignUi on Campaign {
  /// "BARTER · BEAUTY · PRODUCT SENT TO YOU" line on the detail page.
  String get eyebrow {
    final third = switch (type) {
      CampaignType.barter => 'Product sent to you',
      CampaignType.drop => 'Content optional',
      CampaignType.event => switch (dateOf(KeyDateKind.shootFrom)) {
        final d? => TmDates.withWeekday(d),
        null => 'Event',
      },
      CampaignType.offer => meta?.split(' · ').last ?? 'Offer',
    };
    return '${type.label} · $category · $third';
  }

  String get applyByLabel =>
      type == CampaignType.drop ? 'Request by' : 'Apply by';

  /// "High" / "Medium" / "Growing" for the brand value bars.
  String get brandValueLabel => switch (brand.value) {
    >= 4 => 'High',
    3 => 'Medium',
    _ => 'Growing',
  };

  String get criteriaNote => type == CampaignType.drop
      ? 'Content is optional. If you make something, upload it in the deal. '
            'No approvals, no corrections.'
      : 'Apply only if you can deliver every point above.';
}

/// What to tell the creator when [ApplyEligibility] blocks applying.
String applyBlockMessage(ApplyBlock reason) => switch (reason) {
  ApplyBlock.alreadyApplied => "You've already applied to this campaign.",
  ApplyBlock.notVerified => 'Applying unlocks once your account is verified.',
  ApplyBlock.offline => "You're offline. Go online to apply.",
  ApplyBlock.notEnoughCredits => "You don't have enough credits. Top up first.",
};
