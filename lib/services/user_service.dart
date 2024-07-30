import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:huynhcodaidaover2/models/user_token.dart';

part 'user_service.g.dart';

@RestApi(baseUrl: 'https://nova.huynhcodaidao.com/')
abstract class UserService {
  factory UserService(Dio dio, {String baseUrl}) = _UserService;

  @POST('/oauth/token')
  Future<UserToken> authenticate({
    @Field('grant_type') String grantType = 'password',
    @Field('client_id') int clientId = 2,
    @Field('client_secret')
    String clientSecret = 'zhxanQ6no1sP6NNYJtjhuGrDmgHbNpUxNKSisQbu',
    @Field('username')  required String username,
    @Field('password') required String password,
    @Field('scope') String scope = '',
  });
}
