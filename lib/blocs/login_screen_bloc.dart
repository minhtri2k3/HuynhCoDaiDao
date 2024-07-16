import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:huynhcodaidaover2/blocs/authentication_event.dart';
import 'package:huynhcodaidaover2/blocs/authentication_bloc.dart';
import 'package:huynhcodaidaover2/blocs/login_screen_event.dart';
import 'package:huynhcodaidaover2/blocs/login_screen_state.dart';

import 'package:huynhcodaidaover2/repositories/user_repository.dart';

final GetIt getIt = GetIt.instance;

class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> {
  // ignore: close_sinks
  final AuthenticationBloc authenticationBloc;
  final UserRepository _userRepository = getIt.get<UserRepository>();

  LoginScreenBloc({
    required this.authenticationBloc,
  })  : assert(authenticationBloc != null),
        super(LoginScreenInitial());

  @override
  Stream<LoginScreenState> mapEventToState(LoginScreenEvent event) async* {
    if (event is LoginScreenObscureOptionTapped) {
      yield LoginScreenObscureOptionChanged(
        obscureOption: !event.obscureOption,
      );
    }

    if (event is LoginScreenLoginButtonPressed) {
      yield LoginScreenInProgress();

      try {
        final userToken = await _userRepository.authenticate(
          username: event.username,
          password: event.password,
        );

        authenticationBloc.add(AuthenticationLoggedIn(userToken: userToken));
        yield LoginScreenSuccess();
      } catch (error) {
        yield LoginScreenFailure(error: error);
      }
    }
  }
}
