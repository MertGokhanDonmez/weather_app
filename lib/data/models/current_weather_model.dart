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
      coordinate: CoordinateModel.fromJson(json['coord']),
      weather: (json['weather'] as List<dynamic>).map((data) {
        return WeatherDesc.fromJson(data);
      }).toList(),
      base: json['base'],
      main: MainModel.fromJson(json['main']),
      visibility: json['visibility'],
      wind: WindModel.fromJson(json['wind']),
      clouds: CloudsModel.fromJson(json['clouds']),
      dt: json['dt'],
      sys: SysModel.fromJson(json['sys']),
      cityName: json['name'],
    );
  }
}
