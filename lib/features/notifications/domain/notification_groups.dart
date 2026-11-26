import 'app_notification.dart';

/// How the notifications screen is split.
class NotificationGroups {
  const NotificationGroups({required this.needsYou, required this.earlier});

  /// Splits [all] (newest first): unread urgent ones "need you"; the rest
  /// are "earlier". Order is kept within each group.
  factory NotificationGroups.of(List<AppNotification> all) =>
      NotificationGroups(
        needsYou: [
          for (final n in all)
            if (n.urgent && !n.read) n,
        ],
        earlier: [
          for (final n in all)
            if (!n.urgent || n.read) n,
        ],
      );

  final List<AppNotification> needsYou;
  final List<AppNotification> earlier;

  bool get isEmpty => needsYou.isEmpty && earlier.isEmpty;
}
