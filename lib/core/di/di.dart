import 'package:get_it/get_it.dart';
import 'package:uptask/core/core.dart';

final GetIt getIt = GetIt.instance;

void setupDI() {
  getIt.registerLazySingleton<DioNetworkService>(
    () => DioNetworkService(AppConstant.baseUrl),
  );
}
