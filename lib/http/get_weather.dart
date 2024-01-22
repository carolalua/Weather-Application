import 'dart:convert';

import 'package:weather_application/model/model_weather.dart';
import 'package:http/http.dart' as http;

class GetWeather {
  Future<ModelWeather> getDataWeather(String cityName) async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=e45b840b2cd2cd326f753c597b3a1637'));
    if (response.statusCode == 200) {
      return ModelWeather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception();
    }
  }
}
