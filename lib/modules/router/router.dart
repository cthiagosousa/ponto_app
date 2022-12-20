import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ponto_app/modules/auth/screen.dart';
import 'package:ponto_app/modules/home/screen.dart';
import 'package:ponto_app/modules/router/routes.dart';

RouterConfig<Object> router() {
  return GoRouter(
    routes: _generateRoutes(),
  );
}

List<RouteBase> _generateRoutes() {
  return <RouteBase>[
    GoRoute(path: Routes.sHome, name: "Home", builder: (context, state) => HomeScreen()),
    GoRoute(path: Routes.sAuth, name: "Auth", builder: (context, state) => AuthScreen()),
  ];
}
