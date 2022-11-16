import 'package:ponto_app/modules/user/model.dart';
import 'package:ponto_app/modules/user/repository.dart';

class UserController {
  final IUserRepository repository;

  UserController(this.repository);

  Future<User?> details(int id) async {
    try {
      final user = await repository.get(id);
      return user;
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<User?> register(User data) async {
    try {
      final user = await repository.create(data);
      return user;
    } catch (error) {
      throw Exception(error);
    }
  }
}