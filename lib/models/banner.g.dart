// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Banner _$BannerFromJson(Map<String, dynamic> json) => Banner(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String?,
      slug: json['slug'] as String?,
      url: json['url'] as String?,
      width: (json['width'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
      actionTitle: json['action_title'] as String?,
      actionUrl: json['action_url'] as String?,
      actionTypeName: json['action_type_name'] as String?,
    );

Map<String, dynamic> _$BannerToJson(Banner instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
      'action_title': instance.actionTitle,
      'action_url': instance.actionUrl,
      'action_type_name': instance.actionTypeName,
    };
