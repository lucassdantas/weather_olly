import 'package:shared_preferences/shared_preferences.dart';

class User {
  final String login;
  final String password;
  final String? name;
  final String? email;

  User({required this.login, required this.password, this.name, this.email});

  Future<void> saveUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('login', login);
    await prefs.setString('password', password);
    if (name != null) await prefs.setString('name', name!);
    if (email != null) await prefs.setString('email', email!);
  }

  static Future<bool> checkLogin(String login, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final savedLogin = prefs.getString('login');
    final savedPassword = prefs.getString('password');
    return savedLogin == login && savedPassword == password;
  }
}
