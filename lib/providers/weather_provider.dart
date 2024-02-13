import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/data/services/weather_service.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _weather;

  WeatherModel? get weather => _weather;

  Future<void> fetchWeather() async {
    try {
      final weather = await WeatherService().getWeather();
      _weather = weather;
      notifyListeners();
    } catch (error) {
      print('Hava durumu verileri alınamadı: $error');
      _weather = null; // Hata durumunda _weather'ı null olarak ayarla
      notifyListeners();
    }
  }
}
