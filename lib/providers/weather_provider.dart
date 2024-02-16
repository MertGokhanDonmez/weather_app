import 'package:flutter/material.dart';
import 'package:weather_app/data/models/current_weather_model.dart';
import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/data/models/weather_forcast_model.dart';
import 'package:weather_app/data/services/weather_service.dart';

class WeatherProvider extends ChangeNotifier {
  CurrentWeatherModel? _weather;
  ForecastModel? _forecastData;

  CurrentWeatherModel? get weather => _weather;
  ForecastModel? get forecastData => _forecastData;

  Future<void> fetchWeather({selectedCity}) async {
    String? cityName = await WeatherService().getCurrentCity();
    try {
      final weatherData =
          await WeatherService().getWeather(selectedCity ?? cityName, 'metric');
      _weather = weatherData;

      final forecastData = await WeatherService()
          .getWeeklyWeatherForcast(selectedCity ?? cityName, 'metric');
      _forecastData = forecastData;

      notifyListeners(); // degiskenleri dinleyen herkese degisiklikleri haber veriyor
    } catch (error) {
      print('Hava durumu verileri alınamadı: $error');
      _weather = null; // Hata durumunda _weather'ı null olarak ayarla
      notifyListeners();
    }
  }

  void setSelectedCity(String newCity) {
    // Seçilen şehir bilgisini güncelle
    var _selectedCity = newCity;

    // WeatherService sınıfını kullanarak hava durumu ve tahmin verilerini güncelle
    fetchWeather(selectedCity: newCity);
  }
}
