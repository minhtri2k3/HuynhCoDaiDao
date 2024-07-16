import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:huynhcodaidaover2/models/audio_album.dart';

part 'audio_album_service.g.dart';

@RestApi(baseUrl: 'https://nova.huynhcodaidao.com/')
abstract class AudioAlbumService {
  factory AudioAlbumService(Dio dio, {String baseUrl}) = _AudioAlbumService;

  @GET('{path}')
  Future<AudioAlbum> get({
    @Path('path') required String path,
    @Header('Authorization')  required String token,
    @Query("page") int? page,
  });
}
