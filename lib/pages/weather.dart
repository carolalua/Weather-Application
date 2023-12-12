import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/bloc/weather_event.dart';
import 'package:weather_application/pages/weather_error.dart';

import '../bloc/weather_bloc.dart';
import '../bloc/weather_state.dart';
import 'weather_data.dart';

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _Weather();
}

class _Weather extends State<Weather> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Weather Application"),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: TextField(
              onSubmitted: (cityName) {
                BlocProvider.of<WeatherBloc>(context)
                    .add(WeatherSelectedCityEvent(cityName));
              },
              decoration: const InputDecoration(
                labelText: 'Search for a city',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
            if (state is WeatherInitialState) {
              return Container();
            } else if (state is WeatherLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is WeatherSelectedState) {
              return WeatherData(cityData: state.dataWeather);
            } else {
              return const WeatherError();
            }
          }),
        ],
      ),
    );
  }
}
