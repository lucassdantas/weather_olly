class User {
  final String login;
  final String password;

  User({required this.login, required this.password});

  bool loginProcess() {
    if (login == "admin" && password == "123") {
      return true;
    }
    return false;
  }
}
