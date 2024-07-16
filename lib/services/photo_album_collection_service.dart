import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:huynhcodaidaover2/models/photo_album_collection.dart';

part 'photo_album_collection_service.g.dart';

@RestApi(baseUrl: 'https://nova.huynhcodaidao.com/')
abstract class PhotoAlbumCollectionService {
  factory PhotoAlbumCollectionService(Dio dio, {String baseUrl}) =
      _PhotoAlbumCollectionService;

  @GET('{path}')
  Future<PhotoAlbumCollection> get({
    @Path('path')  required String path,
    @Header('Authorization')  required String token,
    @Query("page") int? page,
  });
}
