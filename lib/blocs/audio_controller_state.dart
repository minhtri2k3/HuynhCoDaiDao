import 'package:equatable/equatable.dart';

import '../models/audio_album.dart';
import '../models/audio_album_item.dart';

abstract class AudioControllerState extends Equatable {
  const AudioControllerState();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'State: ${this.runtimeType.toString()}';
}

class AudioControllerInitial extends AudioControllerState {}

class AudioControllerHiding extends AudioControllerState {}

class AudioControllerShowing extends AudioControllerState {}

class AudioControllerPlaying extends AudioControllerState {
  final AudioAlbum audioAlbum;
  final AudioAlbumItem audioAlbumItem;

  const AudioControllerPlaying({
    required this.audioAlbum,
    required this.audioAlbumItem,
  });

  @override
  List<Object> get props => [
        audioAlbum,
        audioAlbumItem,
      ];
}
