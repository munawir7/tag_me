import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/data/json_enum.dart';
import '../../domain/wallet.dart';

part 'wallet_dto.freezed.dart';
part 'wallet_dto.g.dart';

@freezed
abstract class WalletDto with _$WalletDto {
  const WalletDto._();

  const factory WalletDto({
    required int available,
    required int onHold,
    @Default(0) int holds,
    int? nextExpiryAmount,
    DateTime? nextExpiryDate,
    required String referralCode,
    @Default([]) List<CreditTxnDto> history,
  }) = _WalletDto;

  factory WalletDto.fromJson(Map<String, dynamic> json) =>
      _$WalletDtoFromJson(json);

  factory WalletDto.fromDomain(Wallet w) => WalletDto(
    available: w.available,
    onHold: w.onHold,
    holds: w.holds,
    nextExpiryAmount: w.nextExpiryAmount,
    nextExpiryDate: w.nextExpiryDate,
    referralCode: w.referralCode,
    history: w.history.map(CreditTxnDto.fromDomain).toList(),
  );

  Wallet toDomain() => Wallet(
    available: available,
    onHold: onHold,
    holds: holds,
    nextExpiryAmount: nextExpiryAmount,
    nextExpiryDate: nextExpiryDate,
    referralCode: referralCode,
    history: history.map((t) => t.toDomain()).toList(),
  );
}

@freezed
abstract class CreditTxnDto with _$CreditTxnDto {
  const CreditTxnDto._();

  const factory CreditTxnDto({
    required String id,
    required String kind,
    required int amount,
    required String title,
    required String note,
    required DateTime at,
    DateTime? expiresAt,
    String? dealId,
  }) = _CreditTxnDto;

  factory CreditTxnDto.fromJson(Map<String, dynamic> json) =>
      _$CreditTxnDtoFromJson(json);

  factory CreditTxnDto.fromDomain(CreditTxn t) => CreditTxnDto(
    id: t.id,
    kind: enumToJson(t.kind),
    amount: t.amount,
    title: t.title,
    note: t.note,
    at: t.at,
    expiresAt: t.expiresAt,
    dealId: t.dealId,
  );

  CreditTxn toDomain() => CreditTxn(
    id: id,
    // Unknown kinds keep their sign: money in → promo, out → spend.
    kind: enumFromJson(
      TxnKind.values,
      kind,
      amount >= 0 ? TxnKind.promo : TxnKind.spend,
    ),
    amount: amount,
    title: title,
    note: note,
    at: at,
    expiresAt: expiresAt,
    dealId: dealId,
  );
}

@freezed
abstract class CreditPackDto with _$CreditPackDto {
  const CreditPackDto._();

  const factory CreditPackDto({
    required String id,
    required int credits,
    int? priceAed,
    String? tag,
  }) = _CreditPackDto;

  factory CreditPackDto.fromJson(Map<String, dynamic> json) =>
      _$CreditPackDtoFromJson(json);

  factory CreditPackDto.fromDomain(CreditPack p) => CreditPackDto(
    id: p.id,
    credits: p.credits,
    priceAed: p.priceAed,
    tag: p.tag,
  );

  CreditPack toDomain() =>
      CreditPack(id: id, credits: credits, priceAed: priceAed, tag: tag);
}
