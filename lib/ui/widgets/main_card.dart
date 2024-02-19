import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/models/current_weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/utils.dart';

class MainCard extends StatefulWidget {
  MainCard({Key? key}) : super(key: key);

  @override
  State<MainCard> createState() => _MainCardState();
}

class _MainCardState extends State<MainCard> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final aspectRatio = screenSize.width / screenSize.height;
    return Consumer<WeatherProvider>(
      builder: (context, value, child) {
        CurrentWeatherModel weather = value.weather!;
        final weatherAssets =
            WeatherUtils.getWeatherAssets(weather.weather[0].main);
        return Column(
          children: [
            // location
            if (!value.isFiltered)
              Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'Konumunuz',
                    style: TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                      fontSize: aspectRatio <= 0.55
                          ? MediaQuery.of(context).size.width * 0.08
                          : MediaQuery.of(context).size.width * 0.07,
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
              ),
            // city name
            Expanded(
              flex: 2,
              child: Text(
                weather.cityName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: aspectRatio <= 0.55
                      ? MediaQuery.of(context).size.width * 0.1
                      : MediaQuery.of(context).size.width * 0.085,
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
            // weather animation
            Expanded(
              flex: 6,
              child: Lottie.asset(weatherAssets[0]),
            ),
            // temperature
            Expanded(
              flex: 2,
              child: Text(
                '${weather.main.temperature!.round()}°C',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: aspectRatio <= 0.55
                      ? MediaQuery.of(context).size.width * 0.12
                      : MediaQuery.of(context).size.width * 0.082,
                  color: Color.fromARGB(255, 240, 240, 240),
                  shadows: const [
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
