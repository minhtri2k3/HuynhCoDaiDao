import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

import '../models/audio_album.dart';
import '../models/audio_album_item.dart';
import '../models/user_token.dart';
import "audio_controller_event.dart";
import 'audio_controller_state.dart';

final GetIt getIt = GetIt.instance;

class AudioControllerBloc
    extends Bloc<AudioControllerEvent, AudioControllerState> {
  final Box _appData = Hive.box('appData');
  final DefaultCacheManager _defaultCacheManager = DefaultCacheManager();

  AudioControllerBloc() : super(AudioControllerInitial()) {
    on<AudioControllerHide>(_AudioControllerHide);
    on<AudioControllerShow>(_AudioControllerShow);
    on<AudioControllerPlay>(_AudioControllerPlay);
  }
  Future<void> _AudioControllerHide(
  AudioControllerEvent event,
    Emitter<AudioControllerState> emit,
  ) async {
    emit(AudioControllerHiding());
  }
  Future < void > _AudioControllerShow(
  AudioControllerEvent event,
      Emitter < AudioControllerState > emit,
      )async{
    emit(AudioControllerShowing());
  }
  Future < void > _AudioControllerPlay(
      AudioControllerPlay event,
  Emitter < AudioControllerState > emit,) async{
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
  }



}
