import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/audio_album_collection.dart';

part 'audio_album_collection_service.g.dart';

@RestApi(baseUrl: 'https://nova.huynhcodaidao.com/')
abstract class AudioAlbumCollectionService {
  factory AudioAlbumCollectionService(Dio dio, {String baseUrl}) =
      _AudioAlbumCollectionService;

  @GET('{path}')
  Future<AudioAlbumCollection> get({
    @Path('path')  required String path,
    @Header('Authorization')  required String token,
    @Query("page") int? page,
  });
}
