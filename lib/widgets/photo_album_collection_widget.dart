import 'package:cached_network_image/cached_network_image.dart';
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
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../models/user_token.dart';

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
  final PagingController<int, PhotoAlbumListItem> _pagingController =
  PagingController(firstPageKey: 1);
  // List<PhotoAlbumListItem>? _photoAlbumListItems;
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
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchBanner() async {
    final photoAlbumCollection =
        await _photoAlbumCollectionRepository.get(path: widget.actionUrl);
    final photoAlbumList = photoAlbumCollection.photoAlbumList!.data;

    setState(() {
      _banner = photoAlbumCollection.banner;
      // _photoAlbumListItems = photoAlbumList;
    });
  }
  Future <void> _fetchPage(int pageKey) async{
    try{
      final photoAlbumCollection =
      await _photoAlbumCollectionRepository.get(path: widget.actionUrl);
      final photoAlbumList = photoAlbumCollection.photoAlbumList;
      final photoAlbumListData = photoAlbumCollection.photoAlbumList!.data;
      final isLastPage = photoAlbumList!.to >= photoAlbumList.total;
      if(photoAlbumList.nextPageUrl==null ||isLastPage){
         _pagingController.appendLastPage(photoAlbumListData);
      }else{
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(photoAlbumListData, nextPageKey);
      }
    }catch(e){

    }
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
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0, // Spacing between columns
              mainAxisSpacing: 10.0,
            ),
            itemBuilder: (BuildContext context, int index) {
              PhotoAlbumListItem _photoAlbumListItem =
                  _photoAlbumListItems![index];
              return GestureDetector(
                onTap: () {},
                child: Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.amber,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            spreadRadius: 2,
                            offset: Offset(0, 4),
                          )
                        ]),
                    child: Column(
                      children: [
                        _photoAlbumListItem.coverUrl == null
                            ? Image.asset(
                          'assets/default_menu_item_icon.png',
                          width: 35,
                          height: 35,
                          fit: BoxFit.cover,
                        )
                            : CachedNetworkImage(
                            httpHeaders: {
                              'Authorization': 'Bearer ' +
                                  (_appData.get('userToken') as UserToken)
                                      .accessToken,
                            },
                            imageUrl: _photoAlbumListItem.coverUrl!
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    ));
  }
}
