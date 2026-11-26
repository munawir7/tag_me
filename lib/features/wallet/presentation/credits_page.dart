import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/tm_colors.dart';
import '../../../core/theme/tm_text.dart';
import '../../../core/utils/dates.dart';
import '../../../core/widgets/widgets.dart';
import '../application/wallet_providers.dart';
import '../domain/wallet.dart';
import '../domain/wallet_repository.dart';

/// Credits tab: balance, top-up, promo code, referral and history.
class CreditsPage extends ConsumerWidget {
  const CreditsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wallet = ref.watch(walletProvider);
    return Scaffold(
      body: wallet.when(
        loading: () => const TmLoading(),
        error: (_, _) => Center(
          child: TmErrorView(
            message: "Couldn't load your credits.",
            onRetry: () => ref.invalidate(walletProvider),
          ),
        ),
        data: (w) => ListView(
          padding: EdgeInsets.zero,
          children: [
            _Balance(wallet: w),
            const ScallopEdge.down(),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 4, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _Heading('Top up'),
                  const _TopUp(),
                  _Heading('Promo code'),
                  const _Promo(),
                  _Heading('Earn free credits'),
                  _Referral(code: w.referralCode),
                  _Heading('History'),
                  if (w.history.isEmpty)
                    Text('No credit activity yet.', style: TmText.small())
                  else
                    for (final t in w.history) _TxnRow(txn: t),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Heading extends StatelessWidget {
  const _Heading(this.text);
  final String text;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: 20, bottom: 12),
    child: Text(text, style: TmText.display(22)),
  );
}

class _Balance extends StatelessWidget {
  const _Balance({required this.wallet});
  final Wallet wallet;

  @override
  Widget build(BuildContext context) {
    final w = wallet;
    final apps = w.holds == 1 ? '1 application' : '${w.holds} applications';
    return Container(
      color: TmColors.ink,
      padding: EdgeInsets.fromLTRB(
        20,
        MediaQuery.paddingOf(context).top + 18,
        20,
        24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Credits', style: TmText.display(34, color: TmColors.cream)),
          const SizedBox(height: 16),
          Row(
            children: [
              Semantics(
                label: '${w.available} credits available',
                excludeSemantics: true,
                child: Rosette(
                  size: 124,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('${w.available}', style: TmText.display(38)),
                      Text(
                        'available',
                        style: TmText.small(
                          color: TmColors.ink,
                          weight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'On hold',
                      style: TmText.small(color: TmColors.onInkMuted),
                    ),
                    Text(
                      w.onHold == 0
                          ? 'Nothing on hold'
                          : '${w.onHold} credits · $apps',
                      style: TmText.body(
                        size: 16,
                        weight: FontWeight.w700,
                        color: TmColors.cream,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Next to expire',
                      style: TmText.small(color: TmColors.onInkMuted),
                    ),
                    Text(
                      w.nextExpiryDate == null
                          ? '—'
                          : '${w.nextExpiryAmount} on ${TmDates.long(w.nextExpiryDate!)}',
                      style: TmText.body(
                        size: 16,
                        weight: FontWeight.w700,
                        color: TmColors.cream,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: TmColors.inkRaised,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                const TmIcon(TmIcons.clock, size: 18, color: TmColors.lime),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'All credits are valid for 1 year. Oldest credits are '
                    'used first.',
                    style: TmText.small(color: TmColors.cream),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TopUp extends ConsumerStatefulWidget {
  const _TopUp();

  @override
  ConsumerState<_TopUp> createState() => _TopUpState();
}

class _TopUpState extends ConsumerState<_TopUp> {
  String? _selected;
  var _busy = false;

  Future<void> _buy(CreditPack p) async {
    setState(() => _busy = true);
    final messenger = ScaffoldMessenger.of(context);
    try {
      await ref.read(requestCreditPackProvider)(p.id);
      messenger.showSnackBar(
        SnackBar(
          content: Text(
            'Request sent for ${p.credits} credits. The TagMe team confirms '
            'the payment and adds them to your balance.',
          ),
        ),
      );
    } catch (_) {
      messenger.showSnackBar(
        const SnackBar(content: Text('Something went wrong. Try again.')),
      );
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final packs = ref.watch(creditPacksProvider);
    return packs.when(
      loading: () => const TmLoading(padding: 16),
      error: (_, _) => TmErrorView(
        message: "Couldn't load the packs.",
        onRetry: () => ref.invalidate(creditPacksProvider),
      ),
      data: (list) {
        if (list.isEmpty) return const SizedBox.shrink();
        // Default to the "POPULAR" pack, like the prototype.
        final selected = list.firstWhere(
          (p) => p.id == _selected,
          orElse: () => list.firstWhere(
            (p) => p.tag == 'POPULAR',
            orElse: () => list.first,
          ),
        );
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Equal-height tiles: stretch needs a bounded height in a list.
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (var i = 0; i < list.length; i++) ...[
                    if (i > 0) const SizedBox(width: 8),
                    Expanded(
                      child: _PackTile(
                        pack: list[i],
                        selected: list[i].id == selected.id,
                        onTap: () => setState(() => _selected = list[i].id),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 12),
            TmButton(
              label: _busy ? 'Sending…' : 'Buy ${selected.credits} credits',
              onPressed: _busy ? null : () => _buy(selected),
            ),
            const SizedBox(height: 6),
            Text(
              'For now, payment is confirmed by the TagMe team.',
              textAlign: TextAlign.center,
              style: TmText.small(),
            ),
          ],
        );
      },
    );
  }
}

class _PackTile extends StatelessWidget {
  const _PackTile({
    required this.pack,
    required this.selected,
    required this.onTap,
  });

  final CreditPack pack;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Semantics(
    selected: selected,
    button: true,
    child: Material(
      color: selected ? TmColors.lime : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: BorderSide(
          color: selected ? TmColors.ink : TmColors.line,
          width: 1.5,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
          child: Column(
            children: [
              SizedBox(
                height: 14,
                child: Text(
                  pack.tag ?? '',
                  style: TmText.body(size: 10, weight: FontWeight.w700),
                ),
              ),
              Text('${pack.credits}', style: TmText.display(28)),
              Text('credits', style: TmText.small(color: TmColors.ink)),
              const SizedBox(height: 6),
              Text(
                pack.priceAed == null ? 'AED [XX]' : 'AED ${pack.priceAed}',
                style: TmText.small(
                  color: TmColors.ink,
                  weight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class _Promo extends ConsumerStatefulWidget {
  const _Promo();

  @override
  ConsumerState<_Promo> createState() => _PromoState();
}

class _PromoState extends ConsumerState<_Promo> {
  final _code = TextEditingController();
  String? _success;
  String? _error;
  var _busy = false;

  @override
  void dispose() {
    _code.dispose();
    super.dispose();
  }

  Future<void> _apply() async {
    setState(() {
      _busy = true;
      _error = null;
      _success = null;
    });
    final code = _code.text.trim().toUpperCase();
    try {
      final added = await ref.read(redeemPromoCodeProvider)(code);
      _code.clear();
      setState(
        () => _success =
            '✓ $code applied. $added credits added, valid for 1 year.',
      );
    } on InvalidPromoCodeError {
      setState(() => _error = "That code isn't valid or was already used.");
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Row(
        children: [
          Expanded(
            child: TextField(
              controller: _code,
              textCapitalization: TextCapitalization.characters,
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => _apply(),
              decoration: InputDecoration(
                hintText: 'e.g. TAGME25',
                errorText: _error,
              ),
            ),
          ),
          const SizedBox(width: 8),
          TmButton(
            label: 'Apply',
            small: true,
            expand: false,
            onPressed: _busy ? null : _apply,
          ),
        ],
      ),
      if (_success != null) ...[
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: TmColors.lime,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            _success!,
            style: TmText.body(size: 13, weight: FontWeight.w700),
          ),
        ),
      ],
    ],
  );
}

class _Referral extends StatelessWidget {
  const _Referral({required this.code});
  final String code;

  @override
  Widget build(BuildContext context) => TmCard(
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Refer a creator',
                style: TmText.body(weight: FontWeight.w700),
              ),
              const SizedBox(height: 2),
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(text: 'You both get credits. Code '),
                    TextSpan(
                      // Non-breaking hyphen keeps the code on one line.
                      text: code.replaceAll('-', '‑'),
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: TmColors.ink,
                      ),
                    ),
                  ],
                ),
                style: TmText.small(),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        TmButton.lime(
          label: 'Share',
          small: true,
          expand: false,
          // The system share sheet needs share_plus (with the backend).
          onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Share sheet opens with code $code')),
          ),
        ),
      ],
    ),
  );
}

class _TxnRow extends StatelessWidget {
  const _TxnRow({required this.txn});
  final CreditTxn txn;

  @override
  Widget build(BuildContext context) {
    final t = txn;
    final incoming = t.amount > 0;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: TmColors.line)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(t.title, style: TmText.body(weight: FontWeight.w700)),
                Text(t.note, style: TmText.small()),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Container(
            padding: incoming
                ? const EdgeInsets.symmetric(horizontal: 8, vertical: 2)
                : null,
            decoration: incoming
                ? BoxDecoration(
                    color: TmColors.lime,
                    borderRadius: BorderRadius.circular(8),
                  )
                : null,
            child: Text(
              incoming ? '+ ${t.amount}' : '− ${-t.amount}',
              style: TmText.display(18),
            ),
          ),
        ],
      ),
    );
  }
}
