import 'geolocation_model.dart';

/// Model for representing a address from User model.
class Address {
  final String city;
  final String street;
  final int number;
  final String zipcode;
  final Geolocation geolocation;

  Address({
    required this.city,
    required this.street,
    required this.number,
    required this.zipcode,
    required this.geolocation,
  });

  /// Creates an instance of [Address] from a JSON map.
  factory Address.fromJson(Map<String, dynamic> json) => Address(
    city: json["city"],
    street: json["street"],
    number: json["number"],
    zipcode: json["zipcode"],
    geolocation: Geolocation.fromJson(json["geolocation"]),
  );
}