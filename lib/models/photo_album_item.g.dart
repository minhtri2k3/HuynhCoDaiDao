// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_album_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoAlbumItem _$PhotoAlbumItemFromJson(Map<String, dynamic> json) =>
    PhotoAlbumItem(
      id: (json['id'] as num).toInt(),
      photoUrl: json['photo_url'] as String,
    );

Map<String, dynamic> _$PhotoAlbumItemToJson(PhotoAlbumItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'photo_url': instance.photoUrl,
    };
