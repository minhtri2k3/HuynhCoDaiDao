import 'package:json_annotation/json_annotation.dart';

import 'package:huynhcodaidaover2/models/banner.dart';
import 'package:huynhcodaidaover2/models/audio_album_list.dart';

part 'audio_album_collection.g.dart';

@JsonSerializable()
class AudioAlbumCollection {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'slug')
  String slug;

  @JsonKey(name: 'default_icon_url')
  String defaultIconUrl;

  @JsonKey(name: 'banner')
  Banner banner;

  @JsonKey(name: 'audio_albums')
  AudioAlbumList audioAlbumList;

  AudioAlbumCollection({
    required this.id,
    required this.title,
    required this.slug,
    required this.defaultIconUrl,
    required this.banner,
    required this.audioAlbumList,
  });

  factory AudioAlbumCollection.fromJson(Map<String, dynamic> json) =>
      _$AudioAlbumCollectionFromJson(json);

  Map<String, dynamic> toJson() => _$AudioAlbumCollectionToJson(this);
}
