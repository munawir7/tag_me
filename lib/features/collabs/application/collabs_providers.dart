import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../campaigns/domain/campaign.dart';
import '../../deals/domain/deal.dart';

/// Selected tab on My collabs (kept when you leave and come back).
class CollabsTab extends Notifier<CollabBucket> {
  @override
  CollabBucket build() => CollabBucket.ongoing;
  void select(CollabBucket b) => state = b;
}

final collabsTabProvider = NotifierProvider<CollabsTab, CollabBucket>(
  CollabsTab.new,
);

/// Type filter on My collabs; null = all.
class CollabsTypeFilter extends Notifier<CampaignType?> {
  @override
  CampaignType? build() => null;
  void select(CampaignType? t) => state = t;
}

final collabsTypeFilterProvider =
    NotifierProvider<CollabsTypeFilter, CampaignType?>(CollabsTypeFilter.new);
