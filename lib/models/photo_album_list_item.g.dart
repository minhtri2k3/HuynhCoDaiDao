// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_album_list_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoAlbumListItem _$PhotoAlbumListItemFromJson(Map<String, dynamic> json) =>
    PhotoAlbumListItem(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      slug: json['slug'] as String,
      coverUrl: json['cover_url'] as String,
      actionTitle: json['action_title'] as String,
      actionUrl: json['action_url'] as String,
      actionTypeName: json['action_type_name'] as String,
    );

Map<String, dynamic> _$PhotoAlbumListItemToJson(PhotoAlbumListItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'cover_url': instance.coverUrl,
      'action_title': instance.actionTitle,
      'action_url': instance.actionUrl,
      'action_type_name': instance.actionTypeName,
    };
