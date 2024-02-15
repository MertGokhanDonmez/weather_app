import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/data/models/current_weather_model.dart';
import 'package:weather_app/data/models/forecast_list_item_model.dart';
import 'package:weather_app/utils.dart';

class MainCard extends StatelessWidget {
  final CurrentWeatherModel weather;

  MainCard({required this.weather});

  @override
  Widget build(BuildContext context) {
    final weatherAssets =
        WeatherUtils.getWeatherAssets(weather.weather[0].main);
    return Container(
      child: Column(
        children: [
          Text(
            weather.cityName,
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
          ),
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
        ],
      ),
    );
  }
}
