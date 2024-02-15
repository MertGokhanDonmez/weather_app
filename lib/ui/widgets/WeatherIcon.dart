import 'package:flutter/material.dart';

class WeatherIcon extends StatelessWidget {
  final String weatherConditionCode;

  WeatherIcon({required this.weatherConditionCode});

  IconData getWeatherIcon() {
    switch (weatherConditionCode) {
      case '01d':
        return Icons.wb_sunny; // Güneşli
      case '02d':
        return Icons.cloud; // Parçalı bulutlu
      case '03d':
        return Icons.cloud_queue; // Bulutlu
      case '04d':
        return Icons.cloud_off; // Çok bulutlu
      case '09d':
        return Icons.beach_access; // Yağmurlu
      case '10d':
        return Icons.beach_access; // Yağmurlu
      case '11d':
        return Icons.flash_on; // Fırtınalı
      case '13d':
        return Icons.ac_unit; // Karlı
      case '50d':
        return Icons.filter_drama; // Sisli
      default:
        return Icons.error_outline; // Bilinmeyen durum için varsayılan ikon
    }
  }

  @override
  Widget build(BuildContext context) {
    return Icon(
      getWeatherIcon(),
      size: 48.0,
    );
  }
}
