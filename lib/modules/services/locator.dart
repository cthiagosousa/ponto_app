import 'package:get/get.dart';
import 'package:ponto_app/modules/app/controller.dart';
import 'package:ponto_app/modules/office_hour/controller.dart';
import 'package:ponto_app/modules/office_hour/repository.dart';
import 'package:ponto_app/modules/services/dio.dart';
import 'package:ponto_app/modules/user/controller.dart';
import 'package:ponto_app/modules/user/repository.dart';

void setupLocator() {
  Get.put<DioService>(DioService());
  DioService dio = Get.find<DioService>();
  Get.put<AppController>(AppController());
  
  Get.lazyPut<UserController>(() => UserController(UserRepositoryImp(dio)));
  Get.lazyPut<OfficeHourController>(() => OfficeHourController(OfficeHourRepositoryImp(dio)));
}

