import 'package:flutter/material.dart';
import 'package:weather_olly/screens/home_screen.dart';
import 'package:weather_olly/screens/login_screen.dart';
import 'package:weather_olly/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      theme: AppTheme.theme,
      routes: {'/login': (context) => LoginScreen(), '/home': (context) => HomeScreen()},
    );
  }
}
