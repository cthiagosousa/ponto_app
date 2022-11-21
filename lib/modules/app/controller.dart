import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';

class AppController extends GetxController {
  @override
  void onInit() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    initializeDateFormatting();
    super.onInit();
  }
}