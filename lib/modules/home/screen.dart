import 'package:flutter/material.dart';
import 'package:ponto_app/modules/home/controller.dart';
import 'package:ponto_app/modules/home/presentation.dart';
import 'package:ponto_app/modules/home/widgets/appbar.dart';
import 'package:ponto_app/modules/home/widgets/journey_widget.dart';
import 'package:ponto_app/modules/ui/base.dart';

class HomeScreen extends Screen<HomeController> {
  final HomePresentation presentation;

  const HomeScreen(this.presentation, {super.key});

  @override
  Widget builder(context, theme) {
    return Column(
      children: [
        const HomeAppBar(),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const JourneyWidget(),
            ],
          ),
        ),
      ],
    );
  }
}