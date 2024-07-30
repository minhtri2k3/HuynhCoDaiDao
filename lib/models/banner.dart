import 'package:json_annotation/json_annotation.dart';

part 'banner.g.dart';

@JsonSerializable()
class Banner {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'slug')
  String? slug;

  @JsonKey(name: 'url')
  String? url;

  @JsonKey(name: 'width')
  double width;

  @JsonKey(name: 'height')
  double height;

  @JsonKey(name: 'action_title')
  String? actionTitle;

  @JsonKey(name: 'action_url')
  String? actionUrl;

  @JsonKey(name: 'action_type_name')
  String? actionTypeName;

  Banner({
    required this.id,
    this.title,
    this.slug,
    this.url,
    required this.width,
    required this.height,
    this.actionTitle,
    this.actionUrl,
    this.actionTypeName,
  });

  factory Banner.fromJson(Map<String, dynamic> json) => _$BannerFromJson(json);

  Map<String, dynamic> toJson() => _$BannerToJson(this);
}
