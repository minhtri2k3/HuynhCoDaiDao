import 'package:json_annotation/json_annotation.dart';

import 'package:huynhcodaidaover2/models/banner.dart';
import 'package:huynhcodaidaover2/models/menu_item_list.dart';

part 'menu.g.dart';

@JsonSerializable()
class Menu {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'slug')
  String? slug;

  @JsonKey(name: 'default_icon_url')
  String? defaultIconUrl;

  @JsonKey(name: 'bell_url')
  String? bellUrl;

  @JsonKey(name: 'hot_album_url')
  String ?hotAlbumUrl;
  @JsonKey(name: 'banner')
  Banner? banner;

  @JsonKey(name: 'menu_items')
  MenuItemList? menuItemList;

  Menu({
    required this.id,
    this.title,
    this.slug,
    this.defaultIconUrl,
    this.bellUrl,
    this.hotAlbumUrl,
    this.banner,
    this.menuItemList,
  });

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);

  Map<String, dynamic> toJson() => _$MenuToJson(this);
}
