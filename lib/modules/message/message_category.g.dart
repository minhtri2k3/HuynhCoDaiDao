// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageCategory _$MessageCategoryFromJson(Map<String, dynamic> json) =>
    MessageCategory(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      slug: json['slug'] as String,
      banner: Banner.fromJson(json['banner'] as Map<String, dynamic>),
      messages: MessageList.fromJson(json['messages'] as Map<String, dynamic>),
      defaultStyle:
          MessageStyle.fromJson(json['default_style'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MessageCategoryToJson(MessageCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'banner': instance.banner,
      'messages': instance.messages,
      'default_style': instance.defaultStyle,
    };
