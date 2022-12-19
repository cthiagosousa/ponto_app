import 'package:flutter/widgets.dart';
import 'package:ponto_app/modules/app/app.dart';
import 'package:ponto_app/modules/services/locator.dart';

void main() async {
  await setupLocator();
  runApp(const PontoApp());
}


