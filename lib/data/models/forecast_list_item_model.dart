import 'package:weather_app/data/models/clouds_model.dart';
import 'package:weather_app/data/models/coordinate_model.dart';
import 'package:weather_app/data/models/main_model.dart';
import 'package:weather_app/data/models/sys_model.dart';
import 'package:weather_app/data/models/weather_desc_model.dart';
import 'package:weather_app/data/models/wind_model.dart';

class ListItemModel {
  final int dt;
  final MainModel main;
  final List<WeatherDesc> weather;
  final CloudsModel clouds;
  final WindModel wind;
  final int visibility;
  final double pop;
  final SysModel sys;
  final String dateTime;

  ListItemModel({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    required this.sys,
    required this.dateTime,
  });

  factory ListItemModel.fromJson(Map<String, dynamic> json) {
    return ListItemModel(
      dt: json['dt'],
      main: MainModel.fromJson(json['main']),
      weather: (json['weather'] as List<dynamic>).map((data) {
        return WeatherDesc.fromJson(data);
      }).toList(),
      clouds: CloudsModel.fromJson(json['all']),
      wind: WindModel.fromJson(json['wind']),
      visibility: json['visibility'],
      pop: json['pop'].toDouble(),
      sys: SysModel.fromJson(json['sys']),
      dateTime: json['dt_txt'],
    );
  }
}