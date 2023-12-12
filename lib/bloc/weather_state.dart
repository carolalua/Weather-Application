import '../model/model_weather.dart';

abstract class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherSelectedState extends WeatherState {
  final ModelWeather dataWeather;
  WeatherSelectedState(this.dataWeather);
}

class WeatherErrorState extends WeatherState {}
