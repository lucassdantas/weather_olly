import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  final String apiKey = "e9eec485995141de81b82802252308";

  Future<Map<String, dynamic>> fetchWeather() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception("Localization service unavailable");
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception("Localization permission unauthorized");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception("Location permission unauthorized permanently");
    }

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    final url =
        "http://api.weatherapi.com/v1/current.json?q=${position.latitude},${position.longitude}&key=$apiKey";

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return {
        "temperature_celsius": data['current']['temp_c'],
        "temperature_fahrenheit": data['current']['temp_f'],
        "description": data['current']['condition']['text'],
        "icon": data['current']['condition']['icon'],
        "location": data['location']['name'],
        "country": data['location']['country'],
      };
    } else {
      throw Exception("Error on load the weather");
    }
  }
}
