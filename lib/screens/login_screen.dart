import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_olly/components/login_form.dart';
import 'package:weather_olly/components/register_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showRegister = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("lib/imgs/olly_logo.svg", height: 120),
                const SizedBox(height: 40),
                showRegister
                    ? RegisterForm(onBackToLogin: () => setState(() => showRegister = false))
                    : LoginForm(onCreateAccount: () => setState(() => showRegister = true)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
