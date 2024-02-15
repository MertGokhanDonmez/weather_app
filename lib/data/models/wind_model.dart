class WindModel {
  final double speed;
  final int degrees;

  WindModel({
    required this.speed,
    required this.degrees,
  });

  factory WindModel.fromJson(Map<String, dynamic> json) {
    return WindModel(
      speed: json['speed'].toDouble(),
      degrees: json['deg'],
    );
  }
}
