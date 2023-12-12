abstract class WeatherEvent {}

class WeatherSelectedCityEvent extends WeatherEvent {
  String cityName;
  WeatherSelectedCityEvent(this.cityName);
}
