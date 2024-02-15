import 'package:weather_app/data/models/current_model.dart';
import 'package:weather_app/data/models/weather_desc_model.dart';

class WeatherModel {
  final double latitude;
  final double longitude;
  final String timezone;
  final int timezoneOffset;
  final Current current;

  //final List<MinuteForecast> minutelyForecast;

  WeatherModel({
    required this.latitude,
    required this.longitude,
    required this.timezone,
    required this.timezoneOffset,
    required this.current,
    //required this.minutelyForecast,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      latitude: json['lat'].toDouble(),
      longitude: json['lon'].toDouble(),
      timezone: json['timezone'],
      timezoneOffset: json['timezone_offset'],
      current: Current.fromJson(json['current']),
    );
  }
}
