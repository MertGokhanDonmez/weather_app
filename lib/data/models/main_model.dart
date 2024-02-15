class MainModel {
  final double? temperature;
  final double? feelsLike;
  final double? minTemp;
  final double? maxTemp;
  final int? pressure;
  final int? humidity;

  MainModel({
    this.temperature,
    this.feelsLike,
    this.minTemp,
    this.maxTemp,
    this.pressure,
    this.humidity,
  });
  factory MainModel.fromJson(Map<String, dynamic> json) {
    return MainModel(
      temperature: json['temp']?.toDouble(),
      feelsLike: json['feels_like']?.toDouble(),
      minTemp: json['temp_min']?.toDouble(),
      maxTemp: json['temp_max']?.toDouble(),
      pressure: json['pressure'],
      humidity: json['humidity'],
    );
  }
}
