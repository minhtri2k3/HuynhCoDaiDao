// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_style.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageStyle _$MessageStyleFromJson(Map<String, dynamic> json) => MessageStyle(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      slug: json['slug'] as String?,
      listBackgroundColor: json['list_background_color'] as String?,
      listSeparatorColor: json['list_separator_color'] as String?,
      containerBackgroundColor: json['container_background_color'] as String?,
      containerBorderColor: json['container_border_color'] as String?,
      badgeBackgroundColor: json['badge_background_color'] as String?,
      badgeTextColor: json['badge_text_color'] as String?,
      dateTextColor: json['date_text_color'] as String?,
      titleTextColor: json['title_text_color'] as String?,
      contentTextColor: json['content_text_color'] as String?,
      summaryTextColor: json['summary_text_color'] as String?,
      primaryIconUrl: json['primary_icon_url'] as String?,
      secondaryIconUrl: json['secondary_icon_url'] as String?,
      readMoreIconUrl: json['read_more_icon_url'] as String?,
    );

Map<String, dynamic> _$MessageStyleToJson(MessageStyle instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'list_background_color': instance.listBackgroundColor,
      'list_separator_color': instance.listSeparatorColor,
      'container_background_color': instance.containerBackgroundColor,
      'container_border_color': instance.containerBorderColor,
      'badge_background_color': instance.badgeBackgroundColor,
      'badge_text_color': instance.badgeTextColor,
      'date_text_color': instance.dateTextColor,
      'title_text_color': instance.titleTextColor,
      'content_text_color': instance.contentTextColor,
      'summary_text_color': instance.summaryTextColor,
      'primary_icon_url': instance.primaryIconUrl,
      'secondary_icon_url': instance.secondaryIconUrl,
      'read_more_icon_url': instance.readMoreIconUrl,
    };
