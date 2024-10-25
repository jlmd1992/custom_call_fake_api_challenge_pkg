/// Model for representing a category from Fake Store API.
class Category {
  final String name;

  const Category({
    required this.name
  });

  /// Creates an instance of [Category] from a JSON map.
  factory Category.fromJson(String json) {
    return Category(name: json);
  }
}
