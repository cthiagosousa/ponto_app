import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ponto_app/modules/home/controller.dart';
import 'package:ponto_app/modules/home/presentation.dart';
import 'package:ponto_app/modules/ui/base.dart';

class HomeScreen extends Screen<HomeController> {
  final HomePresentation presentation;

  HomeScreen(this.presentation, {super.key});

  @override
  Widget builder(context, theme, scroll) {
    return Column(
      children: [
        Container(
          width: 1.sw,
          height: 200.h,
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          color: theme.primaryColor,
          child: Column(
            children: [
              Text(
                presentation.date,
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}