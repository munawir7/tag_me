import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/app_notification.dart';
import '../domain/notification_groups.dart';
import '../domain/notification_repository.dart';
import '../domain/usecases/notification_usecases.dart';

/// Port: provided by the app's composition root (see app/providers.dart).
final notificationRepositoryProvider = Provider<NotificationRepository>(
  (ref) =>
      throw UnimplementedError('notificationRepositoryProvider not provided'),
);

final markNotificationReadProvider = Provider(
  (ref) => MarkNotificationRead(ref.watch(notificationRepositoryProvider)),
);

final notificationsProvider = StreamProvider<List<AppNotification>>(
  (ref) => WatchNotifications(ref.watch(notificationRepositoryProvider))(),
);

/// Count for the bell badge.
final unreadCountProvider = Provider<int>(
  (ref) => (ref.watch(notificationsProvider).value ?? const [])
      .where((n) => !n.read)
      .length,
);

final markAllNotificationsReadProvider = Provider(
  (ref) => MarkAllNotificationsRead(ref.watch(notificationRepositoryProvider)),
);

/// "Needs you" and "Earlier", for the notifications screen.
final notificationGroupsProvider = Provider<AsyncValue<NotificationGroups>>(
  (ref) => ref.watch(notificationsProvider).whenData(NotificationGroups.of),
);
