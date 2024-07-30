import 'package:equatable/equatable.dart';

import '../models/audio_album.dart';
import '../models/audio_album_item.dart';

abstract class AudioControllerEvent extends Equatable {
  const AudioControllerEvent();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'Event: ${this.runtimeType.toString()}';
}

class AudioControllerHide extends AudioControllerEvent {}

class AudioControllerShow extends AudioControllerEvent {}

class AudioControllerPlay extends AudioControllerEvent {
  final AudioAlbum audioAlbum;
  final AudioAlbumItem audioAlbumItem;

  const AudioControllerPlay({
    required this.audioAlbum,
    required this.audioAlbumItem,
  });

  @override
  List<Object> get props => [
        audioAlbum,
        audioAlbumItem,
      ];
}
