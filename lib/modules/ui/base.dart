import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AppBase<T> extends GetView<T> {
  const AppBase({super.key});

  Widget builder(BuildContext context, ThemeData theme);

  @override
  Widget build(BuildContext context) {
    return builder(context, Theme.of(context));
  }
}


abstract class Screen<T> extends AppBase<T> {
  final PreferredSizeWidget? appBar;

  const Screen({
    super.key, 
    this.appBar, 
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: builder(context, Theme.of(context)),
      ),
    );
  }
}

abstract class AppWidget<T> extends AppBase<T> {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return builder(context, Theme.of(context));
  }
}
