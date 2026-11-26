import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../app/routes.dart';
import '../../../core/theme/tm_colors.dart';
import '../../../core/theme/tm_text.dart';
import '../../../core/widgets/widgets.dart';
import '../../deals/application/deal_providers.dart';
import '../../onboarding/application/session_controller.dart';
import '../application/profile_providers.dart';
import '../domain/creator.dart';
import 'widgets/add_address_sheet.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ref
          .watch(creatorProvider)
          .when(
            loading: () => const TmLoading(),
            error: (_, _) => Center(
              child: TmErrorView(
                message: "Couldn't load your profile.",
                onRetry: () => ref.invalidate(creatorProvider),
              ),
            ),
            data: (c) => ListView(
              padding: EdgeInsets.zero,
              children: [
                _Header(creator: c),
                const ScallopEdge.down(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 4, 20, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _OnlineCard(online: c.online),
                      const SizedBox(height: 12),
                      _StrikesCard(strikes: c.strikes),
                      const SizedBox(height: 12),
                      const _StatusCard(),
                      const SizedBox(height: 20),
                      const Eyebrow('Connected accounts'),
                      const SizedBox(height: 10),
                      _Socials(creator: c),
                      const SizedBox(height: 20),
                      const Eyebrow('Account'),
                      const SizedBox(height: 10),
                      _Menu(creator: c),
                      const SizedBox(height: 8),
                      TmLinkButton(
                        label: 'Log out',
                        onPressed: () =>
                            ref.read(sessionProvider.notifier).signOut(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
    );
  }
}

// ---------------------------------------------------------------------------

class _Header extends ConsumerWidget {
  const _Header({required this.creator});
  final Creator creator;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = creator;
    final stats = ref.watch(collabStatsProvider);
    Widget stat(String value, String label) => Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: TmColors.inkRaised,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(value, style: TmText.display(24, color: TmColors.cream)),
            Text(label, style: TmText.small(color: TmColors.onInkMuted)),
          ],
        ),
      ),
    );

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
          Row(
            children: [
              Expanded(
                child: Text(
                  'Profile',
                  style: TmText.display(34, color: TmColors.cream),
                ),
              ),
              TmButton.lime(
                label: 'My QR',
                small: true,
                expand: false,
                icon: const TmIcon(TmIcons.qr, size: 18),
                onPressed: () => showCreatorQr(context, c),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              InitialAvatar(
                c.name.isEmpty ? '?' : c.name[0],
                size: 72,
                background: TmColors.lime,
                foreground: TmColors.ink,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      c.name,
                      style: TmText.display(24, color: TmColors.cream),
                    ),
                    Text(
                      [c.primaryHandle, c.city].whereType<String>().join(' · '),
                      style: TmText.small(color: TmColors.onInkMuted),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              stat('${stats.completed}', 'Completed'),
              const SizedBox(width: 8),
              stat('${stats.active}', 'Active'),
              const SizedBox(width: 8),
              stat('${stats.applied}', 'Applied'),
            ],
          ),
        ],
      ),
    );
  }
}

class _OnlineCard extends ConsumerWidget {
  const _OnlineCard({required this.online});
  final bool online;

  @override
  Widget build(BuildContext context, WidgetRef ref) => TmCard(
    borderColor: online ? TmColors.ink : TmColors.line2,
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: online ? TmColors.online : TmColors.offline,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    online ? 'Online' : 'Offline',
                    style: TmText.body(size: 16, weight: FontWeight.w700),
                  ),
                ],
              ),
              const SizedBox(height: 3),
              Text(
                online
                    ? 'Brands can see you and you can apply.'
                    : "Hidden from brands, can't apply. Ongoing collabs "
                          'continue.',
                style: TmText.small(height: 1.4),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Switch(
          value: online,
          onChanged: (v) async {
            final messenger = ScaffoldMessenger.of(context);
            await ref.read(setOnlineProvider)(v);
            messenger
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(
                    v
                        ? "You're online. Brands can see you."
                        : "You're offline. Brands can't see you.",
                  ),
                ),
              );
          },
        ),
      ],
    ),
  );
}

class _StrikesCard extends StatelessWidget {
  const _StrikesCard({required this.strikes});
  final int strikes;

  @override
  Widget build(BuildContext context) => TmCard(
    borderColor: strikes >= Creator.maxStrikes ? TmColors.warnText : null,
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Account standing',
                style: TmText.body(weight: FontWeight.w700),
              ),
              const SizedBox(height: 2),
              Text(
                strikes >= Creator.maxStrikes
                    ? 'Your account is frozen. Contact TagMe support.'
                    : 'Strikes come from unfinished or cancelled collabs. '
                          'At ${Creator.maxStrikes}, your account is frozen.',
                style: TmText.small(height: 1.4),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        TmPill(
          '$strikes / ${Creator.maxStrikes}',
          style: strikes == 0 ? TmPillStyle.you : TmPillStyle.brand,
        ),
      ],
    ),
  );
}

class _StatusCard extends ConsumerWidget {
  const _StatusCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final verified = ref.watch(sessionProvider) == SessionStatus.verified;
    return TmCard(
      onTap: verified ? null : () => context.push(Routes.review),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Account status',
                  style: TmText.body(weight: FontWeight.w700),
                ),
                Text(
                  verified
                      ? 'Verified by TagMe'
                      : 'Under review by the TagMe team',
                  style: TmText.small(),
                ),
              ],
            ),
          ),
          TmPill(
            verified ? 'Verified' : 'In review',
            style: verified ? TmPillStyle.you : TmPillStyle.brand,
          ),
        ],
      ),
    );
  }
}

