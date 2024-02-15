import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/data/models/current_weather_model.dart';
import 'package:weather_app/data/models/weather_forcast_model.dart';

import '../../configs/config.dart';
import '../models/old/weather_model.dart';

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

  Future<dynamic> getWeeklyWeatherForcast(String city, String unit) async {
    try {
      var response = await http.get(Uri.parse(
          '$API_ENDPOINT/forecast?q=$city&units=$unit&appid=$OPENAPIWEATHER_API_KEY'));
      if (response.statusCode == 200) {
        final weatherData = json.decode(response.body);
        final weatherModel = ForecastModel.fromJson(weatherData);
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

  Future<String> getCurrentCity() async {
    // kullanici izni
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    // konum bilgisi
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    // cevir
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    // sehir adini al
    String? city = placemarks[0].locality;

    return city ?? "";
  }
}
