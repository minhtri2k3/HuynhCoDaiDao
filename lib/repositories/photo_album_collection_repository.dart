import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

import '../models/photo_album_collection.dart';
import '../models/user_token.dart';
import '../services/photo_album_collection_service.dart';

final GetIt getIt = GetIt.instance;

class PhotoAlbumCollectionRepository {
  final Box _appData = Hive.box('appData');
  final PhotoAlbumCollectionService _photoAlbumCollectionService =
      getIt.get<PhotoAlbumCollectionService>();

  Future<PhotoAlbumCollection> get({
    required String path,
    int page = 1,
  }) async {
    UserToken userToken = _appData.get('userToken');

    return _photoAlbumCollectionService.get(
      path: path,
      token: 'Bearer ' + userToken.accessToken,
      page: page,
    );
  }
}
