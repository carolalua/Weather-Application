import 'package:flutter/material.dart';
import 'package:weather_application/model/model_weather.dart';

class WeatherData extends StatelessWidget {
  final ModelWeather cityData;
  const WeatherData({super.key, required this.cityData});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.lightBlue,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(cityData.name,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text('${cityData.weatherTemp.toStringAsFixed(2)} °C',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(cityData.weatherDescription,
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                )),
          ),
        ],
      ),
    );
  }
}
