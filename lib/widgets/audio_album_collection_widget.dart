import 'package:get_it/get_it.dart';

import 'package:flutter/material.dart';
// import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:frefresh/frefresh.dart';

import 'package:huynhcodaidaover2/models/audio_album_list_item.dart';
import 'package:huynhcodaidaover2/models/audio_album_list.dart';
import 'package:huynhcodaidaover2/models/audio_album_collection.dart';
import 'package:huynhcodaidaover2/models/banner.dart' as BannerModel;

import 'package:huynhcodaidaover2/widgets/network_image_widget.dart';
import 'package:huynhcodaidaover2/widgets/banner_widget.dart';
import 'package:huynhcodaidaover2/widgets/loading_widget.dart';

import 'package:huynhcodaidaover2/repositories/audio_album_collection_repository.dart';

import 'package:huynhcodaidaover2/services/router_service.dart';

final GetIt getIt = GetIt.instance;

class AudioAlbumCollectionWidget extends StatefulWidget {
  final String actionUrl;

  const AudioAlbumCollectionWidget({
    required Key key,
    required this.actionUrl,
  }) : super(key: key);

  @override
  State createState() => _AudioAlbumCollectionWidgetState();
}

class _AudioAlbumCollectionWidgetState
    extends State<AudioAlbumCollectionWidget> {
  final AudioAlbumCollectionRepository _audioAlbumCollectionRepository =
      getIt.get<AudioAlbumCollectionRepository>();


  dynamic _state;
  late Future<AudioAlbumCollection> _audioAlbumCollectionFuture;
  late AudioAlbumCollection _audioAlbumCollection;
  late AudioAlbumList _audioAlbumList;
  late List<AudioAlbumListItem> _audioAlbumListItems;
  late BannerModel.Banner _banner;
  int _page = 1;
  bool _shouldLoad = false;

  @override
  void initState() {


    _audioAlbumCollectionFuture = _audioAlbumCollectionRepository.get(
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
    return FutureBuilder<AudioAlbumCollection>(
      future: _audioAlbumCollectionFuture,
      builder: (BuildContext context, AsyncSnapshot<AudioAlbumCollection> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: SpinKitFadingCircle(
              size: 120,
              color: Colors.amber,
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (!snapshot.hasData) {
          return Center(
            child: Text('No data available'),
          );
        } else {
          _audioAlbumCollection = snapshot.data!;
          _audioAlbumList = _audioAlbumCollection.audioAlbumList;
          _banner = _audioAlbumCollection.banner;
          return ListView.builder(
            itemCount: _audioAlbumListItems.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_audioAlbumListItems[index].title),

              );
            },
          );
        }
      },
    );
  }

}
