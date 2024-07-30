import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';

import '../repositories/user_repository.dart';
import 'authentication_bloc.dart';
import 'authentication_event.dart';
import 'login_screen_event.dart';
import 'login_screen_state.dart';

final GetIt getIt = GetIt.instance;

class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> {
  // ignore: close_sinks
  final AuthenticationBloc authenticationBloc;
  final UserRepository _userRepository = getIt.get<UserRepository>();

  LoginScreenBloc({
    required this.authenticationBloc,
  }) : super(LoginScreenInitial()) {
    on<LoginScreenObscureOptionTapped>(_LoginScreenObscureOptionTapped);
    on<LoginScreenLoginButtonPressed>(_LoginScreenLoginButtonPressed);
  }
  Future<void> _LoginScreenObscureOptionTapped(
    LoginScreenObscureOptionTapped event,
    Emitter<LoginScreenState> emit,
  ) async {
    emit(LoginScreenObscureOptionChanged(obscureOption: !event.obscureOption));
  }

  Future<void> _LoginScreenLoginButtonPressed(
    LoginScreenLoginButtonPressed event,
    Emitter<LoginScreenState> emit,
  ) async {
    emit(LoginScreenInProgress());
    try {
      final userToken = await _userRepository.authenticate(
        username: event.username,
        password: event.password,
      );
      print('The username is ${event.username}');
      print('The password is ${event.password}');
      print('The token is ${userToken.accessToken}');
      print('Expired in ${userToken.expiresIn}');
      authenticationBloc.add(AuthenticationLoggedIn(userToken: userToken));
      emit(LoginScreenSuccess());
    } catch (e) {
      emit(LoginScreenFailure(error: e));
    }
  }
}
