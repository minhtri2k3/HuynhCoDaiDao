import 'package:json_annotation/json_annotation.dart';

part 'label.g.dart';

@JsonSerializable()
class Label {
  @JsonKey(name: 'data')
  dynamic data;

  Label({
    required this.data,
  });

  factory Label.fromJson(Map<String, dynamic> json) => _$LabelFromJson(json);

  Map<String, dynamic> toJson() => _$LabelToJson(this);
}
