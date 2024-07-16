import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:hive/hive.dart';

import 'package:huynhcodaidaover2/models/user_token.dart';
import 'package:huynhcodaidaover2/models/audio_album.dart';

import 'package:huynhcodaidaover2/services/audio_album_service.dart';

final GetIt getIt = GetIt.instance;

class AudioAlbumRepository {
  final Box _appData = Hive.box('appData');
  final AudioAlbumService _audioAlbumService = getIt.get<AudioAlbumService>();

  Future<AudioAlbum> get({
    required String path,
    int page = 1,
  }) async {
    UserToken userToken = _appData.get('userToken');

    return _audioAlbumService.get(
      path: path,
      token: 'Bearer ' + userToken.accessToken,
      page: page,
    );
  }
}
