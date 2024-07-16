import 'package:json_annotation/json_annotation.dart';

part 'photo_album_item.g.dart';

@JsonSerializable()
class PhotoAlbumItem {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'photo_url')
  String photoUrl;

  PhotoAlbumItem({
    required this.id,
    required this.photoUrl,
  });

  factory PhotoAlbumItem.fromJson(Map<String, dynamic> json) =>
      _$PhotoAlbumItemFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoAlbumItemToJson(this);
}
