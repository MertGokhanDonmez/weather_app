import 'package:flutter/material.dart';
import 'package:weather_app/data/models/current_weather_model.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/models/forecast_list_item_model.dart';
import 'package:weather_app/data/models/weather_forcast_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/ui/widgets/MainCard.dart';
import 'package:weather_app/ui/widgets/WeatherIcon.dart';
import 'package:weather_app/utils.dart';

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
      body: Center(
        child: Consumer<WeatherProvider>(
          builder: (context, weatherProvider, child) {
            // print("weather -> ${weatherProvider.weather}");
            if (weatherProvider.weather == null ||
                weatherProvider.forecastData == null) {
              // Veri bekleniyor ise gösterilecek widget
              return CircularProgressIndicator();
            } else {
              CurrentWeatherModel weather = weatherProvider.weather!;
              ForecastModel forecastWeather = weatherProvider.forecastData!;
              final weatherImage =
                  WeatherUtils.getWeatherAssets(weather.weather[0].main)[1];
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:
                        AssetImage(weatherImage), // Resminizin yolunu belirtin
                    fit: BoxFit
                        .cover, // Resmin boyutunu sayfa boyutuna göre ayarlar
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MainCard(
                      weather: weather,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 110, 110, 110),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children:
                                forecastWeather.list.take(4).map((forecast) {
                              return ForecastCard(forecast: forecast);
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class ForecastCard extends StatelessWidget {
  final ListItemModel forecast;

  ForecastCard({required this.forecast});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 20.0,
          width: 90,
          child: Center(child: Text('${forecast.dateTime}')),
        ),
        Container(
          height: 60.0,
          width: 80,
          child: Center(
              child: Image.network(
            'http://openweathermap.org/img/w/${forecast.weather[0].icon}.png',
          )),
        ),
        Container(
          height: 20.0,
          width: 80,
          child: Center(child: Text('${forecast.main.temperature}°C')),
        ),
      ],
    );
  }
}
