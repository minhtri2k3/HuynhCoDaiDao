import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'State: ${this.runtimeType.toString()}';
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationInProgress extends AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {}

class AuthenticationFailure extends AuthenticationState {}
