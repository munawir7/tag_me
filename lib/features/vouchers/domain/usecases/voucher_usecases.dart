import '../../../campaigns/domain/campaign.dart';
import '../../../campaigns/domain/campaign_repository.dart';
import '../../../deals/domain/deal_repository.dart';
import '../voucher.dart';

/// The creator's codes that can still be used, soonest to expire first.
class WatchUsableVouchers {
  const WatchUsableVouchers({
    required DealRepository deals,
    required CampaignRepository campaigns,
    required DateTime Function() now,
  }) : _deals = deals,
       _campaigns = campaigns,
       _now = now;

  final DealRepository _deals;
  final CampaignRepository _campaigns;
  final DateTime Function() _now;

  Stream<List<Voucher>> call() => _deals.watchAll().asyncMap((deals) async {
    final withCode = deals.where((d) => d.code != null).toList();
    // Load the campaigns in parallel (each may be a network call).
    final List<Campaign?> campaigns = await Future.wait(
      withCode.map((d) => _campaigns.byId(d.campaignId)),
    );
    final now = _now();
    final vouchers = <Voucher>[
      for (var i = 0; i < withCode.length; i++)
        if (Voucher.fromDeal(withCode[i], campaigns[i]) case final v?
            when v.isUsable(now))
          v,
    ];
    final far = DateTime(9999);
    vouchers.sort(
      (a, b) => (a.validUntil ?? far).compareTo(b.validUntil ?? far),
    );
    return vouchers;
  });
}
