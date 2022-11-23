import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';

Future<String> getPrefs(String key) async {
  final prefs = EncryptedSharedPreferences();
  return await prefs.getString(key);
}

Future<bool> savePrefs(String key, String value) async {
  final prefs = EncryptedSharedPreferences();
  return await prefs.setString(key, value);
}

Future<bool> deletePrefs(String key) async {
  final prefs = EncryptedSharedPreferences();
  return await prefs.remove(key);
}
