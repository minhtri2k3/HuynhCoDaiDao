import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class LoginScreenEvent extends Equatable {
  const LoginScreenEvent();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'Event: ${this.runtimeType.toString()}';
}

class LoginScreenObscureOptionTapped extends LoginScreenEvent {
  final bool obscureOption;

  const LoginScreenObscureOptionTapped({required this.obscureOption});

  @override
  List<Object> get props => [obscureOption];

  @override
  String toString() =>
      'Event: LoginScreenObscureOptionTapped { obscureOption: $obscureOption }';
}

class LoginScreenLoginButtonPressed extends LoginScreenEvent {
  final String username;
  final String password;

  const LoginScreenLoginButtonPressed({
    required this.username,
    required this.password,
  });

  @override
  List<Object> get props => [username, password];
}
