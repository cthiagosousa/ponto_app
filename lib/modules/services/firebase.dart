import 'package:firebase_core/firebase_core.dart';
import 'package:ponto_app/firebase_options.dart';
import 'package:ponto_app/modules/utils/logger.dart';

class FirebaseService {
  static Future<void> init() async {
    try {
      await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    } catch (error, exception) {
      logMsg("Error on init firebase", error, exception);
    }
  }
}