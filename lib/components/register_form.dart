import 'package:flutter/material.dart';
import 'package:weather_olly/theme/app_text_styles.dart';

class RegisterForm extends StatefulWidget {
  final VoidCallback onBackToLogin;

  const RegisterForm({super.key, required this.onBackToLogin});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

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
              Text("Create Account", textAlign: TextAlign.center, style: AppTextStyles.title),
              const SizedBox(height: 24),
              TextFormField(
                decoration: const InputDecoration(labelText: "Username", border: OutlineInputBorder()),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: "Login", border: OutlineInputBorder()),
              ),
              const SizedBox(height: 16),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(labelText: "Password", border: OutlineInputBorder()),
              ),
              const SizedBox(height: 24),
              ElevatedButton(onPressed: () {}, child: const Text("Register")),
              const SizedBox(height: 16),
              TextButton(onPressed: widget.onBackToLogin, child: const Text("Back to Login")),
            ],
          ),
        ),
      ),
    );
  }
}
