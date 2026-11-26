// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationDto _$NotificationDtoFromJson(Map<String, dynamic> json) =>
    _NotificationDto(
      id: json['id'] as String,
      title: json['title'] as String,
      body: json['body'] as String?,
      urgent: json['urgent'] as bool? ?? false,
      actionLabel: json['action_label'] as String?,
      link: json['link'] as String,
      at: DateTime.parse(json['at'] as String),
      read: json['read'] as bool? ?? false,
    );

Map<String, dynamic> _$NotificationDtoToJson(_NotificationDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': ?instance.body,
      'urgent': instance.urgent,
      'action_label': ?instance.actionLabel,
      'link': instance.link,
      'at': instance.at.toIso8601String(),
      'read': instance.read,
    };
