class ModelWeather {
  String name;
  String weatherDescription;
  double weatherTemp;

  ModelWeather(
      {required this.name,
      required this.weatherDescription,
      required this.weatherTemp});

  factory ModelWeather.fromJson(json) => ModelWeather(
      name: json["name"],
      weatherDescription: json["weather"][0]["description"],
      weatherTemp: json["main"]["temp"] - 273.15);
}
