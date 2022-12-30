import 'package:ponto_app/modules/user/model.dart';
import 'package:ponto_app/modules/user/repository.dart';
import 'package:ponto_app/modules/utils/exceptions.dart';
import 'package:ponto_app/modules/utils/logger.dart';

class UserController {
  final IUserRepository _repository;

  UserController(this._repository);

  User? user;

  Future<void> login({
    required String email,
    required String password}) async {
    try {
      final user = await _repository.login(email: email, password: password);
      if(user != null) {
        this.user = user;
      }
    } on AppException catch (error, exception) {
      logMsg("Error on login", error, exception);
      rethrow;
    } catch (error, exception) {
      logMsg("Error on login", error, exception);
      rethrow;
    }
  }

  Future<void> register({
    required String displayName,
    required String email,
    required String password}) async {
    try {
      await _repository.register(
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
      await _repository.logout();
    } catch (error) {
      rethrow;
    }
  }
}