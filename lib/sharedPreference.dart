import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static const String keyIsLoggedIn = "is_logged_in";
  static const String keyUserName = "user_name";
  static const String keyUserEmail = "user_email";
  static const String keyUserPassword = "user_password";

  // ✅ Save user details (Signup)
  static Future<void> setUserDetails(String name, String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyUserName, name);
    await prefs.setString(keyUserEmail, email);
    await prefs.setString(keyUserPassword, password);
  }

  // ✅ Get user details
  static Future<Map<String, String?>> getUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return {
      "name": prefs.getString(keyUserName),
      "email": prefs.getString(keyUserEmail),
      "password": prefs.getString(keyUserPassword),
    };
  }

  // ✅ Save login status
  static Future<void> setLoggedIn(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(keyIsLoggedIn, value);
  }

  // ✅ Get login status
  static Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(keyIsLoggedIn) ?? false;
  }

  // ✅ Logout method (Clear all data)
  static Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
