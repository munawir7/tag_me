import 'app_notification.dart';

abstract interface class NotificationRepository {
  /// Newest first.
  Stream<List<AppNotification>> watch();
  Future<void> markRead(String id);
  Future<void> markAllRead();
}
