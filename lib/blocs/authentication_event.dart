import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'package:huynhcodaidaover2/models/user_token.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'Event: ${this.runtimeType.toString()}';
}

class AuthenticationStarted extends AuthenticationEvent {}

class AuthenticationLoggedIn extends AuthenticationEvent {
  final UserToken userToken;

  const AuthenticationLoggedIn({required this.userToken});

  @override
  List<Object> get props => [userToken];
}

class AuthenticationLoggedOut extends AuthenticationEvent {}
