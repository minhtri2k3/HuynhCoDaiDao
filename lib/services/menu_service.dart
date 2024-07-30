import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/menu.dart';
import '../models/testing_menu.dart';

part 'menu_service.g.dart';

@RestApi(baseUrl: 'https://nova.huynhcodaidao.com/')
abstract class MenuService {
  factory MenuService(Dio dio, {String baseUrl}) = _MenuService;

  @GET('{path}')
  Future<Menu> get({
     @Path('path')  required String path,
    @Header('Authorization') required String token,
    @Query('page') int? page,
  });


}
