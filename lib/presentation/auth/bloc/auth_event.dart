part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthLoginEvent extends AuthEvent {
  final String username;
  final String email;
  final String password;

  AuthLoginEvent({
    required this.username,
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

class AuthRegisterEvent extends AuthEvent {
  final String username;
  final String email;
  final String password;

  AuthRegisterEvent({
    required this.username,
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

class AuthLogoutEvent extends AuthEvent {}
