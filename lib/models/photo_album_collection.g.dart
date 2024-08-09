// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_album_collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoAlbumCollection _$PhotoAlbumCollectionFromJson(
        Map<String, dynamic> json) =>
    PhotoAlbumCollection(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String?,
      slug: json['slug'] as String?,
      defaultIconUrl: json['default_icon_url'] as String?,
      banner: json['banner'] == null
          ? null
          : Banner.fromJson(json['banner'] as Map<String, dynamic>),
      photoAlbumList: json['photo_albums'] == null
          ? null
          : PhotoAlbumList.fromJson(
              json['photo_albums'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PhotoAlbumCollectionToJson(
        PhotoAlbumCollection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'default_icon_url': instance.defaultIconUrl,
      'banner': instance.banner,
      'photo_albums': instance.photoAlbumList,
    };
