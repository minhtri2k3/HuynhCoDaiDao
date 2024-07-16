import 'package:json_annotation/json_annotation.dart';

import 'package:huynhcodaidaover2/models/banner.dart';
import 'package:huynhcodaidaover2/modules/message/message_list.dart';
import 'package:huynhcodaidaover2/modules/message/message_style.dart';

part 'message_category.g.dart';

@JsonSerializable()
class MessageCategory {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'slug')
  String slug;

  @JsonKey(name: 'banner')
  Banner banner;

  @JsonKey(name: 'messages')
  MessageList messages;

  @JsonKey(name: 'default_style')
  MessageStyle defaultStyle;

  MessageCategory({
    required this.id,
    required this.title,
    required this.slug,
    required this.banner,
    required this.messages,
    required this.defaultStyle,
  });

  factory MessageCategory.fromJson(Map<String, dynamic> json) =>
      _$MessageCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$MessageCategoryToJson(this);
}
