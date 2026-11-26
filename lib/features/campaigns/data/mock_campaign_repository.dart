import '../domain/campaign.dart';
import '../domain/campaign_repository.dart';

class MockCampaignRepository implements CampaignRepository {
  MockCampaignRepository(
    List<Campaign> campaigns, {
    this.latency = Duration.zero,
  }) : _byId = {for (final c in campaigns) c.id: c};

  final Map<String, Campaign> _byId;

  /// Fake network delay so loading states show up in the app.
  final Duration latency;

  /// Synchronous lookup for other mocks (the "server" side).
  Campaign? find(String id) => _byId[id];

  @override
  Future<List<Campaign>> listOpen({
    required String country,
    CampaignType? type,
  }) async {
    await Future<void>.delayed(latency);
    return _byId.values
        .where(
          (c) =>
              c.isOpen &&
              c.country == country &&
              (type == null || c.type == type),
        )
        .toList();
  }

  @override
  Future<Campaign?> byId(String id) async {
    await Future<void>.delayed(latency);
    return _byId[id];
  }
}
