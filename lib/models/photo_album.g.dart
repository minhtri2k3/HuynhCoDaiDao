// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_album.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoAlbum _$PhotoAlbumFromJson(Map<String, dynamic> json) => PhotoAlbum(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      slug: json['slug'] as String,
      photoAlbumPage: PhotoAlbumPage.fromJson(
          json['photo_album_items'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PhotoAlbumToJson(PhotoAlbum instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'photo_album_items': instance.photoAlbumPage,
    };
