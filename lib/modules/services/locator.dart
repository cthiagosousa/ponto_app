import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:ponto_app/modules/app/controller.dart';
import 'package:ponto_app/modules/services/dio.dart';
import 'package:ponto_app/modules/user/controller.dart';
import 'package:ponto_app/modules/user/repository.dart';

void setupLocator() {
  Get.registerLazySingleton<DioService>(() => DioService());
  DioService dio = Get.find<DioService>();

  Get.registerLazySingleton<AppController>(() => AppController());
  Get.registerLazySingleton<UserController>(() => UserController(UserRepositoryImp(dio)));
}

class Get {
  static T find<T extends Object>(
    {String? instanceName, dynamic param1, dynamic param2}) {
    return GetIt.I.get<T>(
      instanceName: instanceName,
      param1: param1,
      param2: param2,
    );
  }

  static void registerLazySingleton<T extends Object>(
    FactoryFunc<T> factoryFunc, {
    String? instanceName,
    DisposingFunc<T>? dispose,
  }) {
    return GetIt.I.registerLazySingleton<T>(
      factoryFunc, instanceName: instanceName, dispose: dispose);
  }

  static FutureOr lazyPut<T extends Object>(Object instance) {
    return GetIt.I.resetLazySingleton<T>(instance: instance);
  }

  static bool isRegistered<T extends Object>(Object instance) {
    return GetIt.I.isRegistered<T>(instance: instance);
  }
}
