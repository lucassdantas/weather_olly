import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/weather_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double? temperatureC;
  double? temperatureF;
  String? description;
  String? icon;
  String? location;
  String? country;
  bool loading = true;
  String? error;

  bool showCelsius = true;
  String? userName;

  final weatherService = WeatherService();

  @override
  void initState() {
    super.initState();
    _checkLogin();
    _loadWeather();
  }

  Future<void> _checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final logged = prefs.getBool('isLoggedIn') ?? false;
    if (!logged) {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, '/login');
    } else {
      setState(() => userName = prefs.getString('name') ?? '');
    }
  }

  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, '/login');
  }

  Future<void> _loadWeather() async {
    try {
      final data = await weatherService.fetchWeather();
      setState(() {
        temperatureC = data['temperature_celsius'];
        temperatureF = data['temperature_fahrenheit'];
        description = data['description'];
        icon = data['icon'];
        location = data['location'];
        country = data['country'];
        loading = false;
      });
    } catch (e) {
      setState(() {
        error = e.toString();
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome ${userName ?? ''}'),
        actions: [
          TextButton(
            onPressed: () => setState(() => showCelsius = !showCelsius),
            child: Text(
              showCelsius ? '°C' : '°F',
              style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          IconButton(onPressed: _logout, icon: const Icon(Icons.logout)),
        ],
      ),
      body: Center(
        child:
            loading
                ? const CircularProgressIndicator()
                : error != null
                ? Text(error!)
                : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (icon != null) Image.network('https:$icon', width: 80, height: 80),
                    const SizedBox(height: 16),
                    Text(
                      showCelsius
                          ? '${temperatureC?.toStringAsFixed(1)}°C'
                          : '${temperatureF?.toStringAsFixed(1)}°F',
                      style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(description ?? '', style: const TextStyle(fontSize: 24)),
                    const SizedBox(height: 16),
                    Text('${location ?? ''}, ${country ?? ''}', style: const TextStyle(fontSize: 18)),
                  ],
                ),
      ),
    );
  }
}
