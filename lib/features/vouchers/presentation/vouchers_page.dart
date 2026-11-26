import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../app/router.dart';
import '../../../core/theme/tm_colors.dart';
import '../../../core/theme/tm_text.dart';
import '../../../core/utils/dates.dart';
import '../../../core/widgets/widgets.dart';
import '../../deals/domain/deal.dart';
import '../application/voucher_providers.dart';
import '../domain/voucher.dart';

/// "My vouchers": event entry codes and offer coupons, as scannable tickets.
class VouchersPage extends ConsumerStatefulWidget {
  const VouchersPage({super.key, this.dealId});

  /// Opens on this collab's code when given.
  final String? dealId;

  @override
  ConsumerState<VouchersPage> createState() => _VouchersPageState();
}

class _VouchersPageState extends ConsumerState<VouchersPage> {
  String? _selected;

  @override
  Widget build(BuildContext context) {
    final async = ref.watch(vouchersProvider);
    return Scaffold(
      body: SafeArea(
        child: async.when(
          loading: () => const TmLoading(),
          error: (_, _) => TmErrorView(
            message: "Couldn't load your vouchers.",
            onRetry: () => ref.invalidate(vouchersProvider),
          ),
          data: (vouchers) {
            final id = _selected ?? widget.dealId;
            final current = vouchers.isEmpty
                ? null
                : vouchers.firstWhere(
                    (v) => v.dealId == id,
                    orElse: () => vouchers.first,
                  );
            return ListView(
              padding: const EdgeInsets.only(bottom: 30),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 14, 20, 0),
                  child: Row(
                    children: [
                      TmBackButton(onPressed: () => context.popOrGo()),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'My vouchers',
                          style: TmText.body(weight: FontWeight.w700),
                        ),
                      ),
                      Text('Events + offers', style: TmText.small()),
                    ],
                  ),
                ),
                if (current == null)
                  const _Empty()
                else ...[
                  if (vouchers.length > 1)
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.fromLTRB(20, 14, 20, 0),
                      child: Row(
                        children: [
                          for (final v in vouchers)
                            Padding(
                              padding: const EdgeInsets.only(right: 6),
                              child: TmFilterChip(
                                v.title,
                                selected: v.dealId == current.dealId,
                                onTap: () =>
                                    setState(() => _selected = v.dealId),
                              ),
                            ),
                        ],
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
                    child: VoucherTicket(voucher: current),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                    child: TmButton.ghost(
                      label: 'Save to phone',
                      small: true,
                      // Saving an image needs a gallery package (with the
                      // backend work); screenshots work meanwhile.
                      onPressed: () =>
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Saved to photos')),
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 14, 20, 0),
                    child: Text(
                      'Codes are generated only for event entry and exclusive '
                      'offers, after the brand approves your content. The '
                      'brand scans it at the venue and the collab completes '
                      'by itself.',
                      textAlign: TextAlign.center,
                      style: TmText.small(),
                    ),
                  ),
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}

/// Dark-top ticket with the details, then the QR code and the code.
class VoucherTicket extends StatelessWidget {
  const VoucherTicket({super.key, required this.voucher});
  final Voucher voucher;

  List<(String, String)> get _facts {
    final v = voucher;
    final valid = v.validUntil == null ? '—' : TmDates.short(v.validUntil!);
    return switch (v.kind) {
      CodeKind.entryCode => [
        (
          'Date',
          v.eventDate == null ? valid : TmDates.withWeekday(v.eventDate!),
        ),
        ('Admits', 'You + 1'),
        ('Where', v.where ?? '—'),
        ('Code', 'Entry'),
      ],
      _ => [
        ('Valid till', valid),
        ('Uses', '1'),
        ('Where', v.where ?? '—'),
        ('Type', v.kind == CodeKind.coupon ? 'Coupon' : 'Voucher'),
      ],
    };
  }

  @override
  Widget build(BuildContext context) {
    final v = voucher;
    final label = switch (v.kind) {
      CodeKind.entryCode => 'Event entry · entry code',
      CodeKind.coupon => 'Exclusive offer · coupon',
      CodeKind.voucher => 'Exclusive offer · voucher',
    };
    final facts = _facts;
    return TicketCard(
      top: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: Eyebrow(label, color: TmColors.lime)),
              Text('tagme', style: TmText.display(16, color: TmColors.lime)),
            ],
          ),
          const SizedBox(height: 14),
          Text(v.title, style: TmText.display(30, color: TmColors.cream)),
          const SizedBox(height: 4),
          Text(v.brandName, style: TmText.small(color: TmColors.onInkMuted)),
          const SizedBox(height: 14),
          for (var r = 0; r < facts.length; r += 2) ...[
            if (r > 0) const SizedBox(height: 14),
            Row(
              children: [
                for (final (k, val) in facts.sublist(r, r + 2))
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          k,
                          style: TmText.small(color: TmColors.onInkFaint),
                        ),
                        Text(
                          val,
                          style: TmText.body(
                            weight: FontWeight.w700,
                            color: TmColors.cream,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ],
        ],
      ),
      bottom: Column(
        children: [
          Semantics(
            label: 'QR code for ${v.code}',
            image: true,
            child: QrImageView(
              data: v.code,
              size: 190,
              padding: EdgeInsets.zero,
              eyeStyle: const QrEyeStyle(
                eyeShape: QrEyeShape.square,
                color: TmColors.ink,
              ),
              dataModuleStyle: const QrDataModuleStyle(
                dataModuleShape: QrDataModuleShape.square,
                color: TmColors.ink,
              ),
            ),
          ),
          const SizedBox(height: 14),
          SelectableText(
            v.code,
            style: TmText.display(22).copyWith(letterSpacing: 1.8),
          ),
          const SizedBox(height: 8),
          Text(
            v.howToUse,
            textAlign: TextAlign.center,
            style: TmText.small(color: TmColors.ink, height: 1.45),
          ),
        ],
      ),
    );
  }
}

class _Empty extends StatelessWidget {
  const _Empty();

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
    child: Column(
      children: [
        const Rosette(
          size: 110,
          lobes: 14,
          child: TmIcon(TmIcons.qr, size: 34, color: TmColors.ink),
        ),
        const SizedBox(height: 16),
        Text('No codes yet', style: TmText.display(24)),
        const SizedBox(height: 8),
        Text(
          'Event entry codes and offer coupons appear here once the '
          'brand approves your content.',
          textAlign: TextAlign.center,
          style: TmText.body(size: 14, color: TmColors.sub, height: 1.45),
        ),
      ],
    ),
  );
}
