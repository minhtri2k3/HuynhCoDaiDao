import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:hive/hive.dart';

import 'package:huynhcodaidaover2/models/user_token.dart';
import 'package:huynhcodaidaover2/models/menu.dart';

import 'package:huynhcodaidaover2/services/menu_service.dart';

final GetIt getIt = GetIt.instance;

class MenuRepository {
  final Box _appData = Hive.box('appData');
  final MenuService _menuService = getIt.get<MenuService>();

  Future<Menu> get({
    required String path,
    int page = 1,
  }) async {
    UserToken userToken = _appData.get('userToken');

    return _menuService.get(
      path: path,
      token: 'Bearer ' + userToken.accessToken,
      page: page,
    );
  }
}
