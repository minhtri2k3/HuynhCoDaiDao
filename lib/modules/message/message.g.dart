// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      slug: json['slug'] as String,
      imageUrl: json['image_url'] as String,
      badge: json['badge'] as String,
      date: json['date'] as String,
      contentType: json['content_type'] as String,
      content: json['content'] as String,
      summary: json['summary'] as String,
      note: json['note'] as String,
      customStyle:
          MessageStyle.fromJson(json['custom_style'] as Map<String, dynamic>),
      actionTitle: json['action_title'] as String,
      actionUrl: json['action_url'] as String,
      actionTypeName: json['action_type_name'] as String,
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'image_url': instance.imageUrl,
      'badge': instance.badge,
      'date': instance.date,
      'content_type': instance.contentType,
      'content': instance.content,
      'summary': instance.summary,
      'note': instance.note,
      'custom_style': instance.customStyle,
      'action_title': instance.actionTitle,
      'action_url': instance.actionUrl,
      'action_type_name': instance.actionTypeName,
    };
