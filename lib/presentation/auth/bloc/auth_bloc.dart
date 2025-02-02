import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uptask/core/core.dart';
import 'package:uptask/domain/domain.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  AuthBloc(this._authRepository) : super(AuthInitial()) {
    on<AuthLoginEvent>((event, emit) async {
      await _handleLogin(event, emit);
    });

    on<AuthRegisterEvent>((event, emit) async {
      await _handleRegister(event, emit);
    });

    on<AuthLogoutEvent>((event, emit) async {
      await _handleLogout(emit);
    });
  }

  Future<void> _handleLogin(
    AuthLoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await _authRepository.getTokenByLogin(
      email: event.email,
      password: event.password,
    );

    result.fold(
      (failure) {
        emit(AuthFailure(message: failure));
      },
      (tokenData) async {
        await _saveTokenToStorage(tokenData['token']);
        emit(AuthSuccess(userId: tokenData['userId']));
      },
    );
  }

  Future<void> _handleRegister(
    AuthRegisterEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await _authRepository.getTokenByRegister(
      email: event.email,
      password: event.password,
    );

    result.fold(
      (failure) {
        emit(AuthFailure(message: failure));
      },
      (tokenData) async {
        await _saveTokenToStorage(tokenData['token']);
        emit(AuthSuccess(userId: tokenData['userId']));
      },
    );
  }

  Future<void> _saveTokenToStorage(String token) async {
    await _secureStorage.write(key: AppConstant.tokenName, value: token);
  }

  Future<void> _handleLogout(Emitter<AuthState> emit) async {
    await _secureStorage.delete(key: AppConstant.tokenName);
    emit(AuthInitial());
  }
}
