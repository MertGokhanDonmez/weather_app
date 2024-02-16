import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/data/models/current_weather_model.dart';
import 'package:weather_app/data/models/forecast_list_item_model.dart';
import 'package:weather_app/utils.dart';

class MainCard extends StatelessWidget {
  final CurrentWeatherModel weather;
  var isFiltered;

  MainCard({required this.weather, required this.isFiltered});

  @override
  Widget build(BuildContext context) {
    final weatherAssets =
        WeatherUtils.getWeatherAssets(weather.weather[0].main);
    final _isFiltered = isFiltered ?? false;
    return Container(
      child: Column(
        children: [
          Flexible(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _isFiltered ? '' : 'Konumunuz',
                  style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          blurRadius: 2.0,
                          offset: Offset(2.0, 2.0),
                        ),
                      ]),
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    weather.cityName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: _isFiltered ? 50 : 20,
                      color: Color.fromARGB(255, 240, 240, 240),
                      shadows: const [
                        Shadow(
                          color: Colors.black,
                          blurRadius: 2.0,
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 3,
            child: Column(children: [
              Lottie.asset(weatherAssets[0]),
              Text(
                '${weather.main.temperature!.round()}°C',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  color: Color.fromARGB(255, 240, 240, 240),
                  shadows: [
                    Shadow(
                      color: Colors.black, // Choose the color of the shadow
                      blurRadius:
                          2.0, // Adjust the blur radius for the shadow effect
                      offset: Offset(2.0,
                          2.0), // Set the horizontal and vertical offset for the shadow
                    ),
                  ],
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
