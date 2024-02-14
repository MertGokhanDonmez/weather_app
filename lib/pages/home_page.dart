import 'package:flutter/material.dart';
import 'package:weather_app/data/models/current_weather_model.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final weatherInfo = context.read<WeatherProvider>();
    weatherInfo.fetchWeather();

    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Center(
        child: Consumer<WeatherProvider>(
          builder: (context, weatherProvider, child) {
            // print("weather -> ${weatherProvider.weather}");
            if (weatherProvider.weather == null) {
              // Veri bekleniyor ise gösterilecek widget
              return CircularProgressIndicator();
            } else {
              CurrentWeatherModel weather = weatherProvider.weather!;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                        ),
                        child: SizedBox(
                          width: 300,
                          height: 100,
                          child: Center(
                              child: Text(
                                  'Sıcaklık: ${weather.main.temperature}')),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                        ),
                        child: SizedBox(
                          width: 300,
                          height: 100,
                          child: Center(
                              child: Text(
                                  'Hissedilen Sıcaklık: ${weather.main.feelsLike}')),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        elevation: 0,
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        child: SizedBox(
                          width: 300,
                          height: 100,
                          child: Center(
                              child: Text(
                                  'Hissedilen Sıcaklık: ${weather.main.feelsLike}')),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
