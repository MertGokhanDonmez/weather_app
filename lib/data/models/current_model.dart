import 'package:weather_app/data/models/weather_desc_model.dart';

class Current {
  final DateTime dt; // Current time, Unix, UTC
  final DateTime sunrise; // Sunrise time, Unix, UTC
  final DateTime sunset; // Sunset time, Unix, UTC
  final double
      temperature; // Temperature. Units - default: kelvin, metric: Celsius, imperial: Fahrenheit.
  final double
      feelsLike; // emperature. This temperature parameter accounts for the human perception of weather. Units – default: kelvin, metric: Celsius, imperial: Fahrenheit.
  final int pressure; // Atmospheric pressure on the sea level, hPa
  final int humidity; // Humidity, %
  final double
      dewPoint; // Atmospheric temperature (varying according to pressure and humidity) below which water droplets begin to condense and dew can form. Units – default: kelvin, metric: Celsius, imperial: Fahrenheit.
  final int clouds; // Cloudiness, %
  final double uvi; // Current UV index
  final int
      visibility; // Average visibility, metres. The maximum value of the visibility is 10km
  final double
      windSpeed; // Wind speed. Wind speed. Units – default: metre/sec, metric: metre/sec, imperial: miles/hour.
  final double
      windGust; // Wind gust. Units – default: metre/sec, metric: metre/sec, imperial: miles/hour.
  final int windDegree; //  Wind direction, degrees (meteorological)
  final WeatherDesc weatherDescription;

  Current({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.temperature,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.clouds,
    required this.uvi,
    required this.visibility,
    required this.windSpeed,
    required this.windDegree,
    required this.weatherDescription,
    required this.windGust,
  });
}
