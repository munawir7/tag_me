import '../wallet.dart';
import '../wallet_repository.dart';

class WatchWallet {
  const WatchWallet(this._wallet);
  final WalletRepository _wallet;
  Stream<Wallet> call() => _wallet.watch();
}

class GetCreditPacks {
  const GetCreditPacks(this._wallet);
  final WalletRepository _wallet;
  Future<List<CreditPack>> call() => _wallet.packs();
}

class RequestCreditPack {
  const RequestCreditPack(this._wallet);
  final WalletRepository _wallet;
  Future<void> call(String packId) => _wallet.requestPack(packId);
}

/// Returns the credits added; throws [InvalidPromoCodeError].
class RedeemPromoCode {
  const RedeemPromoCode(this._wallet);
  final WalletRepository _wallet;

  Future<int> call(String code) {
    final c = code.trim().toUpperCase();
    if (c.isEmpty) throw InvalidPromoCodeError(code);
    return _wallet.redeemPromo(c);
  }
}

class ClaimWelcomeBonus {
  const ClaimWelcomeBonus(this._wallet);
  final WalletRepository _wallet;
  Future<void> call() => _wallet.claimWelcomeBonus();
}

/// A friend's referral code, e.g. "MAYA-TM25". Throws [InvalidPromoCodeError].
class AddReferrer {
  const AddReferrer(this._wallet);
  final WalletRepository _wallet;

  static final _format = RegExp(r'^[A-Z0-9]{2,12}-[A-Z0-9]{2,8}$');

  Future<void> call(String code) {
    final c = code.trim().toUpperCase();
    if (!_format.hasMatch(c)) throw InvalidPromoCodeError(code);
    return _wallet.addReferrer(c);
  }
}
