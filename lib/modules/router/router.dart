import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ponto_app/modules/home/presentation.dart';
import 'package:ponto_app/modules/home/screen.dart';

RouterConfig<Object> router() {
  return GoRouter(
    routes: _generateRoutes(),
  );
}

List<RouteBase> _generateRoutes() {
  return <RouteBase>[
    GoRoute(path: "/", name: "Home", builder: (context, state) => HomeScreen(HomePresentation()),
    ),
  ];
}
