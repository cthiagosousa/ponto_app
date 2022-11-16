import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ponto_app/modules/app/controller.dart';
import 'package:ponto_app/modules/router/router.dart';

class PontoApp extends StatefulWidget {
  final AppController controller;

  const PontoApp(this.controller, {super.key});

  @override
  State<PontoApp> createState() => _PontoAppState();
}

class _PontoAppState extends State<PontoApp> {

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        ScreenUtil.init(context);
        return MaterialApp.router(
        title: "Ponto App",
        locale: const Locale("pt", "BR"),
        debugShowCheckedModeBanner: false,
        routerConfig: router(),
      );
    });
  }
}