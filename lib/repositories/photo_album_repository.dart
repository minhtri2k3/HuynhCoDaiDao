import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:hive/hive.dart';

import 'package:huynhcodaidaover2/models/user_token.dart';
import 'package:huynhcodaidaover2/models/photo_album.dart';

import 'package:huynhcodaidaover2/services/photo_album_service.dart';

final GetIt getIt = GetIt.instance;

class PhotoAlbumRepository {
  final Box _appData = Hive.box('appData');
  final PhotoAlbumService _photoAlbumService = getIt.get<PhotoAlbumService>();

  Future<PhotoAlbum> get({
    required String path,
    int page = 1,
  }) async {
    UserToken userToken = _appData.get('userToken');

    return _photoAlbumService.get(
      path: path,
      token: 'Bearer ' + userToken.accessToken,
      page: page,
    );
  }
}
