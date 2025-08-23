import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  final VoidCallback onCreateAccount;
  const LoginForm({super.key, required this.onCreateAccount});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> _login() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("userName", emailController.text);

      if (!mounted) return;
      Navigator.pushReplacementNamed(context, "/home");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(controller: emailController, decoration: const InputDecoration(labelText: "Email")),
        TextField(
          controller: passwordController,
          decoration: const InputDecoration(labelText: "Password"),
          obscureText: true,
        ),
        const SizedBox(height: 20),
        ElevatedButton(onPressed: _login, child: const Text("Login")),
        TextButton(onPressed: widget.onCreateAccount, child: const Text("Create Account")),
      ],
    );
  }
}
