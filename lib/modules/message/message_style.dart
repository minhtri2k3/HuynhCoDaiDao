import 'package:json_annotation/json_annotation.dart';

part 'message_style.g.dart';

@JsonSerializable()
class MessageStyle {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'slug')
  String? slug;

  @JsonKey(name: 'list_background_color')
  String? listBackgroundColor;

  @JsonKey(name: 'list_separator_color')
  String? listSeparatorColor;

  @JsonKey(name: 'container_background_color')
  String? containerBackgroundColor;

  @JsonKey(name: 'container_border_color')
  String? containerBorderColor;

  @JsonKey(name: 'badge_background_color')
  String? badgeBackgroundColor;

  @JsonKey(name: 'badge_text_color')
  String? badgeTextColor;

  @JsonKey(name: 'date_text_color')
  String? dateTextColor;

  @JsonKey(name: 'title_text_color')
  String? titleTextColor;

  @JsonKey(name: 'content_text_color')
  String? contentTextColor;

  @JsonKey(name: 'summary_text_color')
  String? summaryTextColor;

  @JsonKey(name: 'primary_icon_url')
  String? primaryIconUrl;

  @JsonKey(name: 'secondary_icon_url')
  String? secondaryIconUrl;

  @JsonKey(name: 'read_more_icon_url')
  String? readMoreIconUrl;

  MessageStyle({
    required this.id,
    required this.title,
    required this.slug,
    required this.listBackgroundColor,
    required this.listSeparatorColor,
    required this.containerBackgroundColor,
    required this.containerBorderColor,
    required this.badgeBackgroundColor,
    required this.badgeTextColor,
    required this.dateTextColor,
    required this.titleTextColor,
    required this.contentTextColor,
    required this.summaryTextColor,
    required this.primaryIconUrl,
    required this.secondaryIconUrl,
    required this.readMoreIconUrl,
  });

  factory MessageStyle.fromJson(Map<String, dynamic> json) =>
      _$MessageStyleFromJson(json);

  Map<String, dynamic> toJson() => _$MessageStyleToJson(this);
}
