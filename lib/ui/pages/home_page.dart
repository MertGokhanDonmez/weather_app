import 'package:flutter/material.dart';
import 'package:weather_app/data/models/current_weather_model.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/models/weather_forcast_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/ui/widgets/forecast_card.dart';
import 'package:weather_app/ui/widgets/main_card.dart';
import 'package:weather_app/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final weatherInfo = context.read<WeatherProvider>();
    weatherInfo.fetchWeather();

    return Scaffold(
      body: Center(
        child: Consumer<WeatherProvider>(
          builder: (context, value, child) {
            if (value.weather == null || value.forecastData == null) {
              // Veri bekleniyor ise gösterilecek widget
              if (value.errorMessage.isNotEmpty) {
                // Hata durumunda uyarı göster
                return Text(value.errorMessage);
              } else {
                return CircularProgressIndicator();
              }
            } else {
              // Veriler varsa normal görüntüleme
              CurrentWeatherModel weather = value.weather!;
              ForecastModel forecastWeather = value.forecastData!;
              final weatherImage =
                  WeatherUtils.getWeatherAssets(weather.weather[0].main)[1];
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(weatherImage),
                    fit: BoxFit
                        .cover, // Resmin boyutunu sayfa boyutuna göre ayarlar
                  ),
                ),
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              controller: cityController,
                              decoration: const InputDecoration(
                                  hintText: 'Şehir Adı',
                                  icon: Icon(Icons.search)),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              weatherInfo.fetchWeather(
                                selectedCity: cityController.text != ""
                                    ? cityController.text
                                    : null,
                              );
                            },
                            child: Text('Ara'),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Center(
                          child: MainCard(
                            weather: weather,
                            isFiltered: cityController.text != '',
                          ),
                        ),
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
                                  forecastWeather.list.take(6).map((forecast) {
                                return ForecastCard(forecast: forecast);
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
