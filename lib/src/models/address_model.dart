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
  factory Address.fromJson(Map<String, dynamic> json) {
    // Validation for city
    if (json['city'] == null || json['city'] is! String || json['city'].isEmpty) {
      throw const FormatException('The city is invalid.');
    }

    // Validation for street
    if (json['street'] == null || json['street'].isEmpty) {
      throw const FormatException('The street is invalid.');
    }

    // Validation for number
    if (json['number'] == null || json['number'] is! int) {
      throw const FormatException('The number is invalid.');
    }

    // Validation for zipcode
    if (json['zipcode'] == null || json['zipcode'] is! String) {
      throw const FormatException('The zipcode is invalid.');
    }

    // Validation for geolocation
    if (json['geolocation'] == null) {
      throw const FormatException('The geolocation is invalid.');
    }

    return Address(
      city: json["city"],
      street: json["street"],
      number: json["number"],
      zipcode: json["zipcode"],
      geolocation: Geolocation.fromJson(json["geolocation"]),
    );
  }

  /// Returns a string representation of the [Address] object.
  @override
  String toString() {
    return 'Address(city: $city, street: $street, number: $number, geolocation: $geolocation)';
  }
}