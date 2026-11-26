import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/wallet.dart';
import '../domain/wallet_repository.dart';
import '../domain/usecases/wallet_usecases.dart';

/// Port: provided by the app's composition root (see app/providers.dart).
final walletRepositoryProvider = Provider<WalletRepository>(
  (ref) => throw UnimplementedError('walletRepositoryProvider not provided'),
);

final getCreditPacksProvider = Provider(
  (ref) => GetCreditPacks(ref.watch(walletRepositoryProvider)),
);
final requestCreditPackProvider = Provider(
  (ref) => RequestCreditPack(ref.watch(walletRepositoryProvider)),
);
final redeemPromoCodeProvider = Provider(
  (ref) => RedeemPromoCode(ref.watch(walletRepositoryProvider)),
);
final claimWelcomeBonusProvider = Provider(
  (ref) => ClaimWelcomeBonus(ref.watch(walletRepositoryProvider)),
);
final addReferrerProvider = Provider(
  (ref) => AddReferrer(ref.watch(walletRepositoryProvider)),
);

final walletProvider = StreamProvider<Wallet>(
  (ref) => WatchWallet(ref.watch(walletRepositoryProvider))(),
);

final creditPacksProvider = FutureProvider<List<CreditPack>>(
  (ref) => ref.watch(getCreditPacksProvider)(),
);
