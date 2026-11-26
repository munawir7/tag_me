import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/routes.dart';
import '../../../core/theme/tm_colors.dart';
import '../../../core/theme/tm_text.dart';
import '../../../core/widgets/widgets.dart';
import '../../campaigns/domain/campaign.dart';
import '../../campaigns/presentation/campaign_ui.dart';
import '../../deals/application/deal_providers.dart';
import '../../deals/domain/deal.dart';
import '../../deals/presentation/deal_ui.dart';
import '../../notifications/application/notification_providers.dart';
import '../application/collabs_providers.dart';

class CollabsPage extends ConsumerWidget {
  const CollabsPage({super.key});

  static const _tabs = [
    (CollabBucket.applied, 'Applied'),
    (CollabBucket.ongoing, 'Ongoing'),
    (CollabBucket.done, 'Done'),
    (CollabBucket.closed, 'Closed'),
  ];

  static const _help = {
    CollabBucket.applied: 'Waiting for the brand to approve. Credits on hold.',
    CollabBucket.ongoing:
        'Rejections first, then your turn, then waiting on the brand.',
    CollabBucket.done: 'Finished collabs and codes ready to use.',
    CollabBucket.closed:
        'Not approved (refunded), closed by the brand or expired (no refund).',
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tab = ref.watch(collabsTabProvider);
    final filter = ref.watch(collabsTypeFilterProvider);
    final loading = ref.watch(dealsProvider).isLoading;
    final inTab = ref.watch(dealsInBucketProvider(tab));
    final shown = inTab
        .where((d) => filter == null || d.type == filter)
        .toList();
    final toFix = ref
        .watch(dealsInBucketProvider(CollabBucket.ongoing))
        .where((d) => d.needsFix)
        .length;

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
          children: [
            Row(
              children: [
                Expanded(child: Text('My collabs', style: TmText.display(34))),
                TmIconButton(
                  icon: TmIcons.bell,
                  tooltip: 'Notifications',
                  badgeCount: ref.watch(unreadCountProvider),
                  onPressed: () => context.push(Routes.notifications),
                ),
              ],
            ),
            if (toFix > 0) ...[
              const SizedBox(height: 12),
              Material(
                color: TmColors.ink,
                borderRadius: BorderRadius.circular(16),
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {
                    ref
                        .read(collabsTabProvider.notifier)
                        .select(CollabBucket.ongoing);
                    ref.read(collabsTypeFilterProvider.notifier).select(null);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Row(
                      children: [
                        const InitialAvatar(
                          '!',
                          size: 26,
                          background: Colors.white,
                          foreground: TmColors.ink,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            '$toFix rejected · needs your fix',
                            style: TmText.body(
                              size: 14,
                              weight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          '›',
                          style: TmText.body(color: Colors.white, size: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
            const SizedBox(height: 12),
            Row(
              children: [
                for (final (b, label) in _tabs) ...[
                  if (b != CollabBucket.applied) const SizedBox(width: 6),
                  Expanded(
                    child: _StageBox(
                      label: label,
                      count: ref.watch(dealsInBucketProvider(b)).length,
                      selected: b == tab,
                      onTap: () =>
                          ref.read(collabsTabProvider.notifier).select(b),
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 12),
            Text(_help[tab]!, style: TmText.small()),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (final t in <CampaignType?>[null, ...CampaignType.values])
                    Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: TmFilterChip(
                        '${t?.label ?? 'All'} · '
                        '${inTab.where((d) => t == null || d.type == t).length}',
                        selected: filter == t,
                        onTap: () => ref
                            .read(collabsTypeFilterProvider.notifier)
                            .select(t),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            if (loading)
              const TmLoading()
            else if (shown.isEmpty)
              DashedBorder(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Nothing here yet.',
                    textAlign: TextAlign.center,
                    style: TmText.small(),
                  ),
                ),
              )
            else
              for (final d in shown) ...[
                CollabCard(deal: d),
                const SizedBox(height: 12),
              ],
          ],
        ),
      ),
    );
  }
}

class _StageBox extends StatelessWidget {
  const _StageBox({
    required this.label,
    required this.count,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final int count;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final fg = selected ? Colors.white : TmColors.ink;
    return Semantics(
      selected: selected,
      button: true,
      label: '$label, $count',
      excludeSemantics: true,
      child: Material(
        color: selected ? TmColors.ink : Colors.white,
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
          child: SizedBox(
            height: 64,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('$count', style: TmText.display(22, color: fg)),
                const SizedBox(height: 2),
                Text(
                  label,
                  style: TmText.body(
                    size: 12,
                    weight: FontWeight.w700,
                    color: fg,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// One collab on My collabs.
class CollabCard extends StatelessWidget {
  const CollabCard({super.key, required this.deal});
  final Deal deal;

  @override
  Widget build(BuildContext context) {
    final d = deal;
    final (pill, style) = d.statusPill;
    final steps = d.stepIndex >= 0 && d.bucket == CollabBucket.ongoing;
    final reason = d.needsFix
        ? d.lastBrandMessage?.text
        : (d.stage == DealStage.ended ? d.endReason : null);
    final action = d.actionLabel;
    void open() => d.stage == DealStage.voucher
        ? context.push(Routes.voucher(d.id))
        : context.push(Routes.deal(d.id));

    return TmCard(
      borderColor: d.needsFix ? TmColors.ink : null,
      borderWidth: 2,
      onTap: () => context.push(Routes.deal(d.id)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(6, 5, 10, 5),
                decoration: BoxDecoration(
                  color: TmColors.cream,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 22,
                      height: 22,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: TmIcon(d.type.icon, size: 14, color: TmColors.ink),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      d.type.label,
                      style: TmText.body(size: 12, weight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TmPill(pill, style: style),
                ),
              ),
            ],
          ),
          if (steps) ...[
            const SizedBox(height: 12),
            StepBars(
              total: d.stepCount,
              current: d.stepIndex,
              tone: StepBarsTone.onLight,
            ),
          ],
          const SizedBox(height: 12),
          Row(
            children: [
              InitialAvatar(d.brandName[0]),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(d.title, style: TmText.display(19, height: 1.1)),
                    Text(d.brandName, style: TmText.small()),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            d.summary,
            style: TmText.body(size: 14, color: TmColors.body, height: 1.45),
          ),
          if (reason != null) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(
                color: TmColors.cream,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Eyebrow("Brand's reason", color: TmColors.sub),
                  const SizedBox(height: 4),
                  Text('"$reason"', style: TmText.body(size: 14)),
                ],
              ),
            ),
          ],
          if (action != null) ...[
            const SizedBox(height: 12),
            TmButton(
              label: action,
              small: true,
              variant: d.isBrandsTurn
                  ? TmButtonVariant.ghost
                  : TmButtonVariant.primary,
              onPressed: open,
            ),
          ],
        ],
      ),
    );
  }
}
