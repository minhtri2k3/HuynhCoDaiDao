import 'package:json_annotation/json_annotation.dart';

import 'package:huynhcodaidaover2/models/photo_album_page.dart';

part 'photo_album.g.dart';

@JsonSerializable()
class PhotoAlbum {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'slug')
  String slug;

  @JsonKey(name: 'photo_album_items')
  PhotoAlbumPage photoAlbumPage;

  PhotoAlbum({
    required this.id,
    required this.title,
    required this.slug,
    required this.photoAlbumPage,
  });

  factory PhotoAlbum.fromJson(Map<String, dynamic> json) =>
      _$PhotoAlbumFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoAlbumToJson(this);
}
