import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../campaigns/application/campaign_providers.dart';
import '../../onboarding/application/session_controller.dart';
import '../../profile/application/profile_providers.dart';
import '../../wallet/application/wallet_providers.dart';
import '../domain/apply_eligibility.dart';
import '../domain/collab_stats.dart';
import '../domain/deal.dart';
import '../domain/deal_repository.dart';
import '../domain/deal_rules.dart';
import '../domain/dev_brand_controls.dart';
import '../domain/usecases/deal_usecases.dart';

// ---------------------------------------------------------------------------
// Ports: provided by the app's composition root (see app/providers.dart).
// ---------------------------------------------------------------------------

final dealRepositoryProvider = Provider<DealRepository>(
  (ref) => throw UnimplementedError('dealRepositoryProvider not provided'),
);

/// Debug-only brand controls; null when the backend has none.
final devBrandControlsProvider = Provider<DevBrandControls?>((ref) => null);

// ---------------------------------------------------------------------------
// Use cases
// ---------------------------------------------------------------------------

final applyToCampaignProvider = Provider(
  (ref) => ApplyToCampaign(
    deals: ref.watch(dealRepositoryProvider),
    wallet: ref.watch(walletRepositoryProvider),
    profile: ref.watch(profileRepositoryProvider),
    isVerified: () => ref.read(sessionProvider).canApply,
  ),
);
final withdrawFromDealProvider = Provider(
  (ref) => WithdrawFromDeal(ref.watch(dealRepositoryProvider)),
);
final confirmDeliveryAddressProvider = Provider(
  (ref) => ConfirmDeliveryAddress(ref.watch(dealRepositoryProvider)),
);
final submitScriptProvider = Provider(
  (ref) => SubmitScript(ref.watch(dealRepositoryProvider)),
);
final markReceivedProvider = Provider(
  (ref) => MarkReceived(ref.watch(dealRepositoryProvider)),
);
final undoReceivedProvider = Provider(
  (ref) => UndoReceived(ref.watch(dealRepositoryProvider)),
);
final reportDeliveryProblemProvider = Provider(
  (ref) => ReportDeliveryProblem(ref.watch(dealRepositoryProvider)),
);
final chooseContentProvider = Provider(
  (ref) => ChooseContent(ref.watch(dealRepositoryProvider)),
);
final proposeShootDateProvider = Provider(
  (ref) =>
      ProposeShootDate(ref.watch(dealRepositoryProvider), now: DateTime.now),
);
final markShootDoneProvider = Provider(
  (ref) => MarkShootDone(ref.watch(dealRepositoryProvider)),
);
final submitContentProvider = Provider(
  (ref) => SubmitContent(ref.watch(dealRepositoryProvider)),
);
final sendDealMessageProvider = Provider(
  (ref) => SendDealMessage(ref.watch(dealRepositoryProvider)),
);
final sendPostLinkProvider = Provider(
  (ref) => SendPostLink(ref.watch(dealRepositoryProvider)),
);

// ---------------------------------------------------------------------------
// State for screens
// ---------------------------------------------------------------------------

/// All the creator's collabs, live.
final dealsProvider = StreamProvider<List<Deal>>(
  (ref) => WatchDeals(ref.watch(dealRepositoryProvider))(),
);

/// One collab, live.
final dealProvider = StreamProvider.family<Deal?, String>(
  (ref, id) => WatchDeal(ref.watch(dealRepositoryProvider))(id),
);

/// The creator's active collab for a campaign, if any.
final dealForCampaignProvider = Provider.family<Deal?, String>(
  (ref, campaignId) => ApplyEligibility.activeDealFor(
    ref.watch(dealsProvider).value ?? const [],
    campaignId,
  ),
);

/// Why the creator can't apply to a campaign (null = they can). Null while
/// the data is still loading, too; [ApplyToCampaign] checks again anyway.
final applyBlockProvider = Provider.family<ApplyBlock?, String>((ref, id) {
  final campaign = ref.watch(campaignProvider(id)).value;
  final wallet = ref.watch(walletProvider).value;
  final creator = ref.watch(creatorProvider).value;
  if (campaign == null || wallet == null || creator == null) return null;
  return ApplyEligibility.check(
    campaign: campaign,
    activeDeal: ref.watch(dealForCampaignProvider(id)),
    verified: ref.watch(sessionProvider).canApply,
    online: creator.online,
    available: wallet.available,
  );
});

/// Collabs on one "My collabs" tab, in list order.
final dealsInBucketProvider = Provider.family<List<Deal>, CollabBucket>((
  ref,
  bucket,
) {
  final deals = ref.watch(dealsProvider).value ?? const [];
  return deals.where((d) => d.bucket == bucket).toList()
    ..sort(DealRules.compareForList);
});

/// Completed / active / applied counts for the profile.
final collabStatsProvider = Provider<CollabStats>(
  (ref) => CollabStats.of(ref.watch(dealsProvider).value ?? const []),
);
