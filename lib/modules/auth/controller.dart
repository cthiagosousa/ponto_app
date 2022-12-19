import 'package:flutter/material.dart';
import 'package:ponto_app/modules/services/locator.dart';
import 'package:ponto_app/modules/user/controller.dart';

class AuthController {
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> auth() async {
    try {
      await getIt.get<UserController>().login(
        email: emailController.text, 
        password: passwordController.text,
      );
    } catch (error, exception) {
      rethrow;
    }
  }
}