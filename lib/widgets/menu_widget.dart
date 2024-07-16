import 'package:get_it/get_it.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:huynhcodaidaover2/models/menu_item.dart';
import 'package:huynhcodaidaover2/models/menu_item_list.dart';
import 'package:huynhcodaidaover2/models/menu.dart';
import 'package:huynhcodaidaover2/models/banner.dart' as BannerModel;

import 'package:huynhcodaidaover2/widgets/network_image_widget.dart';
import 'package:huynhcodaidaover2/widgets/banner_widget.dart';
import 'package:huynhcodaidaover2/widgets/loading_widget.dart';
import 'package:huynhcodaidaover2/widgets/label_widget.dart';

import 'package:huynhcodaidaover2/repositories/menu_repository.dart';

import 'package:huynhcodaidaover2/services/router_service.dart';

final GetIt getIt = GetIt.instance;

class MenuWidget extends StatefulWidget {
  final String actionUrl;

  const MenuWidget({
    this.actionUrl = '/app/menu/danh-muc-chinh',
  });

  @override
  State createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  final MenuRepository _menuRepository = getIt.get<MenuRepository>();

  dynamic _state;
  late Future<Menu> _menuFuture;
  late Menu _menu;
  late MenuItemList _menuItemList;
  late List<MenuItem> _menuItems;
  late BannerModel.Banner _banner;
  int _page = 1;
  bool _shouldLoad = false;

  @override
  void initState() {

    _menuFuture = _menuRepository.get(
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
      future: _menuFuture,
      builder: (BuildContext context, AsyncSnapshot<Menu> snapshot) {
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
             child: Text('This is the menu'),
           ),
         );



      },
    );
  }
}
