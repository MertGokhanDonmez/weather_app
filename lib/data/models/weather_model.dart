class WeatherModel {
  final double latitude;
  final double longitude;
  final String timezone;
  final int timezoneOffset;

  final DateTime currentDateTime;
  final DateTime sunrise;
  final DateTime sunset;
  final double temperature;
  final double feelsLike;
  final int pressure;
  final int humidity;
  final double dewPoint;
  final double uvi;
  final int clouds;
  final int visibility;
  final double windSpeed;
  final int windDegree;
  final String weatherDescription;

  final List<MinuteForecast> minutelyForecast;

  WeatherModel({
    required this.latitude,
    required this.longitude,
    required this.timezone,
    required this.timezoneOffset,
    required this.currentDateTime,
    required this.sunrise,
    required this.sunset,
    required this.temperature,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.uvi,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.windDegree,
    required this.weatherDescription,
    required this.minutelyForecast,
  });
}

class MinuteForecast {
  final DateTime dateTime;
  final double precipitation;

  MinuteForecast({
    required this.dateTime,
    required this.precipitation,
  });
}
