import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/campaign.dart';
import '../domain/campaign_repository.dart';
import '../domain/usecases/campaign_usecases.dart';

/// Port: provided by the app's composition root (see app/providers.dart).
final campaignRepositoryProvider = Provider<CampaignRepository>(
  (ref) => throw UnimplementedError('campaignRepositoryProvider not provided'),
);

final getOpenCampaignsProvider = Provider(
  (ref) => GetOpenCampaigns(ref.watch(campaignRepositoryProvider)),
);
final getCampaignProvider = Provider(
  (ref) => GetCampaign(ref.watch(campaignRepositoryProvider)),
);

/// Countries in the Home country picker.
const kCountries = [
  'UAE',
  'Saudi Arabia',
  'Qatar',
  'Kuwait',
  'Bahrain',
  'Oman',
  'India',
];

class HomeCountry extends Notifier<String> {
  @override
  String build() => 'UAE';
  void select(String country) => state = country;
}

final homeCountryProvider = NotifierProvider<HomeCountry, String>(
  HomeCountry.new,
);

/// The campaign type selected on Home.
class HomeType extends Notifier<CampaignType> {
  @override
  CampaignType build() => CampaignType.barter;
  void select(CampaignType type) => state = type;
}

final homeTypeProvider = NotifierProvider<HomeType, CampaignType>(HomeType.new);

/// Open campaigns of one type in the selected country (Home tab).
final openCampaignsProvider =
    FutureProvider.family<List<Campaign>, CampaignType>((ref, type) {
      final country = ref.watch(homeCountryProvider);
      return ref.watch(getOpenCampaignsProvider)(country: country, type: type);
    });

final campaignProvider = FutureProvider.family<Campaign?, String>(
  (ref, id) => ref.watch(getCampaignProvider)(id),
);
