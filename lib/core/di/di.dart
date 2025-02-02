import 'package:get_it/get_it.dart';
import 'package:uptask/core/core.dart';
import 'package:uptask/presentation/splash/bloc/splash_bloc.dart';

final GetIt getIt = GetIt.instance;

void setupDI() {
  // Network
  getIt.registerLazySingleton<DioNetworkService>(
    () => DioNetworkService(AppConstant.baseUrl),
  );

  // Bloc
  getIt.registerLazySingleton(() => SplashBloc());
}
