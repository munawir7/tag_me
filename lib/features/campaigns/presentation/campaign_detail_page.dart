import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../app/routes.dart';
import '../../../core/theme/tm_colors.dart';
import '../../../core/theme/tm_text.dart';
import '../../../core/utils/dates.dart';
import '../../../core/widgets/widgets.dart';
import '../../deals/application/deal_providers.dart';
import '../../deals/domain/apply_eligibility.dart';
import '../../deals/domain/deal.dart';
import '../../profile/application/profile_providers.dart';
import '../../wallet/application/wallet_providers.dart';
import '../application/campaign_providers.dart';
import '../domain/campaign.dart';
import 'campaign_ui.dart';

class CampaignDetailPage extends ConsumerWidget {
  const CampaignDetailPage({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref
        .watch(campaignProvider(id))
        .when(
          loading: () => const Scaffold(body: TmLoading()),
          error: (_, _) => Scaffold(
            body: Center(
              child: TmErrorView(
                message: "Couldn't load this campaign.",
                onRetry: () => ref.invalidate(campaignProvider(id)),
              ),
            ),
          ),
          data: (c) => c == null
              ? Scaffold(
                  appBar: AppBar(),
                  body: const Center(
                    child: TmErrorView(
                      message: 'This campaign is no longer available.',
                    ),
                  ),
                )
              : _CampaignView(campaign: c),
        );
  }
}

class _CampaignView extends ConsumerWidget {
  const _CampaignView({required this.campaign});
  final Campaign campaign;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = campaign;
    final deal = ref.watch(dealForCampaignProvider(c.id));
    final locked =
        ref.watch(applyBlockProvider(c.id)) == ApplyBlock.notEnoughCredits;
    final top = MediaQuery.paddingOf(context).top;

    final sections = <Widget>[
      _BrandRow(campaign: c),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Eyebrow(c.eyebrow),
          const SizedBox(height: 6),
          Text(c.title, style: TmText.display(38, height: 0.98)),
        ],
      ),
      if (deal != null) _InCollabBanner(deal: deal),
      Row(
        children: [
          _Stat('Worth', c.worth),
          const SizedBox(width: 8),
          _Stat('Spots left', '${c.spotsLeft} of ${c.spotsTotal}'),
          const SizedBox(width: 8),
          _Stat(
            c.applyByLabel,
            TmDates.short(c.dateOf(KeyDateKind.applyBy) ?? DateTime.now()),
          ),
        ],
      ),
      _Section(
        title: 'You get',
        child: Text(c.youGet, style: TmText.body(height: 1.45)),
      ),
      _Criteria(campaign: c, locked: locked),
      if (c.brief != null)
        _Section(
          title: 'Script brief from the brand',
          outlined: true,
          children: [
            Text(c.brief!, style: TmText.body(height: 1.45)),
            Text(
              'If selected, you send your script first. Shoot only after '
              'the brand approves it.',
              style: TmText.small(),
            ),
          ],
        ),
      _KeyDates(campaign: c),
      _Section(
        title: 'What to deliver',
        children: [
          for (final d in c.deliverables) _CheckLine(d),
          if (c.contentReuse)
            _Note(
              bold: 'Content reuse: ',
              text:
                  'the brand may reuse your approved content on its own '
                  'channels and ads.',
            ),
        ],
      ),
      _Section(
        title: 'Who can apply',
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 18,
              height: 18,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: TmColors.lime,
                shape: BoxShape.circle,
              ),
              child: const TmIcon(
                TmIcons.check,
                size: 10,
                color: TmColors.ink,
                strokeWidth: 3.6,
              ),
            ),
            const SizedBox(width: 6),
            Text(
              'You match',
              style: TmText.small(color: TmColors.ink, weight: FontWeight.w700),
            ),
          ],
        ),
        child: Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [for (final e in c.eligibility) TmChip(e)],
        ),
      ),
      _HowItWorks(steps: c.howItWorks),
    ];

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          PhotoPlaceholder(
            height: 260 + top,
            radius: 0,
            label: 'Brand photos',
            imageUrl: c.photoUrl,
            overlay: [
              Positioned(
                top: top + 14,
                left: 16,
                child: TmBackButton(onPressed: () => context.popOrGo()),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (var i = 0; i < sections.length; i++) ...[
                  if (i > 0) const SizedBox(height: 14),
                  sections[i],
                ],
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _ApplyBar(campaign: c, deal: deal),
    );
  }
}

// ---------------------------------------------------------------------------

