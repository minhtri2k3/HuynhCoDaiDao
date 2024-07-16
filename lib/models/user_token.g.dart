// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_token.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserTokenAdapter extends TypeAdapter<UserToken> {
  @override
  final int typeId = 0;

  @override
  UserToken read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserToken(
      tokenType: fields[0] as String,
      expiresIn: fields[1] as int,
      accessToken: fields[2] as String,
      refreshToken: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserToken obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.tokenType)
      ..writeByte(1)
      ..write(obj.expiresIn)
      ..writeByte(2)
      ..write(obj.accessToken)
      ..writeByte(3)
      ..write(obj.refreshToken);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserTokenAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserToken _$UserTokenFromJson(Map<String, dynamic> json) => UserToken(
      tokenType: json['token_type'] as String,
      expiresIn: (json['expires_in'] as num).toInt(),
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
    );

Map<String, dynamic> _$UserTokenToJson(UserToken instance) => <String, dynamic>{
      'token_type': instance.tokenType,
      'expires_in': instance.expiresIn,
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
    };
