import 'package:get_it/get_it.dart';
import 'package:ponto_app/modules/app/controller.dart';
import 'package:ponto_app/modules/auth/controller.dart';
import 'package:ponto_app/modules/office_hour/controller.dart';
import 'package:ponto_app/modules/office_hour/repository.dart';
import 'package:ponto_app/modules/services/auth.dart';
import 'package:ponto_app/modules/services/database/db.dart';
import 'package:ponto_app/modules/services/firebase.dart';
import 'package:ponto_app/modules/services/firestore.dart';
import 'package:ponto_app/modules/ui/base.dart';
import 'package:ponto_app/modules/user/controller.dart';
import 'package:ponto_app/modules/user/repository.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  WidgetsFlutterBinding.ensureInitialized();
  getIt.registerSingletonAsync<FirebaseService>(() => FirebaseService().onInit());
  final firebase = await getIt.getAsync<FirebaseService>();

  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService(firebase).onInit());
  getIt.registerSingleton<FirestoreService>(FirestoreService(firebase).onInit());

  getIt.registerSingleton<AppController>(AppController().onInit());
  getIt.registerLazySingleton<UserController>(() => UserController(UserRepositoryImp(getIt<FirebaseAuthService>())));
  getIt.registerLazySingleton<OfficeHourController>(
    () => OfficeHourController(OfficeHourRepositoryImp(getIt<FirestoreService>(), DB())));

  getIt.registerLazySingleton<AuthController>(() => AuthController());
}

