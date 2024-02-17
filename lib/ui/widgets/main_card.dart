import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/models/current_weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/utils.dart';

class MainCard extends StatefulWidget {
  final bool isFiltered;

  MainCard({required this.isFiltered});

  @override
  State<MainCard> createState() => _MainCardState();
}

class _MainCardState extends State<MainCard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, value, child) {
        CurrentWeatherModel weather = value.weather!;
        final weatherAssets =
            WeatherUtils.getWeatherAssets(weather.weather[0].main);
        final _isFiltered = widget.isFiltered;
        return Column(
          children: [
            // location
            if (!_isFiltered)
              const Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'Konumunuz',
                    style: TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          blurRadius: 2.0,
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            // city name
            Expanded(
              flex: 2,
              child: Text(
                weather.cityName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  color: Color.fromARGB(255, 240, 240, 240),
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      blurRadius: 2.0,
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
              ),
            ),
            // weather animation
            Expanded(
              flex: 7,
              child: Lottie.asset(weatherAssets[0]),
            ),
            // temperature
            Expanded(
              flex: 2,
              child: Text(
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
              ),
            ),
          ],
        );
      },
    );
  }
}
