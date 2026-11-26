import '../campaign.dart';
import '../campaign_repository.dart';

class GetOpenCampaigns {
  const GetOpenCampaigns(this._campaigns);
  final CampaignRepository _campaigns;

  /// Open campaigns that still have spots.
  Future<List<Campaign>> call({
    required String country,
    CampaignType? type,
  }) async {
    final list = await _campaigns.listOpen(country: country, type: type);
    return list.where((c) => c.spotsLeft > 0).toList();
  }
}

class GetCampaign {
  const GetCampaign(this._campaigns);
  final CampaignRepository _campaigns;
  Future<Campaign?> call(String id) => _campaigns.byId(id);
}
