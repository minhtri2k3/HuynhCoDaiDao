import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:bloc/bloc.dart';

import 'authentication_event.dart';
import 'authentication_bloc.dart';
import 'login_screen_event.dart';
import 'login_screen_state.dart';
import '../repositories/user_repository.dart';

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
      authenticationBloc.add(AuthenticationLoggedIn(userToken: userToken));
      emit(LoginScreenSuccess());
    } catch (e) {
      emit(LoginScreenFailure(error: e));
    }
  }
}
