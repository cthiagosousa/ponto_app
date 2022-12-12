import 'package:get_it/get_it.dart';
import 'package:ponto_app/modules/app/controller.dart';
import 'package:ponto_app/modules/office_hour/controller.dart';
import 'package:ponto_app/modules/office_hour/repository.dart';
import 'package:ponto_app/modules/services/database/db.dart';
import 'package:ponto_app/modules/services/firestore.dart';
import 'package:ponto_app/modules/user/controller.dart';
import 'package:ponto_app/modules/user/repository.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<FirestoreService>(() => FirestoreService());
  getIt.registerSingleton<AppController>(AppController());
  getIt.registerLazySingleton<UserController>(() => UserController(UserRepositoryImp(getIt<FirestoreService>())));
  getIt.registerLazySingleton<OfficeHourController>(
    () => OfficeHourController(OfficeHourRepositoryImp(getIt<FirestoreService>(), DB())));
}

