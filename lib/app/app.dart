import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/constants/app_constants.dart';
import '../core/theme/app_theme.dart';
import '../features/notifications/application/notification_providers.dart';
import '../features/notifications/domain/app_notification.dart';
import 'router.dart';
import 'routes.dart';

final _messengerKey = GlobalKey<ScaffoldMessengerState>();

class TagMeApp extends ConsumerWidget {
  const TagMeApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    // In-app alert for each new notification (brand approved, shipped, …).
    ref.listen<AsyncValue<List<AppNotification>>>(notificationsProvider, (
      prev,
      next,
    ) {
      final before = prev?.value;
      final now = next.value;
      if (before == null || now == null) return; // first load: no alerts
      final known = {for (final n in before) n.id};
      final fresh = now.where((n) => !known.contains(n.id)).toList();
      if (fresh.isEmpty) return;
      final n = fresh.first; // newest
      _messengerKey.currentState
        ?..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(n.title),
            duration: const Duration(milliseconds: 4500),
            action: SnackBarAction(
              label: 'Open',
              textColor: const Color(0xFFD2FF4D),
              // Tab pages are switched to; everything else opens on top.
              onPressed: () => Routes.tabs.contains(Uri.parse(n.link).path)
                  ? router.go(n.link)
                  : router.push(n.link),
            ),
          ),
        );
    });

    return MaterialApp.router(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      themeMode: ThemeMode.light,
      scaffoldMessengerKey: _messengerKey,
      routerConfig: router,
    );
  }
}
