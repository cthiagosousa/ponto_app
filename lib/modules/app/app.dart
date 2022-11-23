import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ponto_app/modules/home/presentation.dart';
import 'package:ponto_app/modules/home/screen.dart';
import 'package:ponto_app/modules/router/router.dart';
import 'package:ponto_app/modules/ui/theme.dart';

class PontoApp extends StatelessWidget {
  const PontoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return MaterialApp.router(
        title: "Ponto App",
        locale: const Locale("pt", "BR"),
        theme: theme,
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