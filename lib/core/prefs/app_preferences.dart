import 'package:shared_preferences/shared_preferences.dart';

class AppPreference {
  // ==========================
  // 🔑 KEYS
  // ==========================
  static const String _keyUserToken = 'user_token';
  static const String keyUserName = 'user_name';
  static const String keyUserEmail = 'user_email';
  static const String keyUserPhone = 'user_phone';
  static const String keyUserRole = 'user_role';
  static const String keyAppTheme = 'app_theme';
  static const String keyAppLang = 'app_lang';

  // ==========================
  // 🧠 SINGLETON INSTANCE
  // ==========================
  static late SharedPreferences _prefs;

  /// Must be called once before using any getter/setter.
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // ==========================
  // 🔐 USER TOKEN
  // ==========================
  static Future<void> setUserToken(String? token) async {
    if (token != null) {
      await _prefs.setString(_keyUserToken, token);
    }
  }

  static String? getUserToken() => _prefs.getString(_keyUserToken);

  static Future<void> clearUserToken() async {
    await _prefs.remove(_keyUserToken);
  }

  // ==========================
  // 👤 USER NAME
  // ==========================
  static Future<void> setUserName(String? name) async {
    if (name != null) {
      await _prefs.setString(keyUserName, name);
    }
  }

  static String? getUserName() => _prefs.getString(keyUserName);

  // ==========================
  // 📞 USER PHONE
  // ==========================
  static Future<void> setUserPhone(String? phone) async {
    if (phone != null) {
      await _prefs.setString(keyUserPhone, phone);
    }
  }

  static String? getUserPhone() => _prefs.getString(keyUserPhone);

  // ==========================
  // 🧩 USER ROLE
  // ==========================
  static Future<void> setUserRole(String? role) async {
    if (role != null) {
      await _prefs.setString(keyUserRole, role);
    }
  }

  static String? getUserRole() => _prefs.getString(keyUserRole);

  // ==========================
  // ✉️ USER EMAIL
  // ==========================
  static Future<void> setUserEmail(String? email) async {
    if (email != null) {
      await _prefs.setString(keyUserEmail, email);
    }
  }

  static String? getUserEmail() => _prefs.getString(keyUserEmail);

  static Future<void> clearUserEmail() async {
    await _prefs.remove(keyUserEmail);
  }

  // ==========================
  // 🌐 APP LANGUAGE
  // ==========================
  static Future<void> setAppLang(String? lang) async {
    if (lang != null) {
      await _prefs.setString(keyAppLang, lang);
    }
  }

  static String? getAppLang() {
    final lang = _prefs.getString(keyAppLang);
    return lang;
  }

  // ==========================
  // 🎨 APP THEME
  // ==========================
  static Future<void> setAppTheme(String theme) async {
    await _prefs.setString(keyAppTheme, theme);
  }

  static String? getAppTheme() => _prefs.getString(keyAppTheme);

  // ==========================
  // 🧹 CLEAR USER DATA
  // ==========================
  static Future<void> clearUserData() async {
    await _prefs.remove(_keyUserToken);
    await _prefs.remove(keyUserName);
    await _prefs.remove(keyUserPhone);
    await _prefs.remove(keyUserRole);
    await _prefs.remove(keyUserEmail);
  }
}
