import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:bloc/bloc.dart';

import 'package:huynhcodaidaover2/models/user_token.dart';

import 'package:huynhcodaidaover2/blocs/authentication_event.dart';
import 'package:huynhcodaidaover2/blocs/authentication_state.dart';

import 'package:huynhcodaidaover2/repositories/user_repository.dart';

final GetIt getIt = GetIt.instance;

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository = getIt.get<UserRepository>();

  AuthenticationBloc({required UserRepository userRepository}) : super(AuthenticationInitial()){
    on<AuthenticationStarted>(_onAuthenticationStarted);
    on<AuthenticationLoggedIn>(_onAuthenticationLoggedIn);
    on<AuthenticationLoggedOut>(_onAuthenticationLoggedOut);
  }
  Future<void> _onAuthenticationStarted(
      AuthenticationStarted event,
      Emitter<AuthenticationState> emit,
      ) async {
    emit(AuthenticationInProgress());
    try {
      final UserToken? userToken = await _userRepository.getToken();
      await Future.delayed(Duration(seconds: 3));
      if (userToken != null) {
        emit(AuthenticationSuccess());
      } else {
        emit(AuthenticationFailure());
      }
    } catch (_) {
      emit(AuthenticationFailure());
    }
  }
  Future<void> _onAuthenticationLoggedIn(
      AuthenticationLoggedIn event,
      Emitter<AuthenticationState> emit,
      ) async {
    emit(AuthenticationInProgress());
    await _userRepository.putToken(event.userToken);
    emit(AuthenticationSuccess());
  }
  Future<void> _onAuthenticationLoggedOut(
      AuthenticationLoggedOut event,
      Emitter<AuthenticationState> emit,
      ) async {
    emit(AuthenticationInProgress());
    await _userRepository.deleteToken();
    emit(AuthenticationFailure());
  }
}


