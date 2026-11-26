import '../app_notification.dart';
import '../notification_repository.dart';

class WatchNotifications {
  const WatchNotifications(this._notifications);
  final NotificationRepository _notifications;
  Stream<List<AppNotification>> call() => _notifications.watch();
}

class MarkNotificationRead {
  const MarkNotificationRead(this._notifications);
  final NotificationRepository _notifications;
  Future<void> call(String id) => _notifications.markRead(id);
}

class MarkAllNotificationsRead {
  const MarkAllNotificationsRead(this._notifications);
  final NotificationRepository _notifications;
  Future<void> call() => _notifications.markAllRead();
}
