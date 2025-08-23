import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';

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
      final valid = await User.checkLogin(emailController.text, passwordController.text);
      if (valid) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);
        if (!mounted) return;
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        if (!mounted) return;
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Invalid email or password')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(controller: emailController, decoration: const InputDecoration(labelText: 'Email')),
        TextField(
          controller: passwordController,
          decoration: const InputDecoration(labelText: 'Password'),
          obscureText: true,
        ),
        const SizedBox(height: 20),
        ElevatedButton(onPressed: _login, child: const Text('Login')),
        TextButton(onPressed: widget.onCreateAccount, child: const Text('Create Account')),
      ],
    );
  }
}
