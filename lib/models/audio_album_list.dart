import 'package:json_annotation/json_annotation.dart';

import 'package:huynhcodaidaover2/models/audio_album_list_item.dart';

part 'audio_album_list.g.dart';

@JsonSerializable()
class AudioAlbumList {
  @JsonKey(name: 'current_page')
  int currentPage;

  @JsonKey(name: 'last_page')
  int lastPage;

  @JsonKey(name: 'per_page')
  int perPage;

  @JsonKey(name: 'total')
  int total;

  @JsonKey(name: 'from')
  int from;

  @JsonKey(name: 'to')
  int to;

  @JsonKey(name: 'path')
  String path;

  @JsonKey(name: 'first_page_url')
  String firstPageUrl;

  @JsonKey(name: 'last_page_url')
  String lastPageUrl;

  @JsonKey(name: 'prev_page_url')
  String prevPageUrl;

  @JsonKey(name: 'next_page_url')
  String nextPageUrl;

  @JsonKey(name: 'data')
  List<AudioAlbumListItem> data;

  AudioAlbumList({
    required this.currentPage,
    required this.lastPage,
    required this.perPage,
    required this.total,
    required this.from,
    required this.to,
    required this.path,
    required this.firstPageUrl,
    required this.lastPageUrl,
    required this.prevPageUrl,
    required this.nextPageUrl,
    required this.data,
  });

  factory AudioAlbumList.fromJson(Map<String, dynamic> json) =>
      _$AudioAlbumListFromJson(json);

  Map<String, dynamic> toJson() => _$AudioAlbumListToJson(this);
}
