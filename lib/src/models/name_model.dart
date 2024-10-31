/// Model for representing a name from User model.
class Name {
  final String firstname;
  final String lastname;

  Name({
    required this.firstname,
    required this.lastname,
  });

  /// Creates an instance of [Name] from a JSON map.
  factory Name.fromJson(Map<String, dynamic> json) {
    // Validation for firstname
    if (json['firstname'] == null || json['firstname'] is! String) {
      throw const FormatException('The firstname is invalid.');
    }

    // Validation for lastname
    if (json['lastname'] == null || json['lastname'] is! String) {
      throw const FormatException('The lastname is invalid.');
    }

    return Name(
      firstname: json["firstname"],
      lastname: json["lastname"],
    );
  }

  /// Returns a string representation of the [Name] object.
  @override
  String toString() {
    return 'Name(firstname: $firstname, lastname: $lastname)';
  }
}