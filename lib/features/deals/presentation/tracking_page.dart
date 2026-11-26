import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/router.dart';
import '../../../core/theme/tm_colors.dart';
import '../../../core/theme/tm_text.dart';
import '../../../core/utils/dates.dart';
import '../../../core/widgets/widgets.dart';
import '../../profile/application/profile_providers.dart';
import '../application/deal_providers.dart';
import '../domain/deal.dart';

class TrackingPage extends ConsumerWidget {
  const TrackingPage({super.key, required this.dealId});
  final String dealId;

  static const _steps = [
    (DeliveryStatus.ready, 'Getting ready'),
    (DeliveryStatus.packed, 'Packed'),
    (DeliveryStatus.shipped, 'Shipped'),
    (DeliveryStatus.outForDelivery, 'Out for delivery'),
    (DeliveryStatus.delivered, 'Delivered'),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deal = ref.watch(dealProvider(dealId)).value;
    final v = deal?.delivery;
    if (deal == null || v == null) {
      return const Scaffold(body: TmLoading());
    }
    final addr = (ref.watch(creatorProvider).value?.addresses ?? const [])
        .where((a) => a.id == deal.addressId)
        .firstOrNull;
    final done =
        v.status == DeliveryStatus.delivered ||
        v.status == DeliveryStatus.received;
    final si = done
        ? _steps.length
        : _steps.indexWhere((s) => s.$1 == v.status);

    Widget chip(String text) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: TmColors.inkRaised,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Text(
        text,
        style: TmText.body(
          size: 13,
          weight: FontWeight.w600,
          color: TmColors.cream,
        ),
      ),
    );

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          HeroHeader(
            eyebrow: 'Delivery',
            title: done ? 'Delivered' : 'On its way',
            onBack: () => context.popOrGo(),
            bottom: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                chip(v.courier),
                if (v.trackingNo != null) chip('Tracking ${v.trackingNo}'),
                chip('Deliver by ${TmDates.short(v.deliverBy)}'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 6, 20, 0),
            child: TmCard(
              child: Column(
                children: [
                  for (var i = 0; i < _steps.length; i++)
                    IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Column(
                            children: [
                              Container(
                                width: 22,
                                height: 22,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: i < si
                                      ? TmColors.ink
                                      : i == si
                                      ? TmColors.lime
                                      : Colors.white,
                                  border: i < si
                                      ? null
                                      : Border.all(
                                          color: i == si
                                              ? TmColors.ink
                                              : TmColors.line2,
                                          width: 2,
                                        ),
                                ),
                                child: i < si
                                    ? const TmIcon(
                                        TmIcons.check,
                                        size: 12,
                                        color: TmColors.lime,
                                        strokeWidth: 3,
                                      )
                                    : null,
                              ),
                              if (i < _steps.length - 1)
                                Expanded(
                                  child: Container(
                                    width: 2,
                                    color: i < si
                                        ? TmColors.ink
                                        : TmColors.line,
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _steps[i].$2,
                                    style: TmText.body(
                                      weight: i <= si
                                          ? FontWeight.w700
                                          : FontWeight.w500,
                                      color: i <= si
                                          ? TmColors.ink
                                          : TmColors.muted,
                                    ),
                                  ),
                                  if (_steps[i].$1 ==
                                          DeliveryStatus.delivered &&
                                      v.eta != null)
                                    Text(
                                      'ETA ${TmDates.short(v.eta!)}',
                                      style: TmText.small(),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
          if (addr != null)
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 14, 20, 0),
              child: TmCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Eyebrow('Delivering to · confirmed address'),
                    const SizedBox(height: 6),
                    Text(
                      addr.recipient,
                      style: TmText.body(weight: FontWeight.w700),
                    ),
                    Text(
                      '${addr.line} · ${addr.phone}',
                      style: TmText.body(size: 14),
                    ),
                  ],
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 14, 20, 30),
            child: TmCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Eyebrow('Delivered by'),
                  const SizedBox(height: 6),
                  Text(v.courier, style: TmText.body(weight: FontWeight.w700)),
                  Text(
                    v.courierKind == CourierKind.ownTeam
                        ? "The brand's own delivery team. The driver calls "
                              'before arriving.'
                        : 'Courier chosen by the brand. Tracking updates come '
                              "from the brand's logistics team.",
                    style: TmText.small(),
                  ),
                  if (v.trackingUrl != null && v.trackingNo != null) ...[
                    const SizedBox(height: 10),
                    TmButton.ghost(
                      label: 'Open ${v.courier} tracking ↗',
                      small: true,
                      // Opening external links needs url_launcher (step 5).
                      onPressed: () =>
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Opens ${v.trackingUrl}')),
                          ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
