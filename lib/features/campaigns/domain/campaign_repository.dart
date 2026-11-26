import 'campaign.dart';

abstract interface class CampaignRepository {
  /// Open campaigns for a country, optionally filtered by type.
  Future<List<Campaign>> listOpen({
    required String country,
    CampaignType? type,
  });

  /// Any campaign (open or closed) by id; null if unknown.
  Future<Campaign?> byId(String id);
}
