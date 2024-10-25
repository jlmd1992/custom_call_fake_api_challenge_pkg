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
  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    email: json["email"],
    username: json["username"],
    password: json["password"],
    name: Name.fromJson(json["name"]),
    address: Address.fromJson(json["address"]),
    phone: json["phone"],
  );
}
