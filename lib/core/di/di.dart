import 'package:get_it/get_it.dart';
import 'package:uptask/core/core.dart';
import 'package:uptask/data/data.dart';
import 'package:uptask/domain/domain.dart';
import 'package:uptask/presentation/presentation.dart';

final GetIt getIt = GetIt.instance;

void setupDI() {
  // Network
  getIt.registerLazySingleton<DioNetworkService>(
    () => DioNetworkService(AppConstant.baseUrl),
  );

  // Bloc
  getIt.registerLazySingleton(() => SplashBloc());
  getIt.registerLazySingleton(() => HomeBloc());
  getIt.registerLazySingleton(() => AuthBloc(getIt<AuthRepository>()));

  // Remote
  getIt.registerLazySingleton(() => UserRemoteData());

  // Repository
  getIt.registerLazySingleton(() => AuthRepository());
}
