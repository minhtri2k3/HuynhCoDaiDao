import 'package:json_annotation/json_annotation.dart';

part 'menu_item.g.dart';

@JsonSerializable()
class MenuItem {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'slug')
  String slug;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'primary_icon_url')
  String primaryIconUrl;

  @JsonKey(name: 'secondary_icon_url')
  String secondaryIconUrl;

  @JsonKey(name: 'label_url')
  String labelUrl;

  @JsonKey(name: 'action_title')
  String actionTitle;

  @JsonKey(name: 'action_url')
  String actionUrl;

  @JsonKey(name: 'action_type_name')
  String actionTypeName;

  MenuItem({
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.primaryIconUrl,
    required this.secondaryIconUrl,
    required this.labelUrl,
    required this.actionTitle,
    required this.actionUrl,
    required this.actionTypeName,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) =>
      _$MenuItemFromJson(json);

  Map<String, dynamic> toJson() => _$MenuItemToJson(this);
}
