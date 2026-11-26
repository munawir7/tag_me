import '../../features/campaigns/data/mock_campaign_repository.dart';
import '../../features/deals/data/mock_deal_repository.dart';
import '../../features/notifications/data/mock_notification_repository.dart';
import '../../features/onboarding/data/mock_auth_repository.dart';
import '../../features/profile/data/mock_profile_repository.dart';
import '../../features/wallet/data/mock_wallet_repository.dart';
import '../../features/wallet/domain/wallet.dart';
import 'seed_data.dart';

/// Everything the app talks to, in memory, filled with prototype data.
/// Stands in for the real backend until one exists.
class MockBackend {
  MockBackend({
    DateTime Function()? now,
    BrandSimulation? simulation,
    Duration latency = Duration.zero,
    bool seedDeals = true,
  }) {
    final clock = now ?? DateTime.now;
    final seed = SeedData(clock());

    campaigns = MockCampaignRepository(seed.campaigns, latency: latency);
    profile = MockProfileRepository(seed.creator);
    auth = MockAuthRepository(latency: latency);
    onboarding = MockOnboardingRepository(profile, latency: latency);
    notifications = MockNotificationRepository(
      seedDeals ? seed.notifications : const [],
      now: clock,
    );

    final wallet = seed.wallet;
    this.wallet = MockWalletRepository(
      seedDeals
          ? wallet
          : wallet.copyWith(
              onHold: 0,
              holds: 0,
              history: wallet.history
                  .where((t) => t.kind != TxnKind.hold)
                  .toList(),
            ),
      now: clock,
    );
    if (seedDeals) this.wallet.seedHolds(seed.holds);

    deals = MockDealRepository(
      deals: seedDeals ? seed.deals : const [],
      campaigns: campaigns,
      wallet: this.wallet,
      notifications: notifications,
      profile: profile,
      now: clock,
      simulation: simulation,
    );
  }

  late final MockCampaignRepository campaigns;
  late final MockWalletRepository wallet;
  late final MockProfileRepository profile;
  late final MockAuthRepository auth;
  late final MockOnboardingRepository onboarding;
  late final MockNotificationRepository notifications;
  late final MockDealRepository deals;

  Future<void> dispose() async {
    await deals.dispose();
    await wallet.dispose();
    await profile.dispose();
    await notifications.dispose();
  }
}
