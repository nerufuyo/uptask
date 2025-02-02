part of 'splash_bloc.dart';

abstract class SplashState extends Equatable {}

class SplashInitial extends SplashState {
  @override
  List<Object?> get props => [];
}

class SplashLoading extends SplashState {
  @override
  List<Object?> get props => [];
}

class SplashSuccess extends SplashState {
  @override
  List<Object?> get props => [];
}

class SplashFailure extends SplashState {
  final String message;

  SplashFailure({required this.message});
  @override
  List<Object> get props => [message];
}
