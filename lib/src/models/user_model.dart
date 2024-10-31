import 'address_model.dart';
import 'name_model.dart';

/// Model for representing a user from Fake Store API.
class User {
  final int id;
  final String email;
  final String username;
  final String password;
  final Name name;
  final Address address;
  final String phone;

  User({
    required this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.name,
    required this.address,
    required this.phone,
  });

  /// Creates an instance of [User] from a JSON map.
  factory User.fromJson(Map<String, dynamic> json) {
    // Validation for id
    if (json['id'] == null || json['id'] is! int) {
      throw const FormatException('The id is invalid.');
    }

    // Validation for email
    if (json['email'] == null || json['email'] is! String || json['email'].isEmpty) {
      throw const FormatException('The email is invalid.');
    }

    // Validation for username
    if (json['username'] == null || json['username'].isEmpty) {
      throw const FormatException('The username is invalid.');
    }

    // Validation for password
    if (json['password'] == null || json['password'].isEmpty) {
      throw const FormatException('The password is invalid');
    }

    // Validation for name
    if (json['name'] == null) {
      throw const FormatException('The name is invalid');
    }

    // Validation for address
    if (json['address'] == null) {
      throw const FormatException('The address is invalid');
    }

    // Validation for phone
    if (json['phone'] == null || json['phone'].isEmpty) {
      throw const FormatException('The phone is invalid');
    }

    return User(
      id: json["id"],
      email: json["email"],
      username: json["username"],
      password: json["password"],
      name: Name.fromJson(json["name"]),
      address: Address.fromJson(json["address"]),
      phone: json["phone"],
    );
  }

  /// Returns a string representation of the [User] object.
  @override
  String toString() {
    return 'User(id: $id, email: $email, name: $name, address: $address)';
  }
}
