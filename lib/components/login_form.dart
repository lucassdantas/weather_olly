import 'package:flutter/material.dart';
import 'package:weather_olly/theme/app_text_styles.dart';
import '../models/user.dart';

class LoginForm extends StatefulWidget {
  final VoidCallback onCreateAccount;

  const LoginForm({super.key, required this.onCreateAccount});

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  void _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      final success = await User.checkLogin(_loginController.text, _passwordController.text);
      if (success) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Login or password are not correctly")));
      }
    }
  }

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Welcome", textAlign: TextAlign.center, style: AppTextStyles.title),
              const SizedBox(height: 24),
              TextFormField(
                controller: _loginController,
                validator: (value) => value == null || value.isEmpty ? 'Please, insert your login' : null,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person, color: Color(0xFF1a1541)),
                  labelText: 'Login',
                  labelStyle: TextStyle(color: Color(0xFF1a1541)),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                validator: (value) => value == null || value.isEmpty ? 'Please, insert your password' : null,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock, color: Color(0xFF1a1541)),
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Color(0xFF1a1541)),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: ElevatedButton(
                  onPressed: _handleLogin,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFfede3b),
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ).copyWith(overlayColor: MaterialStateProperty.all(const Color(0xFFef5b5a))),
                  child: const Text('Login', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: widget.onCreateAccount,
                child: const Text(
                  "Create account",
                  style: TextStyle(color: Color(0xFF1a1541), decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
