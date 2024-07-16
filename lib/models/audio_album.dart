import 'package:json_annotation/json_annotation.dart';

import 'package:huynhcodaidaover2/models/audio_album_page.dart';

part 'audio_album.g.dart';

@JsonSerializable()
class AudioAlbum {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'slug')
  String slug;

  @JsonKey(name: 'default_icon_url')
  String defaultIconUrl;

  @JsonKey(name: 'audio_album_items')
  AudioAlbumPage audioAlbumPage;

  AudioAlbum({
    required this.id,
    required this.title,
    required this.slug,
    required this.defaultIconUrl,
    required this.audioAlbumPage,
  });

  factory AudioAlbum.fromJson(Map<String, dynamic> json) =>
      _$AudioAlbumFromJson(json);

  Map<String, dynamic> toJson() => _$AudioAlbumToJson(this);
}
