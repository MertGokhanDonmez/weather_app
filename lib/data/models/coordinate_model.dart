class CoordinateModel {
  final double longitude;
  final double latitude;

  CoordinateModel({
    required this.longitude,
    required this.latitude,
  });

  factory CoordinateModel.fromJson(Map<String, dynamic> json) {
    return CoordinateModel(
        longitude: json['lon'].toDouble(), latitude: json['lat'].toDouble());
  }
}
