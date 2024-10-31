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
    try {
      final Either<ApiError, List<dynamic>> result = await apiService.fetchProducts();
      return result.fold(
        (ApiError error) => Left<ApiError, List<Product>>(error),
        (List<dynamic> products) {
          final List<Product> productsModel = products.map((product) => Product.fromJson(product)).toList();
          return Right<ApiError, List<Product>>(productsModel);
        },
      );
    } catch (e) {
      return Left(ApiError('Error parsing products data: ${e.toString()}'));
    }    
  }

  /// Gets a list of categories from the Fake Store API.
  /// 
  /// returns an [Either] which can be a [ApiError] on error or a list of [Category].
  Future<Either<ApiError, List<Category>>> getCategories() async {
    try {
      final result = await apiService.fetchCategories();
      return result.fold(
        (ApiError error) => Left<ApiError, List<Category>>(error), 
        (List<dynamic> categories) {
          final List<Category> categoryModel = categories.map((category) => Category.fromJson(category)).toList();
          return Right<ApiError, List<Category>>(categoryModel);
        }
      );
    } catch (e) {
      return Left(ApiError('Error parsing categories data: ${e.toString()}'));
    }    
  }

  /// Gets a list of users from the Fake Store API.
  /// 
  /// returns an [Either] which can be a [ApiError] on error or a list of [User].
  Future<Either<ApiError, List<User>>> getUsers() async {
    try {
      final result = await apiService.fetchUsers();
      return result.fold(
        (ApiError error) => Left<ApiError, List<User>>(error),
        (List<dynamic> users) {
          final List<User> usersModel = users.map((user) => User.fromJson(user)).toList();
          return Right<ApiError, List<User>>(usersModel);
        },
      );
    } catch (e) {
      return Left(ApiError('Error parsing users data: ${e.toString()}'));
    }    
  }
}
