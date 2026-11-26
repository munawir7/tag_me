import '../../../core/mock/live_value.dart';
import '../domain/app_notification.dart';
import '../domain/notification_repository.dart';

class MockNotificationRepository implements NotificationRepository {
  MockNotificationRepository(List<AppNotification> initial, {required this.now})
    : _items = LiveValue(initial);

  final DateTime Function() now;
  final LiveValue<List<AppNotification>> _items;
  var _seq = 0;

  List<AppNotification> get current => _items.value;

  @override
  Stream<List<AppNotification>> watch() => _items.stream;

  @override
  Future<void> markRead(String id) async {
    _items.value = [
      for (final n in _items.value) n.id == id ? n.copyWith(read: true) : n,
    ];
  }

  @override
  Future<void> markAllRead() async {
    _items.value = [for (final n in _items.value) n.copyWith(read: true)];
  }

  /// Server side: deliver a new notification (also "sent on WhatsApp").
  AppNotification push({
    required String title,
    required String link,
    String? body,
    bool urgent = false,
    String? actionLabel,
  }) {
    final n = AppNotification(
      id: 'n-live-${++_seq}',
      title: title,
      body: body,
      link: link,
      urgent: urgent,
      actionLabel: actionLabel,
      at: now(),
    );
    _items.value = [n, ..._items.value];
    return n;
  }

  Future<void> dispose() => _items.close();
}
