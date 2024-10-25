import 'package:dartz/dartz.dart';
import '../models/user_model.dart';
import '../models/product_model.dart';
import '../models/category_model.dart';
import '../services/fake_api_service.dart';
import '../utils/api_error.dart';

/// Repository to consume Fake Store API data.
/// 
/// **StoreRepository** is a class that acts as an intermediary between the *ApiService*
/// and the application. Its purpose is to make requests to get data from the
/// API Fake Store and convert the responses into domain objects such as *Product*, *Category* and *User*.
///
/// This class facilitates the consumption of the API in an organised and structured way,
/// delegating to *ApiService* the networking tasks and mapping the received data to specific models.
class StoreRepository {
  final ApiService apiService;

  /// Constructor that receives an instance of [ApiService].
  StoreRepository(this.apiService);

  /// Gets a list of products from the Fake Store API.
  /// 
  /// returns an [Either] which can be a [ApiError] on error or a list of [Product].
  Future<Either<ApiError, List<Product>>> getProducts() async {
    final result = await apiService.fetchProducts();
    return result.map((data) => data.map((product) => Product.fromJson(product)).toList());
  }

  /// Gets a list of categories from the Fake Store API.
  /// 
  /// returns an [Either] which can be a [ApiError] on error or a list of [Category].
  Future<Either<ApiError, List<Category>>> getCategories() async {
    final result = await apiService.fetchCategories();
    return result.map((data) => data.map((category) => Category.fromJson(category)).toList());
  }

  /// Gets a list of users from the Fake Store API.
  /// 
  /// returns an [Either] which can be a [ApiError] on error or a list of [User].
  Future<Either<ApiError, List<User>>> getUsers() async {
    final result = await apiService.fetchUsers();
    return result.map((data) => data.map((user) => User.fromJson(user)).toList());
  }
}
