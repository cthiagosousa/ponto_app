import 'package:firebase_core/firebase_core.dart';
import 'package:ponto_app/firebase_options.dart';
import 'package:ponto_app/modules/utils/logger.dart';

class FirebaseService {
  late final FirebaseApp app;
  
  Future<FirebaseService> onInit() async {
    try {
      app = await Firebase.initializeApp(
        name: "DEFAULT",
        options: DefaultFirebaseOptions.currentPlatform,
      );
      if(_hasApp()) {
        logMsg("Firebase App ${_appName()} has created!");
      }
      return this;
    } on FirebaseException catch (error, exception) {
      logMsg(error.toString(), error, exception);
      rethrow;
    } catch (error, exception) {
      logMsg("Error on init firebase", error, exception);
      rethrow;
    }
  }

  bool _hasApp() {
    return Firebase.apps.isNotEmpty;
  }

  String _appName() {
    return Firebase.app().name;
  }
}