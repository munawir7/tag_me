import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_notification.freezed.dart';

@freezed
abstract class AppNotification with _$AppNotification {
  const factory AppNotification({
    required String id,
    required String title,
    String? body,

    /// "Needs you": the creator has to act.
    @Default(false) bool urgent,

    /// Button text for urgent items, e.g. "Confirm address".
    String? actionLabel,

    /// In-app route to open, e.g. "/deals/d-glowhaus".
    required String link,
    required DateTime at,
    @Default(false) bool read,
  }) = _AppNotification;
}
