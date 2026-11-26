import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/routes.dart';
import '../../../core/theme/tm_colors.dart';
import '../../../core/theme/tm_text.dart';
import '../../../core/widgets/widgets.dart';
import '../../campaigns/application/campaign_providers.dart';
import '../../campaigns/domain/campaign.dart';
import '../../campaigns/presentation/campaign_ui.dart';
import '../../campaigns/presentation/widgets/campaign_card.dart';
import '../../notifications/application/notification_providers.dart';
import '../../onboarding/application/session_controller.dart';
import '../../profile/application/profile_providers.dart';
import '../../wallet/application/wallet_providers.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(sessionProvider);
    final creator = ref.watch(creatorProvider).value;
    final type = ref.watch(homeTypeProvider);
    final country = ref.watch(homeCountryProvider);
    final campaigns = ref.watch(openCampaignsProvider(type));

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: RefreshIndicator(
          color: TmColors.ink,
          onRefresh: () => ref.refresh(openCampaignsProvider(type).future),
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
            children: [
              const _Header(),
              if (status == SessionStatus.underReview) ...[
                const SizedBox(height: 16),
                const _ReviewBanner(),
              ],
              if (status == SessionStatus.verified &&
                  creator != null &&
                  !creator.online) ...[
                const SizedBox(height: 16),
                const _OfflineBanner(),
              ],
              const SizedBox(height: 16),
              const _TypeTiles(),
              const SizedBox(height: 16),
              const _InviteBanner(),
              const SizedBox(height: 20),
              Text('${type.plural} in $country', style: TmText.display(24)),
              const SizedBox(height: 2),
              Text(type.tagline, style: TmText.small()),
              const SizedBox(height: 16),
              ...campaigns.when(
                loading: () => const [TmLoading()],
                error: (_, _) => [
                  TmErrorView(
                    message: "Couldn't load campaigns.",
                    onRetry: () => ref.invalidate(openCampaignsProvider(type)),
                  ),
                ],
                data: (list) => list.isEmpty
                    ? [_Empty(type: type, country: country)]
                    : [
                        for (final c in list) ...[
                          CampaignCard(
                            campaign: c,
                            onOpen: () => context.push(Routes.campaign(c.id)),
                          ),
                          const SizedBox(height: 14),
                        ],
                      ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends ConsumerWidget {
  const _Header();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(creatorProvider).value?.firstName;
    final country = ref.watch(homeCountryProvider);
    final unread = ref.watch(unreadCountProvider);
    final balance = ref.watch(walletProvider).value?.available;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name == null ? 'Hi there' : 'Hi, $name',
                style: TmText.display(30),
              ),
              const SizedBox(height: 6),
              TmChip(
                '$country ▾',
                leading: const TmIcon(TmIcons.pin, size: 14),
                onTap: () => _pickCountry(context, ref),
              ),
            ],
          ),
        ),
        TmIconButton(
          icon: TmIcons.bell,
          tooltip: 'Notifications',
          badgeCount: unread,
          onPressed: () => context.push(Routes.notifications),
        ),
        const SizedBox(width: 8),
        Semantics(
          button: true,
          label: 'Credits: ${balance ?? 0}. Top up',
          excludeSemantics: true,
          child: Material(
            color: Colors.white,
            shape: const StadiumBorder(
              side: BorderSide(color: TmColors.ink, width: 1.5),
            ),
            child: InkWell(
              customBorder: const StadiumBorder(),
              onTap: () => context.go(Routes.credits),
              child: Container(
                height: 44,
                padding: const EdgeInsets.only(left: 8, right: 14),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Rosette(
                      size: 26,
                      lobes: 12,
                      strokeColor: TmColors.ink,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${balance ?? '–'} +',
                      style: TmText.body(size: 14, weight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _pickCountry(BuildContext context, WidgetRef ref) async {
    final current = ref.read(homeCountryProvider);
    final picked = await showTmSheet<String>(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final c in kCountries)
            ListTile(
              title: Text(
                c,
                style: TmText.body(
                  size: 16,
                  weight: c == current ? FontWeight.w700 : FontWeight.w500,
                ),
              ),
              trailing: c == current
                  ? const TmIcon(TmIcons.check, color: TmColors.ink)
                  : null,
              tileColor: c == current ? TmColors.limeSoft : null,
              onTap: () => Navigator.pop(context, c),
            ),
          const SizedBox(height: 8),
        ],
      ),
    );
    if (picked != null) ref.read(homeCountryProvider.notifier).select(picked);
  }
}

class _ReviewBanner extends StatelessWidget {
  const _ReviewBanner();

  @override
  Widget build(BuildContext context) => TmCard(
    borderColor: TmColors.ink,
    radius: 16,
    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
    onTap: () => context.push(Routes.review),
    child: Row(
      children: [
        const TmIcon(TmIcons.clock, size: 22),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Account under review',
                style: TmText.body(size: 14, weight: FontWeight.w700),
              ),
              Text(
                'Browse now. Applying unlocks after verification.',
                style: TmText.small(),
              ),
            ],
          ),
        ),
        const Text('›'),
      ],
    ),
  );
}

