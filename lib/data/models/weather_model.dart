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
      latitude: json['lat'],
      longitude: json['lon'],
      timezone: json['timezone'],
      timezoneOffset: json['timezone_offset'],
      current: Current(
        dt: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
        sunrise: DateTime.fromMillisecondsSinceEpoch(json['sunrise'] * 1000),
        sunset: DateTime.fromMillisecondsSinceEpoch(json['sunset'] * 1000),
        temperature: json['temperature'],
        feelsLike: json['feels_like'],
        pressure: json['pressure'],
        humidity: json['humidity'],
        dewPoint: json['dew_point'],
        uvi: json['uvi'],
        clouds: json['clouds'],
        visibility: json['visibility'],
        windSpeed: json['wind_speed'],
        windDegree: json['wind_deg'],
        windGust: json['wind_gust'],
        weatherDescription: WeatherDesc(
          id: json["id"],
          main: json["main"],
          description: json["description"],
          icon: json["icon"],
        ),
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
