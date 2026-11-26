import 'wallet.dart';

class InvalidPromoCodeError implements Exception {
  InvalidPromoCodeError(this.code);
  final String code;
  @override
  String toString() => 'Invalid promo code: $code';
}

abstract interface class WalletRepository {
  Stream<Wallet> watch();
  Future<List<CreditPack>> packs();

  /// Phase 1: payment is confirmed by hand by the TagMe team, so this only
  /// creates a pending request.
  Future<void> requestPack(String packId);

  /// Adds the promo credits; throws [InvalidPromoCodeError].
  Future<int> redeemPromo(String code);

  /// One-time AED 50 joining bonus after verification.
  Future<void> claimWelcomeBonus();

  /// A friend's referral code, entered once after sign-up.
  Future<void> addReferrer(String code);
}
