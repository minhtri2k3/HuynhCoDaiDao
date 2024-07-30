import 'package:json_annotation/json_annotation.dart';

import 'package:huynhcodaidaover2/models/banner.dart';
import 'package:huynhcodaidaover2/models/menu_item_list.dart';

part 'testing_menu.g.dart';

@JsonSerializable()
class TestingMenu {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'slug')
  String slug;

  @JsonKey(name: 'default_icon_url')
  String? default_icon_url;
  TestingMenu({
    required this.id,
    required this.title,
    required this.slug,
    this.default_icon_url
  });

  factory TestingMenu.fromJson(Map<String, dynamic> json) => _$TestingMenuFromJson(json);

  Map<String, dynamic> toJson() => _$TestingMenuToJson(this);
}
