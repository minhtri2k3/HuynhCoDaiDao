// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'testing_menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TestingMenu _$TestingMenuFromJson(Map<String, dynamic> json) => TestingMenu(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      slug: json['slug'] as String,
      default_icon_url: json['default_icon_url'] as String?,
    );

Map<String, dynamic> _$TestingMenuToJson(TestingMenu instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'default_icon_url': instance.default_icon_url,
    };
