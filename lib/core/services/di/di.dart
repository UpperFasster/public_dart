import 'dart:developer';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:food_court/core/http/http.dart';
import 'package:food_court/core/services/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt getIt = GetIt.instance;

Future<void> initGetIt() async {
  getIt.registerSingletonAsync<SharedPreferences>(
    () async => await SharedPreferences.getInstance(),
  );
  await getIt.isReady<SharedPreferences>();
  Set<String> keys = getIt.get<SharedPreferences>().getKeys();
  log('Got lenght: ${keys.length}');
  for (String key in keys) {
    var value = getIt.get<SharedPreferences>().get(key);
    log('$key: $value');
  }
  getIt.registerLazySingleton<LocaleService>(
    () => LocaleService(PlatformDispatcher.instance.locale),
  );
  getIt.registerSingleton<ThemeService>(ThemeService());
  getIt.registerSingleton<UserStateService>(UserStateService());
  getIt.registerSingleton<Dio>(
    Dio(
      BaseOptions(
        baseUrl: 'http://127.0.0.1:8080',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    )..interceptors.add(CustomInterceptor()),
  );
  getIt.registerSingleton<ProductsDataService>(ProductsDataService());
}
