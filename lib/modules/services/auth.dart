import 'package:firebase_auth/firebase_auth.dart';
import 'package:ponto_app/modules/services/firebase.dart';
import 'package:ponto_app/modules/utils/exceptions.dart';
import 'package:ponto_app/modules/utils/logger.dart';

abstract class IFirebaseAuthService {
  Future<User?> login({required String email, required String password});
  Future<User?> register({
    required String displayName, 
    required String email, 
    required String password, 
    String? photoUrl});
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
    } on FirebaseAuthException catch (error) {
      throw decodeException(error);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<User?> register({
    required String displayName,
    required String email, 
    required String password,
    String? photoUrl,
  }) async {
    try {
      final credential = await auth.createUserWithEmailAndPassword(email: email, password: password);
      if(credential.user != null) {
        await Future.wait([
          credential.user!.updateDisplayName(displayName),
          credential.user!.updatePhotoURL(photoUrl),
        ]);
      }
      return credential.user;
    } on FirebaseAuthException catch (error) {
      throw decodeException(error);
    } catch (error) {
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
