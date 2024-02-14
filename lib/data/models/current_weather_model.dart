import 'package:weather_app/data/models/clouds_model.dart';
import 'package:weather_app/data/models/coordinate_model.dart';
import 'package:weather_app/data/models/main_model.dart';
import 'package:weather_app/data/models/sys_model.dart';
import 'package:weather_app/data/models/weather_desc_model.dart';
import 'package:weather_app/data/models/wind_model.dart';

class CurrentWeatherModel {
  final CoordinateModel coordinate;
  final List<WeatherDesc> weather;
  final String base;
  final MainModel main;
  final int visibility;
  final WindModel wind;
  final CloudsModel clouds;
  final int dt;
  final SysModel sys;
  final String cityName;

  CurrentWeatherModel({
    required this.coordinate,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.cityName,
  });

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherModel(
      coordinate:
          CoordinateModel(longitude: json['lon'], latitude: json['lat']),
      weather: (json['weather'] as List<dynamic>).map((data) {
        return WeatherDesc(
          id: data["id"],
          main: data["main"],
          description: data["description"],
          icon: data["icon"],
        );
      }).toList(),
      base: json['base'],
      main: MainModel(
        temperature: json['temp'],
        feelsLike: json['feels_like'],
        minTemp: json['temp_min'],
        maxTemp: json['temp_max'],
        pressure: json['pressure'],
        humidity: json['humidity'],
      ),
      visibility: json['visibility'],
      wind: WindModel(
        speed: json['speed'],
        degrees: json['deg'],
      ),
      clouds: CloudsModel(all: json['all']),
      dt: json['dt'],
      sys: SysModel(
        type: json['type'],
        id: json['id'],
        country: json['country'],
        sunrise: json['sunrise'],
        sunset: json['sunset'],
      ),
      cityName: json['name'],
    );
  }
}
