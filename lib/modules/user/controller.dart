import 'package:ponto_app/modules/user/model.dart';
import 'package:ponto_app/modules/user/repository.dart';
import 'package:ponto_app/modules/utils/logger.dart';

class UserController {
  final IUserRepository repository;

  UserController(this.repository);

  User? user;

  Future login({
    required String email,
    required String password,
  }) async {
    try {
      final user = await repository.login(email: email, password: password);
      this.user = user;
      if(user != null) {
        logMsg("User ${user.name} is logged");
      }
    } catch (error) {
      rethrow;
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