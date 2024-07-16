import 'package:json_annotation/json_annotation.dart';

import 'package:huynhcodaidaover2/models/photo_album_list_item.dart';

part 'photo_album_list.g.dart';

@JsonSerializable()
class PhotoAlbumList {
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
  List<PhotoAlbumListItem> data;

  PhotoAlbumList({
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

  factory PhotoAlbumList.fromJson(Map<String, dynamic> json) =>
      _$PhotoAlbumListFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoAlbumListToJson(this);
}
