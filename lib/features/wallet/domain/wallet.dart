import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet.freezed.dart';

enum TxnKind {
  /// Credits held for an application.
  hold,

  /// A hold became final (application approved).
  spend,

  /// Hold returned (not approved / withdrawn before approval).
  refund,
  welcomeBonus,
  referral,
  purchase,
  promo,
}

@freezed
abstract class CreditTxn with _$CreditTxn {
  const factory CreditTxn({
    required String id,
    required TxnKind kind,

    /// Signed: negative = credits out, positive = credits in.
    required int amount,
    required String title,

    /// e.g. "on hold", "valid till 6 Nov 2027".
    required String note,
    required DateTime at,

    /// Credits expire 1 year after they're added.
    DateTime? expiresAt,
    String? dealId,
  }) = _CreditTxn;
}

@freezed
abstract class Wallet with _$Wallet {
  const factory Wallet({
    required int available,
    required int onHold,

    /// How many applications the [onHold] credits belong to.
    @Default(0) int holds,
    int? nextExpiryAmount,
    DateTime? nextExpiryDate,
    required String referralCode,

    /// Newest first.
    @Default([]) List<CreditTxn> history,
  }) = _Wallet;
}

@freezed
abstract class CreditPack with _$CreditPack {
  const factory CreditPack({
    required String id,
    required int credits,

    /// Null until pricing is decided (shown as "AED [XX]").
    int? priceAed,

    /// "POPULAR", "BEST VALUE".
    String? tag,
  }) = _CreditPack;
}
