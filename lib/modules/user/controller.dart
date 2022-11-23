import 'package:get/get.dart';
import 'package:ponto_app/modules/user/mock.dart';
import 'package:ponto_app/modules/user/model.dart';
import 'package:ponto_app/modules/user/repository.dart';

class UserController extends GetxController {
  final IUserRepository repository;

  UserController(this.repository);

  User? user;

  Future login({
    required String email,
    required String password,
  }) async {
    try {
      final user = UserMock.generateUser();
      this.user = user;
      await repository.saveInPrefs(user);
    } catch (error) {
      rethrow;
    }
  }

  Future logout() async {
    try {
      user = null;
      await repository.deleteInPrefs();
    } catch (error) {
      rethrow;
    }
  }

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