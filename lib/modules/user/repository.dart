import 'package:ponto_app/modules/interfaces/http_service.dart';
import 'package:ponto_app/modules/services/shared_preferences.dart';
import 'package:ponto_app/modules/user/model.dart';
import 'package:ponto_app/modules/utils/logger.dart';

abstract class IUserRepository {
  Future<User> get(int id);
  Future<User> create(User data);
  Future<User> update(User data);
  Future<User> delete(int id);
  Future<User> getInPrefs();
  Future<bool> saveInPrefs(User data);
  Future<bool> deleteInPrefs();
}

class UserRepositoryImp implements IUserRepository {
  final HttpService client;

  UserRepositoryImp(this.client);

  @override
  Future<User> get(int id) async {
    try {
      final response = await client.get({"path": "/user/$id"});
      if(response.success) {
        final data = User.fromMap(response.data);
        return data;
      } else {
        return Future.error(response.errorMessage!);
      }
    } catch (error, exception) {
      errorMsg("GET User Method Error", error, exception);
      rethrow;
    }
  }

  @override
  Future<User> create(User data) async {
    try {
      final response = await client.post({"path": "/user", "data": data.toMap()});
      if(response.success) {
        final data = User.fromMap(response.data);
        return data;
      } else {
        return Future.error(response.errorMessage!);
      }
    } catch (error, exception) {
      errorMsg("CREATE User Method Error", error, exception);
      rethrow;
    }
  }

  @override
  Future<User> update(User data) {
    throw UnimplementedError();
  }
  
  @override
  Future<User> delete(int id) {
    throw UnimplementedError();
  }
  
  @override
  Future<User> getInPrefs() async {
    try {
      final prefs = await getPrefs("user");
      return User.fromJson(prefs);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<bool> saveInPrefs(User data) async {
    try {
      return await savePrefs("user", data.toJson());
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<bool> deleteInPrefs() async {
    try {
      return await deletePrefs("user");
    } catch (error) {
      rethrow;
    }
  }
}
