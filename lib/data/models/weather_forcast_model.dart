import 'package:weather_app/data/models/city_model.dart';
import 'package:weather_app/data/models/forecast_list_item_model.dart';

class ForecastModel {
  final List<ListItemModel> list;
  final CityModel city;
  ForecastModel({
    required this.list,
    required this.city,
  });

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    return ForecastModel(
        list: (json['list'] as List<dynamic>).map((data) {
          return ListItemModel.fromJson(data);
        }).toList(),
        city: CityModel.fromJson(json['city']));
  }
}
