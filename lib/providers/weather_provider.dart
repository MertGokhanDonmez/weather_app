import 'package:flutter/material.dart';
import 'package:weather_app/data/models/current_weather_model.dart';
import 'package:weather_app/data/models/weather_forcast_model.dart';
import 'package:weather_app/data/services/weather_service.dart';

class WeatherProvider extends ChangeNotifier {
  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  CurrentWeatherModel? _weather;
  ForecastModel? _forecastData;
  String? _timeZone;

  bool _isFiltered = false;
  bool get isFiltered => _isFiltered;

  CurrentWeatherModel? get weather => _weather;
  ForecastModel? get forecastData => _forecastData;
  String? get timeZone => _timeZone;

  Future<void> fetchWeather({String? selectedCity}) async {
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
      setErrorMessage('${error}');
      notifyListeners();
    }
  }

  void setSelectedCity(String newCity) {
    // WeatherService sınıfını kullanarak hava durumu ve tahmin verilerini güncelle
    fetchWeather(selectedCity: newCity);
  }

  void setErrorMessage(String message) {
    _errorMessage = message;
    notifyListeners();
  }

  void setFilterStatus(bool status) {
    _isFiltered = status;
    notifyListeners();
  }

  // void _getTimeZone(String countryCode) async {
  //   _timeZone = await WeatherService().getTimeZone(countryCode);
  //   print(_timeZone);
  //   notifyListeners();
  // }
}
