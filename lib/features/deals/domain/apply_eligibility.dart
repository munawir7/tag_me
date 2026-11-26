import '../../campaigns/domain/campaign.dart';
import 'deal.dart';

/// Why a creator can't apply to a campaign right now.
enum ApplyBlock {
  /// There's already an active collab for this campaign.
  alreadyApplied,

  /// The TagMe team hasn't verified the account yet.
  notVerified,

  /// The creator set themselves offline.
  offline,

  /// Balance is lower than the campaign's credit cost.
  notEnoughCredits,
}

/// Thrown by the apply use case when [reason] blocks the application.
class ApplyNotAllowedError implements Exception {
  ApplyNotAllowedError(this.reason);
  final ApplyBlock reason;
  @override
  String toString() => 'ApplyNotAllowedError(${reason.name})';
}

/// The rules for applying, in the order they're checked.
class ApplyEligibility {
  ApplyEligibility._();

  /// Null when the creator may apply.
  static ApplyBlock? check({
    required Campaign campaign,
    required Deal? activeDeal,
    required bool verified,
    required bool online,
    required int available,
  }) {
    if (activeDeal != null) return ApplyBlock.alreadyApplied;
    if (!verified) return ApplyBlock.notVerified;
    if (!online) return ApplyBlock.offline;
    if (available < campaign.credits) return ApplyBlock.notEnoughCredits;
    return null;
  }

  /// The creator's collab for [campaignId] that isn't closed, if any.
  static Deal? activeDealFor(Iterable<Deal> deals, String campaignId) {
    for (final d in deals) {
      if (d.campaignId == campaignId && !d.isClosed) return d;
    }
    return null;
  }
}
