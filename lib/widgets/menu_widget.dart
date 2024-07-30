import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../models/banner.dart' as BannerModel;
import '../models/menu.dart';
import '../models/menu_item.dart';
import '../models/menu_item_list.dart';
import '../models/testing_menu.dart';
import '../repositories/menu_repository.dart';

import '../repositories/user_repository.dart';
import '../services/router_service.dart';
import 'banner_widget.dart';
import 'label_widget.dart';
import 'loading_widget.dart';
import 'network_image_widget.dart';

final GetIt getIt = GetIt.instance;

class MenuWidget extends StatefulWidget {
  final String actionUrl;
  const MenuWidget({
    Key? key,
    this.actionUrl = '/app/menu/danh-muc-chinh',
  }) : super(key: key);

  @override
  State createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  static const _pageSize = 20;
  final MenuRepository _menuRepository = getIt.get<MenuRepository>();
  late UserRepository _userRepository = getIt.get<UserRepository>();
  final PagingController<int, MenuItem> _pagingController =
      PagingController(firstPageKey: 1);
  final ScrollController _scrollController = ScrollController();
  Banner? _banner;
  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchMenuList(pageKey);
    });
    super.initState();
  }
  Future < void > _fetchBanner() async{

  }
  Future<void> _fetchMenuList(int pageKey) async {
    try {
      final menu =
          await _menuRepository.get(path: widget.actionUrl, page: pageKey);
      _banner = menu.banner;
      final itemsMenuList = menu.menuItemList;
      final itemsMenuListData = itemsMenuList?.data;
      final nextPageKey = pageKey;
      if (itemsMenuList!.to == itemsMenuList.total) {
        _pagingController.appendLastPage(itemsMenuListData!);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(itemsMenuListData!, nextPageKey);
      }
    } catch (e) {
      _pagingController.error = e;
      print("Error with the fetchPage");
      print(e);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          BannerWidget(
            banner: _banner,
            margin: EdgeInsets.only(
              bottom: 16,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: PagedListView<int, MenuItem>(
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate<MenuItem>(
                transitionDuration: const Duration( seconds: 2),
                itemBuilder: (BuildContext context, MenuItem item, int index) =>Container(
                  child: Column(
                    children: [
                      Text('The id of each menuItem is ${item.id}'),
                      SizedBox(height: 3),
                      Text('The title is ${item.title}'),
                    ],
                  ),
                ),


              ),
            ),
          ),
        ],
      ),

    );
  }
}
