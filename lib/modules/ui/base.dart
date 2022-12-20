import 'package:flutter/material.dart';
import 'package:ponto_app/modules/services/locator.dart';

export 'package:flutter/material.dart';

abstract class AppBase<T extends Object> extends StatelessWidget {
  const AppBase({super.key});

  T get controller => getIt.get<T>();

  Widget builder(BuildContext context, ThemeData theme);
}

abstract class ScreenBase<T extends Object> extends AppBase<T> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  ScreenBase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: builder(context, Theme.of(context)),
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
