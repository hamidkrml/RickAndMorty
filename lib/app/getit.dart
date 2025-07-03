import 'package:get_it/get_it.dart';
import 'package:rickandmorty/service/app_service.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton<AppService>(() => AppService());
}
