import 'package:get_it/get_it.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'package:huynhcodaidaover2/blocs/audio_controller_event.dart';
import 'package:huynhcodaidaover2/blocs/audio_controller_bloc.dart';

import 'package:huynhcodaidaover2/models/audio_album_item.dart';
import 'package:huynhcodaidaover2/models/audio_album_page.dart';
import 'package:huynhcodaidaover2/models/audio_album.dart';

import 'package:huynhcodaidaover2/widgets/network_image_widget.dart';
import 'package:huynhcodaidaover2/widgets/loading_widget.dart';

import 'package:huynhcodaidaover2/repositories/audio_album_repository.dart';

import 'package:huynhcodaidaover2/services/router_service.dart';

final GetIt getIt = GetIt.instance;

class AudioAlbumWidget extends StatefulWidget {
  final String actionUrl;

  const AudioAlbumWidget({
    required Key key,
    required this.actionUrl,
  }) : super(key: key);

  @override
  State createState() => _AudioAlbumWidgetState();
}

class _AudioAlbumWidgetState extends State<AudioAlbumWidget> {
  final AudioAlbumRepository _audioAlbumRepository =
      getIt.get<AudioAlbumRepository>();


  dynamic _state;
  late Future<AudioAlbum> _audioAlbumFuture;
  late AudioAlbum _audioAlbum;
  late AudioAlbumPage _audioAlbumPage;
  late List<AudioAlbumItem> _audioAlbumItems;
  int _page = 1;
  bool _shouldLoad = false;

  void playAudio(
    BuildContext context, {
    required AudioAlbum audioAlbum,
    required AudioAlbumItem audioAlbumItem,
  }) {
    // ignore: close_sinks
    AudioControllerBloc audioControllerBloc =
        BlocProvider.of<AudioControllerBloc>(context);

    audioControllerBloc.add(
      AudioControllerPlay(
        audioAlbum: audioAlbum,
        audioAlbumItem: audioAlbumItem,
      ),
    );
  }

  @override
  void initState() {
    _audioAlbumFuture = _audioAlbumRepository.get(
      path: widget.actionUrl,
    );

    super.initState();
  }

  @override
  void dispose() {


    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _audioAlbumFuture,
      builder: (BuildContext context, AsyncSnapshot<AudioAlbum> snapshot) {
        return Scaffold(
           body: Container(
             child: Text('Audio album widget'),
           ),
        );
        if (!snapshot.hasData) {
          return Center(
            child: SpinKitFadingCircle(
              size: 120,
              color: Colors.amber,
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {


          if (_state is LockState) {
            AudioAlbum? _nextAudioAlbum = snapshot.data;
            AudioAlbumPage? _nextAudioAlbumPage = _nextAudioAlbum?.audioAlbumPage;
            List<AudioAlbumItem>? _nextAudioAlbumItems =
                _nextAudioAlbumPage?.data;

            if (_nextAudioAlbumItems?.length != 0) {
              _audioAlbumPage.to = _nextAudioAlbumPage!.to;
              _audioAlbumItems.addAll(_nextAudioAlbumItems as Iterable<AudioAlbumItem>);
            }

            _page++;
            _shouldLoad = _nextAudioAlbumPage?.nextPageUrl != null;

          }
        }


      },
    );
  }
}
