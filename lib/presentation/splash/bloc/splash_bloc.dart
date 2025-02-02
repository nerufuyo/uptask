import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashStarted>((event, emit) async {
      await _handleSplashStart(emit);
    });

    on<SplashCompleted>((event, emit) async {
      emit(SplashSuccess());
    });
  }

  Future<void> _handleSplashStart(Emitter<SplashState> emit) async {
    emit(SplashLoading());
    await Future.delayed(Duration(seconds: 3));
    add(SplashCompleted());
  }
}
