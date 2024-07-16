import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:hive/hive.dart';

import 'package:huynhcodaidaover2/models/user_token.dart';
import 'package:huynhcodaidaover2/modules/message/message_category.dart';
import 'package:huynhcodaidaover2/modules/message/message_category_service.dart';

final GetIt getIt = GetIt.instance;

class MessageCategoryRepository {
  final Box _appData = Hive.box('appData');
  final MessageCategoryService _messageCategoryService = getIt.get<MessageCategoryService>();

  Future<MessageCategory> get({
    required String path,
    int page = 1,
  }) async {
    UserToken userToken = _appData.get('userToken');

    return _messageCategoryService.get(
      path: path,
      token: 'Bearer ' + userToken.accessToken,
      page: page,
    );
  }
}
