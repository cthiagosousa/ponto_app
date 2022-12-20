import 'package:ponto_app/modules/user/model.dart';
import 'package:ponto_app/modules/user/repository.dart';
import 'package:ponto_app/modules/utils/exceptions.dart';
import 'package:ponto_app/modules/utils/logger.dart';

class UserController {
  final IUserRepository repository;

  UserController(this.repository);

  User? user;

  Future<void> login({
    required String email,
    required String password}) async {
    try {
      final user = await repository.login(email: email, password: password);
      if(user != null) {
        this.user = user;
        logMsg("User ${user.name} is logged");
      }
    } on AppException catch (error, exception) {
      logMsg("Error on login", error, exception);
    } catch (error, exception) {
      logMsg("Error on login", error, exception);
    }
  }

  Future<void> register({
    required String displayName,
    required String email,
    required String password}) async {
    try {
      await repository.register(
        displayName: displayName, 
        email: email, 
        password: password,
      );
    } on AppException catch (error, exception) {
      logMsg("Error on register user", error, exception);
    } catch (error, exception) {
      logMsg("Error on register user", error, exception);
    }
  }

  Future logout() async {
    try {
      user = null;
    } catch (error) {
      rethrow;
    }
  }
}