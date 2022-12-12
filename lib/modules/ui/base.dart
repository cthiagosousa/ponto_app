import 'package:flutter/material.dart';
import 'package:ponto_app/modules/services/locator.dart';

abstract class AppBase<T extends Object> extends StatelessWidget {
  const AppBase({super.key});

  T get controller => getIt.get<T>();

  Widget builder(BuildContext context, ThemeData theme);

  @override
  Widget build(BuildContext context) {
    return builder(context, Theme.of(context));
  }
}


abstract class ScreenBase<T extends Object> extends AppBase<T> {
  final PreferredSizeWidget? appBar;

  const ScreenBase({
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

abstract class WidgetBase<T extends Object> extends AppBase<T> {
  const WidgetBase({super.key});

  @override
  Widget build(BuildContext context) {
    return builder(context, Theme.of(context));
  }
}
