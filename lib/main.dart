import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' as Services;
import 'package:flutter/material.dart' hide Router;

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:device_preview/device_preview.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:huynhcodaidaover2/models/user_token.dart';

import 'package:huynhcodaidaover2/blocs/global_bloc_observer.dart';
import 'package:huynhcodaidaover2/blocs/authentication_event.dart';
import 'package:huynhcodaidaover2/blocs/authentication_state.dart';
import 'package:huynhcodaidaover2/blocs/authentication_bloc.dart';
import 'package:huynhcodaidaover2/blocs/login_screen_bloc.dart';
import 'package:huynhcodaidaover2/blocs/audio_controller_event.dart';
import 'package:huynhcodaidaover2/blocs/audio_controller_bloc.dart';

import 'package:huynhcodaidaover2/repositories/user_repository.dart';
import 'package:huynhcodaidaover2/repositories/menu_repository.dart';
import 'package:huynhcodaidaover2/repositories/photo_album_collection_repository.dart';
import 'package:huynhcodaidaover2/repositories/audio_album_collection_repository.dart';
import 'package:huynhcodaidaover2/repositories/photo_album_repository.dart';
import 'package:huynhcodaidaover2/repositories/audio_album_repository.dart';

import 'package:huynhcodaidaover2/services/user_service.dart';
import 'package:huynhcodaidaover2/services/menu_service.dart';
import 'package:huynhcodaidaover2/services/photo_album_collection_service.dart';
import 'package:huynhcodaidaover2/services/audio_album_collection_service.dart';
import 'package:huynhcodaidaover2/services/photo_album_service.dart';
import 'package:huynhcodaidaover2/services/audio_album_service.dart';

import 'package:huynhcodaidaover2/screens/splash_screen.dart';
import 'package:huynhcodaidaover2/screens/login_screen.dart';
import 'package:huynhcodaidaover2/screens/home_screen.dart';
import 'package:huynhcodaidaover2/screens/menu_screen.dart';
import 'package:huynhcodaidaover2/screens/webview_screen.dart';
import 'package:huynhcodaidaover2/screens/photo_album_collection_screen.dart';
import 'package:huynhcodaidaover2/screens/audio_album_collection_screen.dart';
import 'package:huynhcodaidaover2/screens/photo_album_screen.dart';
import 'package:huynhcodaidaover2/screens/audio_album_screen.dart';

import 'package:huynhcodaidaover2/modules/message/message_category_repository.dart';
import 'package:huynhcodaidaover2/modules/message/message_category_service.dart';
import 'package:huynhcodaidaover2/modules/message/message_category_screen.dart';

import 'package:huynhcodaidaover2/screens/pdf_view_screen.dart';

import 'package:onesignal_flutter/onesignal_flutter.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerLazySingleton<FlutterSecureStorage>(() => FlutterSecureStorage());

  final FluroRouter router = FluroRouter();
  getIt.registerLazySingleton<FluroRouter>(() => router);

  getIt.registerLazySingleton<UserService>(() => UserService(Dio()));
  getIt.registerLazySingleton<MenuService>(() => MenuService(Dio()));
  getIt.registerLazySingleton<PhotoAlbumCollectionService>(() => PhotoAlbumCollectionService(Dio()));
  getIt.registerLazySingleton<AudioAlbumCollectionService>(() => AudioAlbumCollectionService(Dio()));
  getIt.registerLazySingleton<PhotoAlbumService>(() => PhotoAlbumService(Dio()));
  getIt.registerLazySingleton<AudioAlbumService>(() => AudioAlbumService(Dio()));
 // test Github
  getIt.registerLazySingleton<UserRepository>(() => UserRepository());
  getIt.registerLazySingleton<MenuRepository>(() => MenuRepository());
  getIt.registerLazySingleton<PhotoAlbumCollectionRepository>(() => PhotoAlbumCollectionRepository());
  getIt.registerLazySingleton<AudioAlbumCollectionRepository>(() => AudioAlbumCollectionRepository());
  getIt.registerLazySingleton<PhotoAlbumRepository>(() => PhotoAlbumRepository());
  getIt.registerLazySingleton<AudioAlbumRepository>(() => AudioAlbumRepository());
  getIt.registerLazySingleton<MessageCategoryService>(() => MessageCategoryService(Dio()));
  getIt.registerLazySingleton<MessageCategoryRepository>(() => MessageCategoryRepository());
}

Future<void> setupAppData() async {
  final FlutterSecureStorage secureStorage = getIt.get<FlutterSecureStorage>();
  final String? _appDataKey = await secureStorage.read(key: 'appDataKey');
  List<int> appDataKey;
  if (_appDataKey != null) {
    appDataKey = List<int>.from(jsonDecode(_appDataKey));
  } else {
    appDataKey = Hive.generateSecureKey();
    await secureStorage.write(
      key: 'appDataKey',
      value: jsonEncode(appDataKey),
    );
  }

  await Hive.initFlutter('hive');
  Hive.registerAdapter(UserTokenAdapter());
  await Hive.openBox('appData', encryptionCipher: HiveAesCipher(appDataKey));
}

Future<void> setupRouter(FluroRouter router) async {
  router.define(
    '/home/',
    transitionType: TransitionType.fadeIn,
    handler: Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
        return HomeScreen();
      },
    ),
  );

  router.define(
    '/menu/',
    transitionType: TransitionType.inFromRight,
    handler: Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
        String actionUrl = params['actionUrl'][0];
        String actionTitle = params['actionTitle'][0];

        actionUrl = utf8.decode(base64Url.decode(actionUrl));
        actionTitle = utf8.decode(base64Url.decode(actionTitle));

        return MenuScreen(
          actionUrl: actionUrl,
          actionTitle: actionTitle,
        );
      },
    ),
  );

  // Define other routes similarly...
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Services.SystemChrome.setPreferredOrientations([
    Services.DeviceOrientation.portraitUp,
    Services.DeviceOrientation.portraitDown,
  ]);

  await setupGetIt();
  final router = getIt<FluroRouter>();
  await setupAppData();
  await setupRouter(router);

  Bloc.observer = GlobalBlocObserver();

  runApp(
    DevicePreview(
      enabled: false, // !kReleaseMode,
      builder: (BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<AuthenticationBloc>(
            create: (BuildContext context) {
              final UserRepository userRepository = getIt<UserRepository>();
              return AuthenticationBloc(userRepository: userRepository)..add(AuthenticationStarted());
            },
          ),
          BlocProvider<AudioControllerBloc>(
            create: (BuildContext context) {
              return AudioControllerBloc()..add(AudioControllerHide());
            },
          ),
        ],
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: getIt<FluroRouter>().generator,
      debugShowCheckedModeBanner: false,
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, AuthenticationState state) {
          Widget home = SplashScreen();

          if (state is AuthenticationSuccess) {
            home = HomeScreen();
          } else if (state is AuthenticationFailure) {
            final AuthenticationBloc authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
            home = BlocProvider(
              create: (context) => LoginScreenBloc(authenticationBloc: authenticationBloc),
              child: LoginScreen(),
            );
          }

          return home;
        },
      ),
    );
  }
}
