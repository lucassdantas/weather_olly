import 'package:flutter/material.dart';
import 'package:weather_olly/theme/app_text_styles.dart';
import '../models/user.dart';

class RegisterForm extends StatefulWidget {
  final VoidCallback onBackToLogin;

  const RegisterForm({super.key, required this.onBackToLogin});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _handleRegister() async {
    if (_formKey.currentState!.validate()) {
      final user = User(
        password: _passwordController.text,
        name: _nameController.text,
        email: _emailController.text,
      );
      await user.saveUser();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Account created successfully!")));
      widget.onBackToLogin();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
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
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Create Account", textAlign: TextAlign.center, style: AppTextStyles.title),
              const SizedBox(height: 24),
              TextFormField(
                controller: _nameController,
                validator: (v) => v == null || v.isEmpty ? "Enter your name" : null,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person, color: Color(0xFF1a1541)),
                  labelText: "Name",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                validator: (v) => v == null || v.isEmpty ? "Enter your email" : null,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email, color: Color(0xFF1a1541)),
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                validator: (v) => v == null || v.isEmpty ? "Enter your password" : null,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock, color: Color(0xFF1a1541)),
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: ElevatedButton(
                  onPressed: _handleRegister,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFfede3b),
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ).copyWith(overlayColor: MaterialStateProperty.all(const Color(0xFFef5b5a))),
                  child: const Text("Register", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: widget.onBackToLogin,
                child: const Text("Back to Login", style: TextStyle(color: Color(0xFF1a1541))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
