import 'dart:async';
import 'dart:io';

import 'package:hive/hive.dart';
import 'package:get_it/get_it.dart';
import 'package:bloc/bloc.dart';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';


import 'package:huynhcodaidaover2/blocs/audio_controller_event.dart';
import 'package:huynhcodaidaover2/blocs/audio_controller_state.dart';

import 'package:huynhcodaidaover2/models/user_token.dart';
import 'package:huynhcodaidaover2/models/audio_album.dart';
import 'package:huynhcodaidaover2/models/audio_album_item.dart';

final GetIt getIt = GetIt.instance;

class AudioControllerBloc
    extends Bloc<AudioControllerEvent, AudioControllerState> {
  final Box _appData = Hive.box('appData');
  final DefaultCacheManager _defaultCacheManager = DefaultCacheManager();


  AudioControllerBloc() : super(AudioControllerInitial());

  @override
  Stream<AudioControllerState> mapEventToState(
    AudioControllerEvent event,
  ) async* {
    if (event is AudioControllerHide) {
      yield AudioControllerHiding();
    }

    if (event is AudioControllerShow) {
      yield AudioControllerShowing();
    }

    if (event is AudioControllerPlay) {
      AudioAlbum audioAlbum = event.audioAlbum;
      AudioAlbumItem audioAlbumItem = event.audioAlbumItem;

      File audio = await _defaultCacheManager.getSingleFile(
        audioAlbumItem.audioUrl,
        headers: {
          'Authorization':
              'Bearer ' + (_appData.get('userToken') as UserToken).accessToken,
        },
      );
      File image = await _defaultCacheManager.getSingleFile(
        audioAlbumItem.iconUrl,
        headers: {
          'Authorization':
              'Bearer ' + (_appData.get('userToken') as UserToken).accessToken,
        },
      );



      yield AudioControllerPlaying(
        audioAlbum: audioAlbum,
        audioAlbumItem: audioAlbumItem,
      );
    }
  }
}
