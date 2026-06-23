import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  late final SharedPreferences prefs;
  static final LocalStorage _instance = LocalStorage._internal();

  // Storage keys
  static const String _userEmailKey = 'user_email';
  static const String _isLoggedInKey = 'is_logged_in';
  static const String _userIdKey = 'user_id';

  LocalStorage._internal();

  factory LocalStorage() {
    return _instance;
  }

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  // Session management
  Future<void> saveSession({
    required String email,
    required String userId,
  }) async {
    await prefs.setString(_userEmailKey, email);
    await prefs.setString(_userIdKey, userId);
    await prefs.setBool(_isLoggedInKey, true);
  }

  Future<Map<String, String>?> getSession() async {
    final isLoggedIn = prefs.getBool(_isLoggedInKey) ?? false;
    if (!isLoggedIn) return null;

    final email = prefs.getString(_userEmailKey);
    final userId = prefs.getString(_userIdKey);

    if (email != null && userId != null) {
      return {'email': email, 'userId': userId};
    }
    return null;
  }

  Future<void> clearSession() async {
    await prefs.remove(_userEmailKey);
    await prefs.remove(_userIdKey);
    await prefs.setBool(_isLoggedInKey, false);
  }

  bool isSessionActive() {
    return prefs.getBool(_isLoggedInKey) ?? false;
  }
}
