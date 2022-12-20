import 'package:ponto_app/modules/services/auth.dart';
import 'package:ponto_app/modules/user/model.dart';
import 'package:ponto_app/modules/utils/exceptions.dart';

abstract class IUserRepository {
  Future<User?> login({required String email, required String password});
  Future<User?> register({
    required String email, 
    required String password,
    required String displayName});
  Future<void> logout();
}

class UserRepositoryImp implements IUserRepository {
  final IFirebaseAuthService auth;

  UserRepositoryImp(this.auth);
  
  @override
  Future<User> login({required String email, required String password}) async {
    try {
      final user = await auth.login(email: email, password: password);

      if(user == null) {
        throw NoDataException();
      }

      return User(
        id: user.uid,
        email: user.email,
        name: user.displayName,
      );
    } catch (error) {
      rethrow;
    }
  }
  
  @override
  Future<User> register({
    required String email, 
    required String password,
    required String displayName}) async {
    try {
      final user = await auth.register(
        displayName: displayName, 
        email: email, 
        password: password,
      );

      if(user == null) {
        throw NoDataException();
      }

      return User(
        id: user.uid,
        email: user.email,
        name: user.displayName,
      );
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
