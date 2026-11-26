import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart' show Override;

import '../features/campaigns/application/campaign_providers.dart';
import '../features/deals/application/deal_providers.dart';
import '../features/notifications/application/notification_providers.dart';
import '../features/onboarding/application/onboarding_providers.dart';
import '../features/onboarding/data/mock_auth_repository.dart';
import '../features/profile/application/profile_providers.dart';
import '../features/wallet/application/wallet_providers.dart';
import 'mock/mock_backend.dart';

/// Composition root: the only place that chooses repository
/// implementations. Each feature declares its repository provider (a
/// "port"); here they are bound to the in-memory mock backend.
///
/// When the real API exists, add `apiOverrides` that bind the same
/// providers to API repositories and use them in `main.dart` instead.
final mockBackendProvider = Provider<MockBackend>((ref) {
  final backend = MockBackend(latency: const Duration(milliseconds: 300));
  ref.onDispose(backend.dispose);
  return backend;
});

final List<Override> mockOverrides = [
  campaignRepositoryProvider.overrideWith(
    (ref) => ref.watch(mockBackendProvider).campaigns,
  ),
  dealRepositoryProvider.overrideWith(
    (ref) => ref.watch(mockBackendProvider).deals,
  ),
  walletRepositoryProvider.overrideWith(
    (ref) => ref.watch(mockBackendProvider).wallet,
  ),
  profileRepositoryProvider.overrideWith(
    (ref) => ref.watch(mockBackendProvider).profile,
  ),
  notificationRepositoryProvider.overrideWith(
    (ref) => ref.watch(mockBackendProvider).notifications,
  ),
  devBrandControlsProvider.overrideWith(
    (ref) => ref.watch(mockBackendProvider).deals,
  ),
  authRepositoryProvider.overrideWith(
    (ref) => ref.watch(mockBackendProvider).auth,
  ),
  onboardingRepositoryProvider.overrideWith(
    (ref) => ref.watch(mockBackendProvider).onboarding,
  ),
  devOtpHintProvider.overrideWithValue(
    kDebugMode ? MockAuthRepository.devCode : null,
  ),
];
