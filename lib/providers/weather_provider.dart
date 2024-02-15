import 'package:flutter/material.dart';
import 'package:weather_app/data/models/current_weather_model.dart';
import 'package:weather_app/data/models/old/weather_model.dart';
import 'package:weather_app/data/models/weather_forcast_model.dart';
import 'package:weather_app/data/services/weather_service.dart';

class WeatherProvider extends ChangeNotifier {
  CurrentWeatherModel? _weather;
  ForecastModel? _forecastData;

  CurrentWeatherModel? get weather => _weather;
  ForecastModel? get forecastData => _forecastData;

  Future<void> fetchWeather() async {
    String? cityName = await WeatherService().getCurrentCity();
    try {
      final weatherData = await WeatherService().getWeather(cityName, 'metric');
      _weather = weatherData;

      final forecastData =
          await WeatherService().getWeeklyWeatherForcast(cityName, 'metric');
      _forecastData = forecastData;

      notifyListeners(); // degiskenleri dinleyen herkese degisiklikleri haber veriyor
    } catch (error) {
      print('Hava durumu verileri alınamadı: $error');
      _weather = null; // Hata durumunda _weather'ı null olarak ayarla
      notifyListeners();
    }
  }
}
