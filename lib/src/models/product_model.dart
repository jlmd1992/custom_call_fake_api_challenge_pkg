/// Model for representing a product from Fake Store API.
class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final String image;
  final String category;

  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.category,
  });

  /// Creates an instance of [Product] from a JSON map.
  factory Product.fromJson(Map<String, dynamic> json) {
    // Validation for id
    if (json['id'] == null || json['id'] is! int) {
      throw const FormatException('The id is invalid.');
    }

    // Validation for title
    if (json['title'] == null || json['title'] is! String || json['title'].isEmpty) {
      throw const FormatException('The title is invalid.');
    }

    // Validation for description
    if (json['description'] == null || json['description'] is! String) {
      throw const FormatException('The description is invalid.');
    }

    // Validation for price
    if (json['price'] == null || json['price'] is! num) {
      throw const FormatException('The price is invalid');
    }

    // Validation for iamge
    if (json['image'] == null) {
      throw const FormatException('The image is required');
    }

    // Validation for category
    if (json['category'] == null || json['description'] is! String) {
      throw const FormatException('The categoty is invalid');
    }
    
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      image: json['image'] ?? '',
      category: json['category'],
    );
  }

  /// Returns a string representation of the [Product] object.
  @override
  String toString() {
    return 'Product(id: $id, title: $title, price: $price, category: $category)';
  }
}
