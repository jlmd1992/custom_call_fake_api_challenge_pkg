import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import '../utils/api_error.dart';
import '../utils/api_paths.dart';

/// [ApiService] is responsible for making HTTP requests to the Fake Store API.
///
/// This class provides methods for fetching products, categories, and users
/// from the API, handling common network errors and HTTP responses.
class ApiService {

  /// Gets the list of products from API.
  ///
  /// Endpoint: `/products`.
  /// 
  /// Returns an `Either<ApiError, List<dynamic>>`:
  /// On success, returns the list of products in JSON format.
  /// On error, returns an [ApiError] with the error message.
  Future<Either<ApiError, List<dynamic>>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse('${ApiPaths.baseUrl}${ApiPaths.products}'));
      if (response.statusCode == 200) {
        return Right(json.decode(response.body));
      } else {
        return Left(handleHttpError(response.statusCode));
      }
    } catch (e) {
      return Left(ApiError('Network error: ${e.toString()}'));
    }
  }

  /// Gets the list of categories from the API.
  ///
  /// Endpoint: `/products/categories`.
  /// 
  /// Returns an `Either<ApiError, List<dynamic>>`:
  /// On success, returns the list of categories in JSON format.
  /// On error, returns an [ApiError] with the error message.
  Future<Either<ApiError, List<dynamic>>> fetchCategories() async {
    try {
      final response = await http.get(Uri.parse('${ApiPaths.baseUrl}${ApiPaths.categories}'));
      if (response.statusCode == 200) {
        return Right(json.decode(response.body));
      } else {
        return Left(handleHttpError(response.statusCode));
      }
    } catch (e) {
      return Left(ApiError('Network error: ${e.toString()}'));
    }
  }

  /// Gets the list of users from the API.
  ///
  /// Endpoint: `/users`.
  /// 
  /// Returns an `Either<ApiError, List<dynamic>>`:
  /// On success, returns the list of users in JSON format.
  /// On error, returns an [ApiError] with the error message.
  Future<Either<ApiError, List<dynamic>>> fetchUsers() async {
    try {
      final response = await http.get(Uri.parse('${ApiPaths.baseUrl}${ApiPaths.users}'));
      if (response.statusCode == 200) {
        return Right(json.decode(response.body));
      } else {
        return Left(handleHttpError(response.statusCode));
      }
    } catch (e) {
      return Left(ApiError(e.toString()));
    }
  }
}
