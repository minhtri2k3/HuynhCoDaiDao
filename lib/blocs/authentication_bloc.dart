import 'dart:async';
import 'package:bloc/bloc.dart';

import '../models/user_token.dart';
import '../repositories/user_repository.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;

  AuthenticationBloc({required this.userRepository})
      : super(AuthenticationInitial()) {
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
      final UserToken? userToken = await userRepository.getToken();
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
    await userRepository.putToken(event.userToken);
    emit(AuthenticationSuccess());
  }

  Future<void> _onAuthenticationLoggedOut(
    AuthenticationLoggedOut event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(AuthenticationInProgress());
    await userRepository.deleteToken();
    emit(AuthenticationFailure());
  }
}
