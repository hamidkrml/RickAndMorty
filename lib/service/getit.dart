import 'package:get_it/get_it.dart';
import 'package:rickandmorty/service/app_service.dart';
import 'package:rickandmorty/service/preferences_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  final prefs = await SharedPreferences.getInstance();

  getIt.registerLazySingleton<PreferencesService>(
    () => PreferencesService(prefs: prefs),
  );
  getIt.registerLazySingleton<AppService>(() => AppService());
}
