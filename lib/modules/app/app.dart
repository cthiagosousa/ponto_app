import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ponto_app/modules/app/controller.dart';
import 'package:ponto_app/modules/home/presentation.dart';
import 'package:ponto_app/modules/home/screen.dart';
import 'package:ponto_app/modules/router/router.dart';

class PontoApp extends StatefulWidget {
  final AppController controller;

  const PontoApp(this.controller, {super.key});

  @override
  State<PontoApp> createState() => _PontoAppState();
}

class _PontoAppState extends State<PontoApp> {

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    initializeDateFormatting();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return MaterialApp.router(
        title: "Ponto App",
        locale: const Locale("pt", "BR"),
        debugShowCheckedModeBanner: false,
        routerConfig: router(),
        builder: (context, child) {
          ScreenUtil.init(context);
          return HomeScreen(HomePresentation());
        },
      );
    });
  }
}