import 'package:json_annotation/json_annotation.dart';

part 'photo_album_list_item.g.dart';

@JsonSerializable()
class PhotoAlbumListItem {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'slug')
  String slug;

  @JsonKey(name: 'cover_url')
  String coverUrl;

  @JsonKey(name: 'action_title')
  String actionTitle;

  @JsonKey(name: 'action_url')
  String actionUrl;

  @JsonKey(name: 'action_type_name')
  String actionTypeName;

  PhotoAlbumListItem({
    required this.id,
    required this.title,
    required this.slug,
    required this.coverUrl,
    required this.actionTitle,
    required this.actionUrl,
    required this.actionTypeName,
  });

  factory PhotoAlbumListItem.fromJson(Map<String, dynamic> json) =>
      _$PhotoAlbumListItemFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoAlbumListItemToJson(this);
}