class _BrandRow extends StatelessWidget {
  const _BrandRow({required this.campaign});
  final Campaign campaign;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      InitialAvatar(campaign.brand.initial, size: 44),
      const SizedBox(width: 10),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              campaign.brand.name,
              style: TmText.body(weight: FontWeight.w700),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text('Brand value ', style: TmText.small()),
                for (var i = 0; i < 5; i++)
                  Container(
                    width: 16,
                    height: 6,
                    margin: const EdgeInsets.only(right: 3),
                    decoration: BoxDecoration(
                      color: i < campaign.brand.value
                          ? TmColors.ink
                          : TmColors.line2,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                const SizedBox(width: 4),
                Text(
                  campaign.brandValueLabel,
                  style: TmText.small(
                    color: TmColors.ink,
                    weight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}

class _InCollabBanner extends StatelessWidget {
  const _InCollabBanner({required this.deal});
  final Deal deal;

  @override
  Widget build(BuildContext context) {
    final pending = deal.stage == DealStage.applied;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: TmColors.ink,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          const TmIcon(TmIcons.clock, size: 22, color: TmColors.lime),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pending
                      ? 'Applied · waiting on the brand'
                      : "You're in this collab",
                  style: TmText.body(
                    weight: FontWeight.w700,
                    color: TmColors.cream,
                  ),
                ),
                Text(
                  pending
                      ? '${deal.credits} credits on hold, refunded if not approved.'
                      : 'Your next steps are in the collab.',
                  style: TmText.small(color: TmColors.onInkMuted),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat(this.label, this.value);
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) => Expanded(
    child: TmCard(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TmText.small()),
          Text(value, style: TmText.body(weight: FontWeight.w700)),
        ],
      ),
    ),
  );
}

/// White card with an eyebrow title, optional trailing widget and content.
class _Section extends StatelessWidget {
  const _Section({
    required this.title,
    this.child,
    this.children = const [],
    this.trailing,
    this.outlined = false,
  });

  final String title;
  final Widget? child;
  final List<Widget> children;
  final Widget? trailing;
  final bool outlined;

  @override
  Widget build(BuildContext context) {
    final body = [if (child != null) child!, ...children];
    return TmCard(
      borderColor: outlined ? TmColors.ink : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(child: Eyebrow(title)),
              if (trailing != null) trailing!,
            ],
          ),
          for (final w in body) ...[const SizedBox(height: 8), w],
        ],
      ),
    );
  }
}

class _Criteria extends StatelessWidget {
  const _Criteria({required this.campaign, required this.locked});
  final Campaign campaign;
  final bool locked;

  @override
  Widget build(BuildContext context) {
    final c = campaign;
    final optional = c.type == CampaignType.drop;
    final content = ConstrainedBox(
      // Leave room for the lock overlay on short lists.
      constraints: BoxConstraints(minHeight: locked ? 230 : 0),
      child: _Section(
        title: c.type.criteriaTitle,
        trailing: TmPill(
          optional ? 'Optional' : 'All required',
          style: optional ? TmPillStyle.grey : TmPillStyle.dark,
        ),
        children: [
          for (var i = 0; i < c.criteria.length; i++)
            Text(
              '${i + 1}.  ${c.criteria[i]}',
              style: TmText.body(height: 1.4),
            ),
          Text(c.criteriaNote, style: TmText.small()),
        ],
      ),
    );
    if (!locked) return content;

    return ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: Stack(
        children: [
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
            child: ExcludeSemantics(child: content),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.white.withValues(alpha: 0.35),
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: TmColors.ink,
                      shape: BoxShape.circle,
                    ),
                    child: const TmIcon(
                      TmIcons.lock,
                      size: 22,
                      color: TmColors.lime,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Criteria locked',
                    style: TmText.body(weight: FontWeight.w700),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Top up to at least ${c.credits} credits to see the full '
                    'criteria and ${c.type.applyVerb}.',
                    textAlign: TextAlign.center,
                    style: TmText.small(color: TmColors.ink),
                  ),
                  const SizedBox(height: 10),
                  TmButton.lime(
                    label: 'Top up credits',
                    small: true,
                    expand: false,
                    onPressed: () => context.go(Routes.credits),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _KeyDates extends StatelessWidget {
  const _KeyDates({required this.campaign});
  final Campaign campaign;

  @override
  Widget build(BuildContext context) => _Section(
    title: 'Key dates',
    trailing: Text('Set by ${campaign.brand.name}', style: TmText.small()),
    children: [
      for (final d in campaign.timeline)
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: TmColors.sand)),
          ),
          child: Row(
            children: [
              Expanded(child: Text(d.label, style: TmText.body(size: 14))),
              Text(
                TmDates.short(d.date),
                style: TmText.body(size: 14, weight: FontWeight.w700),
              ),
            ],
          ),
        ),
      const _Note(
        bold: 'Credits: ',
        text:
            "refunded only if your application isn't approved. If the "
            'brand closes the deal after rejecting your content, credits '
            'are not refunded.',
        plain: true,
      ),
    ],
  );
}

