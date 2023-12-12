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
  late TextEditingController cityNameController;

  @override
  void initState() {
    super.initState();
    cityNameController = TextEditingController();
  }

  @override
  void dispose() {
    cityNameController.dispose();
    super.dispose();
  }

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
              controller: cityNameController,
              decoration: const InputDecoration(
                labelText: 'Search for a city',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ElevatedButton(
                onPressed: () {
                  BlocProvider.of<WeatherBloc>(context)
                      .add(WeatherSelectedCityEvent(cityNameController.text));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue.shade200,
                  minimumSize: const Size(100, 50),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                  ),
                ),
                child: const Text("Search",
                    style: TextStyle(color: Colors.black, fontSize: 20))),
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
