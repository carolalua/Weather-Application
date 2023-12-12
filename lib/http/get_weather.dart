import 'dart:convert';

import 'package:weather_application/model/model_weather.dart';
import 'package:http/http.dart' as http;

Future<ModelWeather> getDataWeather(String cityName) async {
  final response = await http.get(Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=96696e8f8beb68eb42455d7d2d25974b'));
  if (response.statusCode == 200) {
    return ModelWeather.fromJson(jsonDecode(response.body));
  } else {
    throw Exception();
  }
}
