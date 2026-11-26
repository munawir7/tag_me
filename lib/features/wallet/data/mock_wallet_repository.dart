import '../../../core/mock/live_value.dart';
import '../../../core/utils/dates.dart';
import '../../deals/domain/deal_repository.dart';
import '../domain/wallet.dart';
import '../domain/wallet_repository.dart';

/// In-memory wallet. Besides the creator-facing [WalletRepository], it has
/// the server-side operations the mock deal repository calls:
/// [hold], [capture] and [refund].
class MockWalletRepository implements WalletRepository {
  MockWalletRepository(Wallet initial, {required this.now})
    : _wallet = LiveValue(_withExpiry(initial)),
      // Seeded creators may already have had the joining bonus.
      _welcomeClaimed = initial.history.any(
        (t) => t.kind == TxnKind.welcomeBonus,
      );

  final DateTime Function() now;
  final LiveValue<Wallet> _wallet;
  final _holds = <String, int>{};
  final _usedPromos = <String>{};
  bool _welcomeClaimed;
  var _seq = 0;

  /// Placeholder until pricing is decided: AED 50 = 50 credits.
  static const welcomeBonus = 50;
  static const promoCodes = {'TAGME25': 25};

  Wallet get current => _wallet.value;

  /// Registers holds that exist in seed data.
  void seedHolds(Map<String, int> holds) => _holds.addAll(holds);

  @override
  Stream<Wallet> watch() => _wallet.stream;

  @override
  Future<List<CreditPack>> packs() async => const [
    CreditPack(id: 'p50', credits: 50),
    CreditPack(id: 'p120', credits: 120, tag: 'POPULAR'),
    CreditPack(id: 'p300', credits: 300, tag: 'BEST VALUE'),
  ];

  @override
  Future<void> requestPack(String packId) async {
    // Phase 1: the TagMe team confirms payment by hand; nothing changes yet.
  }

  @override
  Future<int> redeemPromo(String code) async {
    final key = code.trim().toUpperCase();
    final amount = promoCodes[key];
    if (amount == null || _usedPromos.contains(key)) {
      throw InvalidPromoCodeError(code);
    }
    _usedPromos.add(key);
    _credit(TxnKind.promo, amount, 'Promo · $key');
    return amount;
  }

  @override
  Future<void> claimWelcomeBonus() async {
    if (_welcomeClaimed) return;
    _welcomeClaimed = true;
    _credit(TxnKind.welcomeBonus, welcomeBonus, 'Welcome bonus · AED 50');
  }

  @override
  Future<void> addReferrer(String code) async {
    // The friend gets the reward; the new creator already had the bonus.
  }

  // ---- server side -------------------------------------------------------

  /// Moves [amount] from available to on hold for [dealId].
  void hold(String dealId, int amount, String title) {
    final w = _wallet.value;
    if (w.available < amount) {
      throw InsufficientCreditsError(needed: amount, available: w.available);
    }
    _holds[dealId] = amount;
    _wallet.value = w.copyWith(
      available: w.available - amount,
      onHold: w.onHold + amount,
      holds: w.holds + 1,
      history: [
        CreditTxn(
          id: _id(),
          kind: TxnKind.hold,
          amount: -amount,
          title: 'Applied · $title',
          note: '${TmDates.short(now())} · on hold',
          at: now(),
          dealId: dealId,
        ),
        ...w.history,
      ],
    );
  }

  /// The brand approved: the held credits are spent.
  void capture(String dealId) {
    final amount = _holds.remove(dealId);
    if (amount == null) return;
    final w = _wallet.value;
    _wallet.value = w.copyWith(
      onHold: w.onHold - amount,
      holds: w.holds - 1,
      history: [
        for (final t in w.history)
          t.dealId == dealId && t.kind == TxnKind.hold
              ? t.copyWith(
                  kind: TxnKind.spend,
                  note: '${TmDates.short(t.at)} · approved',
                )
              : t,
      ],
    );
  }

  /// Not approved / withdrawn before approval: credits come back.
  void refund(String dealId, String title, {required String reason}) {
    final amount = _holds.remove(dealId);
    if (amount == null) return;
    final w = _wallet.value;
    _wallet.value = w.copyWith(
      available: w.available + amount,
      onHold: w.onHold - amount,
      holds: w.holds - 1,
      history: [
        CreditTxn(
          id: _id(),
          kind: TxnKind.refund,
          amount: amount,
          title: 'Refund · $title',
          note: '${TmDates.short(now())} · $reason',
          at: now(),
          dealId: dealId,
        ),
        ...w.history,
      ],
    );
  }

  void _credit(TxnKind kind, int amount, String title) {
    final w = _wallet.value;
    final at = now();
    final expires = DateTime(at.year + 1, at.month, at.day);
    final history = [
      CreditTxn(
        id: _id(),
        kind: kind,
        amount: amount,
        title: title,
        note: '${TmDates.short(at)} · valid till ${TmDates.long(expires)}',
        at: at,
        expiresAt: expires,
      ),
      ...w.history,
    ];
    _wallet.value = _withExpiry(
      w.copyWith(available: w.available + amount, history: history),
    );
  }

  /// Oldest credits expire first.
  static Wallet _withExpiry(Wallet w) {
    final dated =
        w.history.where((t) => t.amount > 0 && t.expiresAt != null).toList()
          ..sort((a, b) => a.expiresAt!.compareTo(b.expiresAt!));
    if (dated.isEmpty) return w;
    return w.copyWith(
      nextExpiryAmount: dated.first.amount,
      nextExpiryDate: dated.first.expiresAt,
    );
  }

  String _id() => 'txn-${++_seq}';

  Future<void> dispose() => _wallet.close();
}
