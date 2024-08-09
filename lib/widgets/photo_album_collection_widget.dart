import 'package:get_it/get_it.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive/hive.dart';

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
  final Box _appData = Hive.box('appData');
  BannerModel.Banner? _banner;
  @override
  void didUpdateWidget(covariant PhotoAlbumCollectionWidget oldWidget) {
    // TODO: implement didUpdateWidget
    _fetchBanner();
    super.didUpdateWidget(oldWidget);
  }
  @override
  void initState() {
    _fetchBanner();
    print('The action Url is ${widget.actionUrl}');


    super.initState();
  }

  Future<void> _fetchBanner() async {
    final photoAlbumCollection =
        await _photoAlbumCollectionRepository.get(path: widget.actionUrl);
    setState(() {
      _banner = photoAlbumCollection.banner;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        if (_banner != null)
          BannerWidget(
            banner: _banner!,
            margin: EdgeInsets.only(bottom: 16),
            height: 140,
          ),
        Text('This is the album')
      ],
    ));
  }
}
