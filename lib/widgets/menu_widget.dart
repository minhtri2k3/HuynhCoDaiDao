import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../models/banner.dart' as BannerModel;
import '../models/menu_item.dart';
import '../models/user_token.dart';
import '../repositories/menu_repository.dart';

import 'banner_widget.dart';

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
  final Box _appData = Hive.box('appData');
  static const _pageSize = 20;
  final MenuRepository _menuRepository = getIt.get<MenuRepository>();
  late final PagingController<int, MenuItem> _pagingController;
  final ScrollController _scrollController = ScrollController();
  BannerModel.Banner? _banner;
  @override
  void initState() {
    super.initState();
    print('The action Url is ${widget.actionUrl}');
    _pagingController = PagingController(firstPageKey: 1);
    _fetchBanner();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchMenuList(pageKey);
    });
  }

  @override
  void didUpdateWidget(MenuWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.actionUrl != oldWidget.actionUrl) {
      _pagingController.refresh();
      _fetchBanner();
      _pagingController.addPageRequestListener((pageKey) {
        _fetchMenuList(pageKey);
      });
    }
  }

  Future<void> _fetchBanner() async {
    final menu = await _menuRepository.get(path: widget.actionUrl, page: 1);
    setState(() {
      _banner = menu.banner;
    });
  }

  Future<void> _fetchMenuList(int pageKey) async {
    try {
      print('Fetching menu ');
      final menu =
          await _menuRepository.get(path: widget.actionUrl, page: pageKey);
      final itemsMenuList = menu.menuItemList;
      final itemsMenuListData = itemsMenuList?.data ?? [];
      final isLastPage = itemsMenuList!.to >= itemsMenuList.total;
      if (itemsMenuList.nextPageUrl == null || isLastPage) {
        _pagingController.appendLastPage(itemsMenuListData);
        print('Fetch the last page');
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(itemsMenuListData, nextPageKey);
        print('Fetch the page');
      }
      // print('The to value is ${itemsMenuList.to.toString()}  ');
      // print('The total value is ${itemsMenuList.total.toString()}');
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
          if (_banner != null)
            BannerWidget(
              banner: _banner!,
              margin: EdgeInsets.only(
                bottom: 16,
              ),
              height: 140, // Specify your desired height
            ),
          Expanded(
            child: PagedListView<int, MenuItem>(
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate<MenuItem>(
                newPageProgressIndicatorBuilder: (context) => _Loading,
                firstPageProgressIndicatorBuilder: (context) => _Loading,
                transitionDuration: const Duration(seconds: 1),
                itemBuilder: (BuildContext context, MenuItem item, int index) =>
                    Column(
                  children: [
                    ListTile(
                      leading: item.primaryIconUrl != null
                          ? CachedNetworkImage(
                              httpHeaders: {
                                'Authorization': 'Bearer ' +
                                    (_appData.get('userToken') as UserToken)
                                        .accessToken,
                              },
                              imageUrl: item.primaryIconUrl!,
                              placeholder: (context, url) => CircleAvatar(
                                backgroundColor: Colors.grey,
                                child: CircularProgressIndicator(
                                  color: Colors.orange,
                                ), // Spinner while loading
                              ),
                              errorWidget: (context, url, error) =>
                                  CircleAvatar(
                                child: Container(
                                    height: double.infinity,
                                    width: double.infinity,
                                    child: Icon(
                                      Icons.account_circle_rounded,
                                      color: Colors.grey,
                                      size: 40,
                                    )),
                              ),
                              width: 40, // Adjust width and height as needed
                              height: 40,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                        'assets/default_menu_item_icon.png',
                        width: 35,
                        height: 35,
                      ),
                      // Default icon if no URL is provided
                      title: Text(
                        '${item.title}',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: item.description != null
                          ? Text(
                        '${item.description}',
                        style: TextStyle(
                          fontSize: 11, // Adjust the font size as needed
                          color: Colors.black, // Adjust the text color as needed
                        ),
                      )
                          : null,

                      onTap: () {
                        if (item.actionUrl != null &&
                            item.actionTypeName != null &&
                            item.actionTitle != null) {
                          print('Tapped the ${item.actionTypeName}');
                          final Uri uri = Uri(
                            path: '/${item.actionTypeName}',
                            queryParameters: {
                              'actionUrl': base64Url
                                  .encode(utf8.encode(item.actionUrl!)),
                              'actionTitle': base64Url
                                  .encode(utf8.encode(item.actionTitle!)),
                            },
                          );
                          context.push(uri.toString());

                        } else {

                          // Handle the case when any of the required fields are null
                          print("One or more required fields are null");
                        }
                      },
                      trailing: Icon(
                        Icons.navigate_next,
                        color: Colors.amberAccent,
                      ),
                    ),
                    Divider(
                      height:
                          1, // Adjust height to make the line thinner or thicker
                      color: Colors.amber,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget get _Loading{
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: CircularProgressIndicator(
          color: Colors.orange,
        ),
      ),
    );
  }
}
