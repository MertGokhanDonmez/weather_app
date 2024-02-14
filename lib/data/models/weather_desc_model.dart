class WeatherDesc {
  final int id;
  final String main;
  final String description;
  final String icon;

  WeatherDesc({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherDesc.fromJson(Map<String, dynamic> json) {
    return WeatherDesc(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }
}