class _OfflineBanner extends ConsumerWidget {
  const _OfflineBanner();

  @override
  Widget build(BuildContext context, WidgetRef ref) => Container(
    padding: const EdgeInsets.fromLTRB(14, 12, 12, 12),
    decoration: BoxDecoration(
      color: TmColors.ink,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "You're offline",
                style: TmText.body(
                  size: 14,
                  weight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              Text(
                "Brands can't see you and you can't apply.",
                style: TmText.small(color: TmColors.onInkMuted),
              ),
            ],
          ),
        ),
        TmButton.lime(
          label: 'Go online',
          small: true,
          expand: false,
          onPressed: () => ref.read(setOnlineProvider)(true),
        ),
      ],
    ),
  );
}

class _TypeTiles extends ConsumerWidget {
  const _TypeTiles();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(homeTypeProvider);
    Widget tile(CampaignType t) {
      final on = t == selected;
      return Expanded(
        child: Semantics(
          selected: on,
          button: true,
          child: Material(
            color: on ? TmColors.ink : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
              side: BorderSide(
                color: on ? TmColors.ink : TmColors.line,
                width: 1.5,
              ),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(18),
              onTap: () => ref.read(homeTypeProvider.notifier).select(t),
              child: Container(
                height: 52,
                padding: const EdgeInsets.only(left: 6, right: 8),
                child: Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: on ? TmColors.lime : TmColors.cream,
                        shape: BoxShape.circle,
                      ),
                      child: TmIcon(
                        t.icon,
                        size: 16,
                        color: TmColors.ink,
                        strokeWidth: 2,
                      ),
                    ),
                    const SizedBox(width: 7),
                    Flexible(
                      child: Text(
                        t.plural,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TmText.body(
                          size: 14,
                          weight: FontWeight.w700,
                          color: on ? Colors.white : TmColors.ink,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Column(
      children: [
        Row(
          children: [
            tile(CampaignType.barter),
            const SizedBox(width: 6),
            tile(CampaignType.drop),
          ],
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            tile(CampaignType.event),
            const SizedBox(width: 6),
            tile(CampaignType.offer),
          ],
        ),
      ],
    );
  }
}

class _InviteBanner extends StatelessWidget {
  const _InviteBanner();

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: TmColors.ink,
      borderRadius: BorderRadius.circular(22),
    ),
    child: Row(
      children: [
        const Rosette(
          size: 48,
          lobes: 14,
          child: Icon(Icons.add_rounded, color: TmColors.ink, size: 22),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bring a creator friend',
                style: TmText.body(
                  weight: FontWeight.w700,
                  color: TmColors.cream,
                ),
              ),
              Text(
                'You both get free credits.',
                style: TmText.small(color: TmColors.onInkMuted),
              ),
            ],
          ),
        ),
        TmButton.lime(
          label: 'Invite',
          small: true,
          expand: false,
          onPressed: () => context.go(Routes.credits),
        ),
      ],
    ),
  );
}

class _Empty extends StatelessWidget {
  const _Empty({required this.type, required this.country});
  final CampaignType type;
  final String country;

  @override
  Widget build(BuildContext context) => DashedBorder(
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Text(
        'No ${type.plural.toLowerCase()} in $country right now. '
        'New campaigns are posted every day.',
        textAlign: TextAlign.center,
        style: TmText.body(size: 14, color: TmColors.sub),
      ),
    ),
  );
}