class _HowItWorks extends StatelessWidget {
  const _HowItWorks({required this.steps});
  final List<String> steps;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: 6),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Eyebrow('How it works'),
        for (var i = 0; i < steps.length; i++) ...[
          const SizedBox(height: 12),
          Row(
            children: [
              InitialAvatar('${i + 1}', size: 30),
              const SizedBox(width: 12),
              Expanded(child: Text(steps[i], style: TmText.body())),
            ],
          ),
        ],
      ],
    ),
  );
}

class _CheckLine extends StatelessWidget {
  const _CheckLine(this.text);
  final String text;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Container(
        width: 22,
        height: 22,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: TmColors.cream,
          shape: BoxShape.circle,
        ),
        child: const TmIcon(
          TmIcons.check,
          size: 12,
          color: TmColors.ink,
          strokeWidth: 3,
        ),
      ),
      const SizedBox(width: 8),
      Expanded(
        child: Text(
          text,
          style: TmText.body(size: 14, weight: FontWeight.w600),
        ),
      ),
    ],
  );
}

class _Note extends StatelessWidget {
  const _Note({required this.bold, required this.text, this.plain = false});
  final String bold;
  final String text;

  /// No cream background.
  final bool plain;

  @override
  Widget build(BuildContext context) => Container(
    padding: plain ? EdgeInsets.zero : const EdgeInsets.all(12),
    decoration: plain
        ? null
        : BoxDecoration(
            color: TmColors.cream,
            borderRadius: BorderRadius.circular(12),
          ),
    child: Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: bold,
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
          TextSpan(text: text),
        ],
      ),
      style: TmText.small(color: TmColors.ink, height: 1.45),
    ),
  );
}

/// Sticky bar at the bottom: cost + the right button for the situation.
class _ApplyBar extends ConsumerWidget {
  const _ApplyBar({required this.campaign, required this.deal});
  final Campaign campaign;
  final Deal? deal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = campaign;
    // The rules live in the domain (ApplyEligibility); this only words them.
    final block = ref.watch(applyBlockProvider(c.id));
    final available = ref.watch(walletProvider).value?.available;

    final String amount;
    final String note;
    final Widget button;

    switch (block) {
      case ApplyBlock.alreadyApplied:
        final pending = deal?.stage == DealStage.applied;
        amount = pending ? '${c.credits} held' : '${c.credits} credits';
        note = pending
            ? 'On hold until the brand decides'
            : "You're in this collab";
        button = pending
            ? TmButton.lime(
                label: '✓ Applied',
                small: true,
                expand: false,
                onPressed: () => context.push(Routes.deal(deal!.id)),
              )
            : TmButton(
                label: 'Open collab',
                small: true,
                expand: false,
                onPressed: () => context.push(Routes.deal(deal!.id)),
              );
      case ApplyBlock.notVerified:
        amount = '${c.credits} credits';
        note = 'Unlocks after verification';
        button = TmButton(
          label: c.type.ctaLong,
          small: true,
          expand: false,
          onPressed: null,
        );
      case ApplyBlock.offline:
        amount = '${c.credits} credits';
        note = 'You are offline';
        button = TmButton(
          label: 'Go online to ${c.type.applyVerb}',
          small: true,
          expand: false,
          onPressed: () => ref.read(setOnlineProvider)(true),
        );
      case ApplyBlock.notEnoughCredits:
        amount = '${c.credits} credits';
        note = 'You have ${available ?? 0} · need ${c.credits}';
        button = TmButton(
          label: 'Top up',
          small: true,
          expand: false,
          onPressed: () => context.go(Routes.credits),
        );
      case null:
        amount = '${c.credits} credits';
        note = 'Refunded if not approved';
        button = TmButton(
          label: c.type.ctaLong,
          small: true,
          expand: false,
          onPressed: () => context.push(Routes.apply(c.id)),
        );
    }

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: TmColors.line, width: 2)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 14, 20, 14),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(amount, style: TmText.display(26)),
                    Text(note, style: TmText.small()),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              button,
            ],
          ),
        ),
      ),
    );
  }
}
