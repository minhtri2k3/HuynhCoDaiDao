import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../models/banner.dart' as BannerModel;
import '../models/photo_album_list_item.dart';
import '../models/user_token.dart';
import '../repositories/photo_album_collection_repository.dart';
import 'banner_widget.dart';

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

  BannerModel.Banner? _banner;

  @override
  void didUpdateWidget(covariant PhotoAlbumCollectionWidget oldWidget) {
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
    setState(() {
      _banner = photoAlbumCollection.banner;
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final photoAlbumCollection =
          await _photoAlbumCollectionRepository.get(path: widget.actionUrl);
      final photoAlbumList = photoAlbumCollection.photoAlbumList;
      final photoAlbumListData = photoAlbumCollection.photoAlbumList!.data;
      final isLastPage = photoAlbumList!.to <= photoAlbumList.total;
      if (photoAlbumList.nextPageUrl == null || isLastPage) {
        _pagingController.appendLastPage(photoAlbumListData);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(photoAlbumListData, nextPageKey);
      }
    } catch (e) {
      // Handle error
      _pagingController.error = e;
    }
  }

  @override
  void dispose() {
    _pagingController.dispose();
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
            child: PagedGridView<int, PhotoAlbumListItem>(
              pagingController: _pagingController,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns in the grid
                crossAxisSpacing: 15.0, // Spacing between columns
                mainAxisSpacing: 25.0,
                childAspectRatio: 0.7, // Spacing between rows
              ),
              builderDelegate: PagedChildBuilderDelegate<PhotoAlbumListItem>(
                firstPageProgressIndicatorBuilder: (context) => _Loading,
                newPageProgressIndicatorBuilder: (context) => _Loading,
                itemBuilder: (BuildContext context, PhotoAlbumListItem item,
                        int index) =>
                    GestureDetector(
                  onTap: () {
                    // Handle item tap
                  },
                  child: Container(
                    decoration: _Box_eachItem,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Expanded(
                            child: item.coverUrl == null
                                ? Image.asset(
                                    'assets/default_menu_item_icon.png',
                                    fit: BoxFit.cover,
                                  )
                                : CachedNetworkImage(
                                    httpHeaders: {
                                      'Authorization': 'Bearer ' +
                                          (_appData.get('userToken')
                                                  as UserToken)
                                              .accessToken,
                                    },
                                    imageUrl: item.coverUrl!,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: double.infinity,
                                    placeholder: (context, url) =>
                                        CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                          ),
                          Text('Hello')
                          // Add more widgets for your grid item if necessary
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget get _Loading {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: CircularProgressIndicator(
          color: Colors.orange,
        ),
      ),
    );
  }

  BoxDecoration get _Box_eachItem {
    return BoxDecoration(
      color: Colors.white,
      border: Border.all(
        color: Colors.amber,
        width: 2,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 4,
          spreadRadius: 2,
          offset: Offset(0, 4),
        )
      ],
    );
  }
}
