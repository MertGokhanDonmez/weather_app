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
      child: Lottie.asset(weatherAssets[0]),
    );
  }
}
