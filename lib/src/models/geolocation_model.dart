/// Model for representing a geolocation from Address model.
class Geolocation {
  final String lat;
  final String long;

  Geolocation({
    required this.lat,
    required this.long,
  });

  /// Creates an instance of [Geolocation] from a JSON map.
  factory Geolocation.fromJson(Map<String, dynamic> json) {
    // Validation for lat
    if (json['lat'] == null || json['lat'] is! String) {
      throw const FormatException('The lat is invalid');
    }

    // Validation for long
    if (json['long'] == null || json['long'] is! String) {
      throw const FormatException('The long is invalid');
    }

    return Geolocation(
      lat: json["lat"],
      long: json["long"],
    );
  }

  /// Returns a string representation of the [Geolocation] object.
  @override
  String toString() {
    return 'Geolocation(lat: $lat, long: $long)';
  }
}