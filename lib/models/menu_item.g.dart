// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuItem _$MenuItemFromJson(Map<String, dynamic> json) => MenuItem(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String?,
      slug: json['slug'] as String?,
      description: json['description'] as String?,
      primaryIconUrl: json['primary_icon_url'] as String?,
      secondaryIconUrl: json['secondary_icon_url'] as String?,
      labelUrl: json['label_url'] as String?,
      actionTitle: json['action_title'] as String?,
      actionUrl: json['action_url'] as String?,
      actionTypeName: json['action_type_name'] as String?,
    );

Map<String, dynamic> _$MenuItemToJson(MenuItem instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'description': instance.description,
      'primary_icon_url': instance.primaryIconUrl,
      'secondary_icon_url': instance.secondaryIconUrl,
      'label_url': instance.labelUrl,
      'action_title': instance.actionTitle,
      'action_url': instance.actionUrl,
      'action_type_name': instance.actionTypeName,
    };
