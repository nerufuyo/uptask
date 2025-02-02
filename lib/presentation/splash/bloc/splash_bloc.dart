import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:uptask/core/core.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  SplashBloc() : super(SplashInitial()) {
    on<SplashStarted>((event, emit) async {
      await _handleSplashStart(emit);
    });

    on<SplashCompleted>((event, emit) async {
      await _navigateToNextScreen();
      emit(SplashSuccess());
    });
  }

  Future<void> _handleSplashStart(Emitter<SplashState> emit) async {
    emit(SplashLoading());
    await Future.delayed(Duration(seconds: 3));
    add(SplashCompleted());
  }

  Future<void> _navigateToNextScreen() async {
    String? token = await _secureStorage.read(key: AppConstant.tokenName);

    if (token != null && token.isNotEmpty) {
      GoRouter.of(globalKey.currentContext!).goNamed(RoutePath.home);
    } else {
      GoRouter.of(globalKey.currentContext!).goNamed(RoutePath.auth);
    }
  }
}
