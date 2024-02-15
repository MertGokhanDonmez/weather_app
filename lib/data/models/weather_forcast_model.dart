import 'package:weather_app/data/models/city_model.dart';
import 'package:weather_app/data/models/clouds_model.dart';
import 'package:weather_app/data/models/forecast_list_item_model.dart';
import 'package:weather_app/data/models/main_model.dart';
import 'package:weather_app/data/models/weather_desc_model.dart';

class ForecastModel {
  final ListItemModel list;
  final CityModel city;
  ForecastModel({
    required this.list,
    required this.city,
  });

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    return ForecastModel(
        list: ListItemModel.fromJson(json['list']),
        city: CityModel.fromJson(json['city']));
  }
}