// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_album_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AudioAlbumItem _$AudioAlbumItemFromJson(Map<String, dynamic> json) =>
    AudioAlbumItem(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      artist: json['artist'] as String,
      description: json['description'] as String,
      iconUrl: json['icon_url'] as String,
      audioUrl: json['audio_url'] as String,
      actionTitle: json['action_title'] as String,
      actionUrl: json['action_url'] as String,
      actionTypeName: json['action_type_name'] as String,
    );

Map<String, dynamic> _$AudioAlbumItemToJson(AudioAlbumItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'artist': instance.artist,
      'description': instance.description,
      'icon_url': instance.iconUrl,
      'audio_url': instance.audioUrl,
      'action_title': instance.actionTitle,
      'action_url': instance.actionUrl,
      'action_type_name': instance.actionTypeName,
    };
