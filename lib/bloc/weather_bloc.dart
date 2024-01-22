import '../bloc/weather_event.dart';
import '../bloc/weather_state.dart';
import '../http/get_weather.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/model_weather.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitialState()) {
    on<WeatherSelectedCityEvent>((event, emit) async {
      emit(WeatherLoadingState());
      try {
        ModelWeather dataWeather =
            await GetWeather().getDataWeather(event.cityName);
        emit(WeatherSelectedState(dataWeather));
      } on Exception {
        emit(WeatherErrorState());
      }
    });
  }
}