class _Socials extends StatelessWidget {
  const _Socials({required this.creator});
  final Creator creator;

  static const _suggested = ['Instagram', 'TikTok', 'YouTube'];

  @override
  Widget build(BuildContext context) {
    final linked = {for (final s in creator.socials) s.platform: s};
    final platforms = {..._suggested, ...linked.keys};
    return TmCard(
      child: Column(
        children: [
          for (final (i, p) in platforms.indexed) ...[
            if (i > 0) const Divider(height: 20),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(p, style: TmText.body(weight: FontWeight.w700)),
                      Text(switch (linked[p]) {
                        null => 'Not connected',
                        final s => [
                          s.handle,
                          if (s.followers != null)
                            '${_compact(s.followers!)} followers',
                          if (s.engagement != null)
                            '${s.engagement}% engagement',
                        ].join(' · '),
                      }, style: TmText.small()),
                    ],
                  ),
                ),
                if (linked[p] case final s?)
                  TmPill(
                    s.verified ? 'Verified' : 'Pending',
                    style: s.verified ? TmPillStyle.you : TmPillStyle.grey,
                  )
                else
                  TmChip(
                    'Connect',
                    onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Connecting $p opens here')),
                    ),
                  ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  /// 8400 → "8.4K".
  static String _compact(int n) => n >= 1000000
      ? '${(n / 1000000).toStringAsFixed(1)}M'
      : n >= 1000
      ? '${(n / 1000).toStringAsFixed(1)}K'
      : '$n';
}

class _Menu extends StatelessWidget {
  const _Menu({required this.creator});
  final Creator creator;

  @override
  Widget build(BuildContext context) {
    final n = creator.addresses.length;
    final items = <(String, VoidCallback)>[
      ('Delivery addresses · $n saved', () => _showAddresses(context)),
      (
        'Influencer licence · '
            '${creator.licence == null ? 'optional' : 'added'}',
        () => _soon(context, 'Licence upload'),
      ),
      ('My vouchers', () => context.push(Routes.vouchers)),
      ('Notifications', () => context.push(Routes.notifications)),
      ('Help and support', () => _soon(context, 'Support chat')),
      if (kDebugMode) ('UI kit (dev)', () => context.push(Routes.uiKit)),
    ];
    return TmCard(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          for (final (i, (label, onTap)) in items.indexed) ...[
            if (i > 0) const Divider(),
            InkWell(
              onTap: onTap,
              child: Container(
                constraints: const BoxConstraints(minHeight: 52),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        label,
                        style: TmText.body(weight: FontWeight.w600),
                      ),
                    ),
                    const Text('›'),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  static void _soon(BuildContext context, String what) => ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: Text('$what opens here')));

  void _showAddresses(BuildContext context) => showTmSheet<void>(
    context: context,
    builder: (context) => Consumer(
      builder: (context, ref, _) {
        final list = ref.watch(creatorProvider).value?.addresses ?? const [];
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Delivery addresses', style: TmText.display(24)),
                const SizedBox(height: 12),
                for (final a in list) ...[
                  TmCard(
                    borderColor: TmColors.line2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${a.label} · ${a.recipient}',
                          style: TmText.body(weight: FontWeight.w700),
                        ),
                        Text(
                          '${a.line} · ${a.phone}',
                          style: TmText.small(height: 1.4),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
                TmButton.dashed(
                  label: '+ Add a new address',
                  onPressed: () => showAddAddressSheet(context),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}

/// The creator's ID card with a QR that brands scan at venues.
Future<void> showCreatorQr(BuildContext context, Creator c) => showDialog<void>(
  context: context,
  builder: (context) => Dialog(
    backgroundColor: Colors.transparent,
    insetPadding: const EdgeInsets.all(24),
    child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 360),
      child: TicketCard(
        // The dimmed background behind a dialog has no single colour, so
        // the notches are hidden here.
        notchColor: Colors.transparent,
        topPadding: const EdgeInsets.fromLTRB(22, 16, 12, 20),
        top: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Expanded(
                  child: Eyebrow('Creator ID', color: TmColors.lime),
                ),
                TmIconButton(
                  icon: TmIcons.close,
                  tooltip: 'Close',
                  size: 40,
                  background: TmColors.inkRaised,
                  foreground: Colors.white,
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            Text(c.name, style: TmText.display(22, color: TmColors.cream)),
            const SizedBox(height: 4),
            Text(
              [
                c.primaryHandle,
                c.city,
                c.categories.join(', '),
              ].whereType<String>().where((s) => s.isNotEmpty).join(' · '),
              style: TmText.small(color: TmColors.onInkMuted),
            ),
          ],
        ),
        bottom: Column(
          children: [
            Semantics(
              label: 'QR code for ${c.creatorCode}',
              image: true,
              child: QrImageView(
                data: c.creatorCode,
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
            const SizedBox(height: 12),
            SelectableText(
              c.creatorCode,
              style: TmText.display(18).copyWith(letterSpacing: 0.7),
            ),
            const SizedBox(height: 8),
            Text(
              'Brands scan this at venues and events to check you in.',
              textAlign: TextAlign.center,
              style: TmText.small(color: TmColors.ink),
            ),
          ],
        ),
      ),
    ),
  ),
);
