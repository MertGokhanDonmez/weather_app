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
      current: Current(
        dt: DateTime.fromMillisecondsSinceEpoch(json['current']['dt'] * 1000),
        sunrise: DateTime.fromMillisecondsSinceEpoch(
            json['current']['sunrise'] * 1000),
        sunset: DateTime.fromMillisecondsSinceEpoch(
            json['current']['sunset'] * 1000),
        temperature: json['current']['temp']
            .toDouble(), // converted to double because if the data comes as an integer
        feelsLike: json['current']['feels_like'].toDouble(),
        pressure: json['current']['pressure'],
        humidity: json['current']['humidity'],
        dewPoint: json['current']['dew_point'].toDouble(),
        uvi: json['current']['uvi'].toDouble(),
        clouds: json['current']['clouds'],
        visibility: json['current']['visibility'],
        windSpeed: json['current']['wind_speed'].toDouble(),
        windDegree: json['current']['wind_deg'],
        weatherDescription:
            (json['current']['weather'] as List<dynamic>).map((data) {
          return WeatherDesc(
            id: data["id"],
            main: data["main"],
            description: data["description"],
            icon: data["icon"],
          );
        }).toList(),
      ),
      // minutelyForecast:
      //     (json['minutely_forecast'] as List<dynamic>).map((minute) {
      //   return MinuteForecast(
      //     dateTime: DateTime.fromMillisecondsSinceEpoch(minute['dt'] * 1000),
      //     precipitation: minute['precipitation'],
      //   );
      // }).toList(),
    );
  }
}

class MinuteForecast {
  final DateTime dateTime;
  final double precipitation;

  MinuteForecast({
    required this.dateTime,
    required this.precipitation,
  });
}
