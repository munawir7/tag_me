import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/router.dart';
import '../../../app/routes.dart';
import '../../../core/theme/tm_colors.dart';
import '../../../core/theme/tm_text.dart';
import '../../../core/widgets/widgets.dart';
import '../../campaigns/application/campaign_providers.dart';
import '../application/deal_providers.dart';
import '../domain/deal.dart';
import '../domain/deal_rules.dart';
import 'deal_ui.dart';
import 'widgets/deal_sections.dart';
import 'widgets/next_step_card.dart';

class DealPage extends ConsumerWidget {
  const DealPage({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref
        .watch(dealProvider(id))
        .when(
          loading: () => const Scaffold(body: TmLoading()),
          error: (_, _) => Scaffold(
            body: Center(
              child: TmErrorView(
                message: "Couldn't load this collab.",
                onRetry: () => ref.invalidate(dealProvider(id)),
              ),
            ),
          ),
          data: (deal) => deal == null
              ? Scaffold(
                  appBar: AppBar(),
                  body: const Center(
                    child: TmErrorView(message: 'Collab not found.'),
                  ),
                )
              : _DealView(deal: deal),
        );
  }
}

class _DealView extends ConsumerWidget {
  const _DealView({required this.deal});
  final Deal deal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final d = deal;
    final campaign = ref.watch(campaignProvider(d.campaignId)).value;
    final (pill, _) = d.statusPill;
    final showSteps = d.stepIndex >= 0;
    final labels = DealRules.stepLabels(d.type);
    final chatOpen = !d.isClosed && d.stage != DealStage.applied;

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          HeroHeader(
            eyebrow: '${d.type.label} · ${d.brandName}',
            title: d.title,
            backLabel: 'My collabs',
            onBack: () => context.popOrGo(Routes.collabs),
            trailing: TurnPill(
              d.stage == DealStage.done
                  ? 'Completed'
                  : d.isBrandsTurn
                  ? 'Waiting on brand'
                  : d.isClosed
                  ? pill
                  : 'Your turn',
              waiting: d.isBrandsTurn || d.isClosed,
            ),
            bottom: showSteps
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StepBars(total: d.stepCount, current: d.stepIndex),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              labels[d.stepIndex],
                              style: TmText.small(
                                color: TmColors.lime,
                                weight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Text(
                            'Step ${d.stepIndex + 1} of ${d.stepCount}',
                            style: TmText.small(color: TmColors.onInkMuted),
                          ),
                        ],
                      ),
                    ],
                  )
                : null,
          ),
          NextStepCard(deal: d, campaign: campaign),
          if (chatOpen) DealChat(deal: d),
          if (campaign != null && !d.isClosed) ...[
            KeyDatesCard(deal: d, campaign: campaign),
            DeliverablesCard(campaign: campaign),
            if (campaign.materials.isNotEmpty)
              MaterialsCard(campaign: campaign),
          ],
          UpdatesCard(deal: d),
          if (kDebugMode && !d.isClosed) _DevBrandTools(deal: d),
          SizedBox(height: 30 + MediaQuery.paddingOf(context).bottom),
        ],
      ),
    );
  }
}

/// Debug-only buttons that make the simulated brand act right away.
class _DevBrandTools extends ConsumerWidget {
  const _DevBrandTools({required this.deal});
  final Deal deal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final brand = ref.watch(devBrandControlsProvider);
    if (brand == null) return const SizedBox.shrink();
    final d = deal;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 14, 20, 0),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        alignment: WrapAlignment.center,
        children: [
          if (d.stage == DealStage.applied) ...[
            TmChip(
              'Brand approves',
              dashed: true,
              onTap: () => brand.brandApproveApplication(d.id),
            ),
            TmChip(
              'Brand rejects',
              dashed: true,
              onTap: () => brand.brandRejectApplication(d.id),
            ),
          ],
          if (d.stage == DealStage.done)
            TmChip(
              'Brand sends thank-you',
              dashed: true,
              onTap: () => brand.brandSendThankYou(d.id),
            ),
          if (d.stage != DealStage.done)
            TmChip(
              'Brand ends this collab',
              dashed: true,
              onTap: () => brand.brandEndCollab(
                d.id,
                reason: 'Content not acceptable after changes',
                strike: true,
              ),
            ),
        ],
      ),
    );
  }
}
