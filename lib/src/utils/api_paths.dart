/// [ApiPaths] class where the base path and the used endpoints are defined
/// 
/// the endpoints used are on [Fake API](https://fakestoreapi.com)
class ApiPaths {
  /// Base URL of the Fake Store API.
  static const String baseUrl = 'https://fakestoreapi.com';

  /// Endpoint to get products.
  static const String products = '/products';

  /// Endpoint to get product categories.
  static const String categories = '/products/categories';

  /// Endpoint to get users.
  static const String users = '/users';
}