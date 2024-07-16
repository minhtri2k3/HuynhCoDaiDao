// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_album_list_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AudioAlbumListItem _$AudioAlbumListItemFromJson(Map<String, dynamic> json) =>
    AudioAlbumListItem(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      slug: json['slug'] as String,
      coverUrl: json['cover_url'] as String,
      actionTitle: json['action_title'] as String,
      actionUrl: json['action_url'] as String,
      actionTypeName: json['action_type_name'] as String,
    );

Map<String, dynamic> _$AudioAlbumListItemToJson(AudioAlbumListItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'cover_url': instance.coverUrl,
      'action_title': instance.actionTitle,
      'action_url': instance.actionUrl,
      'action_type_name': instance.actionTypeName,
    };
