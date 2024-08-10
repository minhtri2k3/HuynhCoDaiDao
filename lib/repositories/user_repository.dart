import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import '../models/user_token.dart';
import '../services/user_service.dart';

final GetIt getIt = GetIt.instance;

class UserRepository {
  final Box _appData = Hive.box('appData');
  final UserService _userService = getIt.get<UserService>();

  Future<UserToken> authenticate({
    required String username,
    required String password,
  }) {
    return _userService.authenticate(
      username: username,
      password: password,
    );
  }

  Future<void> putToken(UserToken userToken) {
    return _appData.put('userToken', userToken);
  }

  Future<UserToken> getToken() async {
    return _appData.get('userToken');
  }

  Future<void> deleteToken() {
    return _appData.delete('userToken');
  }
}
