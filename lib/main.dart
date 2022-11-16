import 'package:flutter/widgets.dart';
import 'package:ponto_app/modules/app/app.dart';
import 'package:ponto_app/modules/app/controller.dart';
import 'package:ponto_app/modules/services/locator.dart';

void main() {
  setupLocator();
  runApp(PontoApp(Get.find<AppController>()));
}


