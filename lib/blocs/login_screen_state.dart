import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class LoginScreenState extends Equatable {
  const LoginScreenState();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'State: ${this.runtimeType.toString()}';
}

class LoginScreenInitial extends LoginScreenState {}

class LoginScreenInProgress extends LoginScreenState {}

class LoginScreenSuccess extends LoginScreenState {}

class LoginScreenFailure extends LoginScreenState {
  final Object error;

  const LoginScreenFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'State: LoginScreenFailure { error: $error }';
}

class LoginScreenObscureOptionChanged extends LoginScreenState {
  final bool obscureOption;

  const LoginScreenObscureOptionChanged({required this.obscureOption});

  @override
  List<Object> get props => [obscureOption];

  @override
  String toString() =>
      'State: LoginScreenObscureOptionChanged { obscureOption: $obscureOption }';
}
