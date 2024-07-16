import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:huynhcodaidaover2/modules/message/message_category.dart';

part 'message_category_service.g.dart';

@RestApi(baseUrl: 'https://nova.huynhcodaidaover2.com/')
abstract class MessageCategoryService {
  factory MessageCategoryService(Dio dio, {String baseUrl}) = _MessageCategoryService;

  @GET('{path}')
  Future<MessageCategory> get({
    @Path('path')  required String path,
    @Header('Authorization') required String token,
    @Query("page") int? page,
  });
}
