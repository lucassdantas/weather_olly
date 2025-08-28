import 'package:shared_preferences/shared_preferences.dart';

class User {
  final String password;
  final String name;
  final String email;

  User({required this.password, required this.name, required this.email});

  Future<void> saveUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('password', password);
    await prefs.setString('name', name);
    await prefs.setString('email', email);
  }

  static Future<bool> checkLogin(String login, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final savedLogin = prefs.getString('email');
    final savedPassword = prefs.getString('password');
    return savedLogin == login && savedPassword == password;
  }
}
