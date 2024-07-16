import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:huynhcodaidaover2/models/photo_album.dart';

part 'photo_album_service.g.dart';

@RestApi(baseUrl: 'https://nova.huynhcodaidao.com/')
abstract class PhotoAlbumService {
  factory PhotoAlbumService(Dio dio, {String baseUrl}) = _PhotoAlbumService;

  @GET('{path}')
  Future<PhotoAlbum> get({
    @Path('path')  required String path,
    @Header('Authorization') required String token,
    @Query("page") int? page,
  });
}
