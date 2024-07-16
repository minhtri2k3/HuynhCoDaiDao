import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_token.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class UserToken {
  @HiveField(0)
  @JsonKey(name: 'token_type')
  String tokenType;

  @HiveField(1)
  @JsonKey(name: 'expires_in')
  int expiresIn;

  @HiveField(2)
  @JsonKey(name: 'access_token')
  String accessToken;

  @HiveField(3)
  @JsonKey(name: 'refresh_token')
  String refreshToken;

  UserToken({
    required this.tokenType,
    required this.expiresIn,
    required this.accessToken,
    required this.refreshToken,
  });

  factory UserToken.fromJson(Map<String, dynamic> json) =>
      _$UserTokenFromJson(json);

  Map<String, dynamic> toJson() => _$UserTokenToJson(this);
}
