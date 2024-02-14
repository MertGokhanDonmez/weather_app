import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../configs/config.dart';
import '../models/weather_model.dart';

class WeatherService {
  static final WeatherService _instance = WeatherService._privateConstructor();

  factory WeatherService() {
    return _instance;
  }

  WeatherService._privateConstructor();

  Future<dynamic> getWeather() async {
    try {
      var response = await http.get(Uri.parse(
          '$API_ENDPOINT?lat=33.44&lon=-94.04&exclude=hourly,daily&appid=$OPENAPIWEATHER_API_KEY'));
      if (response.statusCode == 200) {
        final weatherData = json.decode(response.body);
        final weatherModel = WeatherModel.fromJson(weatherData);
        print(weatherModel);
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
