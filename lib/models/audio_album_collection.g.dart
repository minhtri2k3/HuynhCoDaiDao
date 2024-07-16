// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_album_collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AudioAlbumCollection _$AudioAlbumCollectionFromJson(
        Map<String, dynamic> json) =>
    AudioAlbumCollection(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      slug: json['slug'] as String,
      defaultIconUrl: json['default_icon_url'] as String,
      banner: Banner.fromJson(json['banner'] as Map<String, dynamic>),
      audioAlbumList:
          AudioAlbumList.fromJson(json['audio_albums'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AudioAlbumCollectionToJson(
        AudioAlbumCollection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'default_icon_url': instance.defaultIconUrl,
      'banner': instance.banner,
      'audio_albums': instance.audioAlbumList,
    };
