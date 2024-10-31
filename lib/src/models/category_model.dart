/// Model for representing a category from Fake Store API.
class Category {
  final String name;

  const Category({
    required this.name
  });

  /// Creates an instance of [Category] from a JSON map.
  factory Category.fromJson(String json) {
    if (json.isEmpty) {
      throw const FormatException('The category is invalid.');
    }
    return Category(name: json);
  }

  /// Returns a string representation of the [Category] object.
  @override
  String toString() {
    return 'Category(name: $name)';
  }
}
