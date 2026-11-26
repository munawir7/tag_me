import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/router.dart';
import '../../../core/theme/tm_colors.dart';
import '../../../core/theme/tm_text.dart';
import '../../../core/utils/dates.dart';
import '../../../core/widgets/widgets.dart';
import '../application/notification_providers.dart';
import '../domain/app_notification.dart';

/// "Needs you" (unread urgent) first, then earlier updates. Tapping one
/// marks it read and opens the matching collab, voucher or credits page.
class NotificationsPage extends ConsumerWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groups = ref.watch(notificationGroupsProvider);
    final unread = ref.watch(unreadCountProvider);

    void open(AppNotification n) {
      ref.read(markNotificationReadProvider)(n.id);
      context.openLink(n.link);
    }

    return Scaffold(
      body: SafeArea(
        child: groups.when(
          loading: () => const TmLoading(),
          error: (_, _) => TmErrorView(
            message: "Couldn't load notifications.",
            onRetry: () => ref.invalidate(notificationsProvider),
          ),
          data: (g) => ListView(
            padding: const EdgeInsets.fromLTRB(20, 14, 20, 30),
            children: [
              Row(
                children: [
                  TmBackButton(onPressed: () => context.popOrGo()),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text('Notifications', style: TmText.display(26)),
                  ),
                ],
              ),
              if (unread > 0)
                Align(
                  alignment: Alignment.centerRight,
                  child: TmLinkButton(
                    label: 'Mark all as read',
                    small: true,
                    onPressed: () =>
                        ref.read(markAllNotificationsReadProvider)(),
                  ),
                )
              else
                const SizedBox(height: 18),
              if (g.isEmpty)
                const _Empty()
              else ...[
                if (g.needsYou.isNotEmpty) ...[
                  _LatestPush(notification: g.needsYou.first),
                  const SizedBox(height: 18),
                  Eyebrow('Needs you · ${g.needsYou.length}'),
                  const SizedBox(height: 10),
                  for (final n in g.needsYou) ...[
                    _UrgentCard(notification: n, onTap: () => open(n)),
                    const SizedBox(height: 10),
                  ],
                  const SizedBox(height: 8),
                ],
                if (g.earlier.isNotEmpty) ...[
                  const Eyebrow('Earlier'),
                  const SizedBox(height: 10),
                  TmCard(
                    padding: EdgeInsets.zero,
                    child: Column(
                      children: [
                        for (final (i, n) in g.earlier.indexed) ...[
                          if (i > 0) const Divider(),
                          _Row(notification: n, onTap: () => open(n)),
                        ],
                      ],
                    ),
                  ),
                ],
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// The newest urgent one, styled like the push / WhatsApp message.
class _LatestPush extends StatelessWidget {
  const _LatestPush({required this.notification});
  final AppNotification notification;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: TmColors.ink,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: TmColors.lime,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text('tag', style: TmText.display(13)),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Push · also sent on WhatsApp',
                style: TmText.small(color: TmColors.onInkMuted),
              ),
              const SizedBox(height: 2),
              Text(
                [
                  notification.title,
                  notification.body,
                ].whereType<String>().join('. '),
                style: TmText.body(
                  weight: FontWeight.w700,
                  color: TmColors.cream,
                  height: 1.35,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class _UrgentCard extends StatelessWidget {
  const _UrgentCard({required this.notification, required this.onTap});
  final AppNotification notification;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final n = notification;
    return TmCard(
      borderColor: TmColors.ink,
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(n.title, style: TmText.body(weight: FontWeight.w700)),
          const SizedBox(height: 4),
          Text(
            [
              n.body,
              TmDates.ago(n.at, DateTime.now()),
            ].whereType<String>().join(' · '),
            style: TmText.small(),
          ),
          if (n.actionLabel != null) ...[
            const SizedBox(height: 10),
            TmPill(n.actionLabel!),
          ],
        ],
      ),
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({required this.notification, required this.onTap});
  final AppNotification notification;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final n = notification;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            if (!n.read) ...[
              Semantics(
                label: 'Unread',
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: TmColors.ink,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              const SizedBox(width: 10),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    n.title,
                    style: TmText.body(
                      size: 14,
                      weight: n.read ? FontWeight.w500 : FontWeight.w700,
                    ),
                  ),
                  Text(
                    TmDates.ago(n.at, DateTime.now()),
                    style: TmText.small(),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            const Text('›'),
          ],
        ),
      ),
    );
  }
}

class _Empty extends StatelessWidget {
  const _Empty();

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: 40),
    child: Column(
      children: [
        const Rosette(
          size: 100,
          lobes: 14,
          child: TmIcon(TmIcons.bell, size: 30, color: TmColors.ink),
        ),
        const SizedBox(height: 16),
        Text("You're all caught up", style: TmText.display(22)),
        const SizedBox(height: 6),
        Text(
          'Brand approvals, deliveries and codes show up here, and on '
          'WhatsApp.',
          textAlign: TextAlign.center,
          style: TmText.body(size: 14, color: TmColors.sub),
        ),
      ],
    ),
  );
}
