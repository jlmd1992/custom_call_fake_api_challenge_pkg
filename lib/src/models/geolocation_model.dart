/// Model for representing a geolocation from Address model.
class Geolocation {
  final String lat;
  final String long;

  Geolocation({
    required this.lat,
    required this.long,
  });

  /// Creates an instance of [Geolocation] from a JSON map.
  factory Geolocation.fromJson(Map<String, dynamic> json) => Geolocation(
    lat: json["lat"],
    long: json["long"],
  );
}