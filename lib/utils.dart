class WeatherUtils {
  static List<String> getWeatherAssets(String? mainCondition) {
    if (mainCondition == null) {
      return [
        'assets/sunny.json',
        'assets/sunny.jpeg',
      ];
    }

    switch (mainCondition.toLowerCase()) {
      case 'clouds':
        return [
          'assets/cloudy.json',
          'assets/cloudy.jpeg',
        ];
      case 'fog':
        return [
          'assets/cloudy.json',
          'assets/cloudy.jpeg',
        ];
      case 'shower rain':
        return [
          'assets/rainy.json',
          'assets/rainy.jpeg',
        ];
      case 'rain':
        return [
          'assets/rainy.json',
          'assets/rainy.jpeg',
        ];
      case 'thunderstorm':
        return [
          'assets/rainy.json',
          'assets/rainy.jpeg',
        ];
      case 'clear':
        return [
          'assets/sunny.json',
          'assets/sunny.jpeg',
        ];
      default:
        return [
          'assets/sunny.json',
          'assets/sunny.jpeg',
        ];
    }
  }
}
