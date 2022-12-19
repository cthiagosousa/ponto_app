// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';

import 'package:ponto_app/modules/services/firebase.dart';
import 'package:ponto_app/modules/utils/logger.dart';

abstract class IFirebaseAuthService {
  Future<User?> login({required String email, required String password});
  Future<User?> register({required String email, required String password});
  Future<void> logout();
}

class FirebaseAuthService implements IFirebaseAuthService {
  final FirebaseService firebase;
  late final FirebaseAuth auth;

  FirebaseAuthService(this.firebase);

  FirebaseAuthService onInit() {
    auth = FirebaseAuth.instanceFor(app: firebase.app);
    return this;
  }

  @override
  Future<User?> login({required String email, required String password}) async {
    try {
      final credential = await auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } catch (error, exception) {
      logMsg("Error on login", error, exception);
      rethrow;
    }
  }

  @override
  Future<User?> register({required String email, required String password}) async {
    try {
      final credential = await auth.createUserWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } catch (error, exception) {
      logMsg("Error on register", error, exception);
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    try {
      await auth.signOut();
    } catch (error, exception) {
      logMsg("Error on logout", error, exception);
    }
  }
}
