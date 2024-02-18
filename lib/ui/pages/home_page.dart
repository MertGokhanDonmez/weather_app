import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:weather_app/data/models/current_weather_model.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/models/weather_forcast_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/ui/widgets/forecast_card.dart';
import 'package:weather_app/ui/widgets/main_card.dart';
import 'package:weather_app/ui/widgets/mini_card.dart';
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
              return CircularProgressIndicator();
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
                    children: [
                      // input area
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              border: Border.all(color: Colors.amber, width: 1),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                flex: 3,
                                child: TextField(
                                  style: const TextStyle(color: Colors.white),
                                  controller: cityController,
                                  decoration: const InputDecoration(
                                    hintStyle: TextStyle(color: Colors.white),
                                    fillColor: Colors.white,
                                    hintText: 'ülke veya şehir',
                                    icon: Icon(
                                      Icons.search,
                                      color: Colors.white,
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors
                                              .transparent), // Altındaki çizgiyi kaldırır
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors
                                              .transparent), // Altındaki çizgiyi kaldırır
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Flexible(
                                flex: 1,
                                child: ElevatedButton(
                                  style: ButtonStyle(),
                                  onPressed: () {
                                    weatherInfo
                                        .fetchWeather(
                                      selectedCity: cityController.text != ""
                                          ? cityController.text
                                          : null,
                                    )
                                        .then((val) {
                                      if (value.errorMessage.isNotEmpty) {
                                        showDialog(
                                          context: context,
                                          builder: (_) {
                                            return AlertDialog(
                                              title: const Text('Hata'),
                                              content: Text(value.errorMessage),
                                              actions: [
                                                ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              Colors.red),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                    weatherInfo
                                                        .setErrorMessage('');
                                                  },
                                                  child: const Text(
                                                    'Geri Dön',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                        cityController.text = '';
                                      }
                                      if (cityController.text != "") {
                                        weatherInfo.setFilterStatus(true);
                                      } else if (value.errorMessage.isEmpty) {
                                        weatherInfo.setFilterStatus(false);
                                      }
                                    });
                                  },
                                  child: const Text(
                                    'Ara',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // main area
                      Expanded(
                        flex: 3,
                        child: MainCard(),
                      ),
                      // mini cards area
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              // top
                              Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: MiniCard(
                                        FlutterIcons.human_greeting_mco,
                                        'Hissedilen',
                                        '${weather.main.feelsLike!.round().toString()}°C',
                                      ),
                                    ),
                                    Expanded(
                                      child: MiniCard(
                                        FlutterIcons.wi_thermometer_wea,
                                        'En Yüksek',
                                        '${weather.main.maxTemp!.round().toString()}°C',
                                      ),
                                    ),
                                    Expanded(
                                      child: MiniCard(
                                        FlutterIcons
                                            .wi_thermometer_exterior_wea,
                                        'En Düşük',
                                        '${weather.main.minTemp!.round().toString()}°C',
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              // bottom
                              Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: MiniCard(
                                          FlutterIcons.wi_humidity_wea,
                                          'Nem',
                                          '${weather.main.humidity.toString()} %'),
                                    ),
                                    Expanded(
                                      child: MiniCard(
                                          FlutterIcons.wi_strong_wind_wea,
                                          'Rüzgar',
                                          '${weather.wind.speed.toString()} km/s'),
                                    ),
                                    Expanded(
                                      child: MiniCard(
                                          FlutterIcons.wi_barometer_wea,
                                          'Basınç',
                                          '${weather.main.pressure.toString()} MB'),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // forecast area
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            color: Theme.of(context).colorScheme.primary,
                            child: Row(
                              children:
                                  forecastWeather.list.take(6).map((forecast) {
                                return Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ForecastCard(forecast: forecast),
                                  ),
                                );
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
