import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:ponto_app/modules/services/database/db.dart';

class AppController {
  
  void onInit() {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    initializeDateFormatting();
    initializeDatabase();
  }

  Future<void> initializeDatabase() async {
    final db = DB();
    await db.init();
  }
}