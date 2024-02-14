import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/data/models/current_weather_model.dart';

import '../../configs/config.dart';
import '../models/weather_model.dart';

class WeatherService {
  static final WeatherService _instance = WeatherService._privateConstructor();

  factory WeatherService() {
    return _instance;
  }

  WeatherService._privateConstructor();

  Future<dynamic> getWeather(String city, String unit, {int? dtime}) async {
    try {
      var response = await http.get(Uri.parse(
          '$API_ENDPOINT/weather?q=$city&dt=${dtime ?? ''}&units=$unit&appid=$OPENAPIWEATHER_API_KEY'));
      if (response.statusCode == 200) {
        final weatherData = json.decode(response.body);
        final weatherModel = CurrentWeatherModel.fromJson(weatherData);

        return weatherModel;
      } else {
        print('API çağrısı başarısız: ${response.body}');
        throw Exception('Hava durumu verileri alınamadı');
      }
    } catch (error) {
      print('Hava durumu verileri alınamadı: $error');
      throw error;
    }
  }

  Future<dynamic> getWeeklyWeatherForcast(
      double latitude, double longitude) async {
    try {
      var response = await http.get(Uri.parse(
          '$API_ENDPOINT/forecast?lat=$latitude&lon=$longitude&appid=$OPENAPIWEATHER_API_KEY'));
      if (response.statusCode == 200) {
        final weatherData = json.decode(response.body);
        final weatherModel = WeatherModel.fromJson(weatherData);
        return weatherModel;
      } else {
        print('API çağrısı başarısız: ${response.statusCode}');
        throw Exception('Hava durumu verileri alınamadı');
      }
    } catch (error) {
      print('Hava durumu verileri alınamadı: $error');
      throw error;
    }
  }
}
