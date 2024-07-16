import 'package:get_it/get_it.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:huynhcodaidaover2/models/photo_album_list_item.dart';
import 'package:huynhcodaidaover2/models/photo_album_list.dart';
import 'package:huynhcodaidaover2/models/photo_album_collection.dart';
import 'package:huynhcodaidaover2/models/banner.dart' as BannerModel;

import 'package:huynhcodaidaover2/widgets/network_image_widget.dart';
import 'package:huynhcodaidaover2/widgets/banner_widget.dart';
import 'package:huynhcodaidaover2/widgets/loading_widget.dart';

import 'package:huynhcodaidaover2/repositories/photo_album_collection_repository.dart';

import 'package:huynhcodaidaover2/services/router_service.dart';

final GetIt getIt = GetIt.instance;

class PhotoAlbumCollectionWidget extends StatefulWidget {
  final String actionUrl;

  const PhotoAlbumCollectionWidget({
    required this.actionUrl,
  });

  @override
  State createState() => _PhotoAlbumCollectionWidgetState();
}

class _PhotoAlbumCollectionWidgetState
    extends State<PhotoAlbumCollectionWidget> {
  final PhotoAlbumCollectionRepository _photoAlbumCollectionRepository =
      getIt.get<PhotoAlbumCollectionRepository>();

  dynamic _state;
  late Future<PhotoAlbumCollection> _photoAlbumCollectionFuture;
  late PhotoAlbumCollection _photoAlbumCollection;
  late PhotoAlbumList _photoAlbumList;
  late List<PhotoAlbumListItem> _photoAlbumListItems;
  late BannerModel.Banner _banner;
  int _page = 1;
  bool _shouldLoad = false;

  @override
  void initState() {

    _photoAlbumCollectionFuture = _photoAlbumCollectionRepository.get(
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
      future: _photoAlbumCollectionFuture,
      builder:
          (BuildContext context, AsyncSnapshot<PhotoAlbumCollection> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: SpinKitFadingCircle(
              size: 120,
              color: Colors.amber,
            ),
          );
        }
         return Scaffold(
           body: Container(
             child: Text('This is photo album collection '),
           ),
         );


      },
    );
  }
}
