import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/app_notification.dart';

part 'notification_dto.freezed.dart';
part 'notification_dto.g.dart';

@freezed
abstract class NotificationDto with _$NotificationDto {
  const NotificationDto._();

  const factory NotificationDto({
    required String id,
    required String title,
    String? body,
    @Default(false) bool urgent,
    String? actionLabel,
    required String link,
    required DateTime at,
    @Default(false) bool read,
  }) = _NotificationDto;

  factory NotificationDto.fromJson(Map<String, dynamic> json) =>
      _$NotificationDtoFromJson(json);

  factory NotificationDto.fromDomain(AppNotification n) => NotificationDto(
    id: n.id,
    title: n.title,
    body: n.body,
    urgent: n.urgent,
    actionLabel: n.actionLabel,
    link: n.link,
    at: n.at,
    read: n.read,
  );

  AppNotification toDomain() => AppNotification(
    id: id,
    title: title,
    body: body,
    urgent: urgent,
    actionLabel: actionLabel,
    link: link,
    at: at,
    read: read,
  );
}
