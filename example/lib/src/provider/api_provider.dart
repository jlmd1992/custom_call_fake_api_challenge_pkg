import 'package:custom_call_fake_api_challenge/custom_call_fake_api_challenge.dart';
import 'package:flutter/material.dart';

/// The [ApiProvider] class is responsible for managing API requests
/// for products, categories, and users through the [StoreRepository].
/// It extends [ChangeNotifier] to allow UI updates based on state changes,
class ApiProvider extends ChangeNotifier {

  /// An instance of [StoreRepository] used to get data from the API.
  final StoreRepository repository;

  /// Creates an instance of [ApiProvider]
  ApiProvider({
    required this.repository
  });

  /// Stores the API response, either data or an error message.
  String _response = "";
  String get response => _response;

  /// Variable to identify if a request is in progress.
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  /// Get a list of products from the API.
  /// 
  /// Set [_isLoading] to true and notifies listeners to show a loading indicator.
  /// Call [repository.getProducts] and processes the result.
  /// On success, updates [_response] with the list of products.
  /// On error, updates [_response] with an error message.
  Future<void> loadProducts() async {
    _isLoading = true;
    notifyListeners();
    final result = await repository.getProducts();
    result.fold(
      (ApiError error) => _updateResponse(error.toString(), error: true),
      (List<Product> response) => _updateResponse(response.toString())
    );
  }

  /// Get a list of categories from the API.
  /// 
  /// Set [_isLoading] to true and notifies listeners to show a loading indicator.
  /// Call [repository.getCategories] and processes the result.
  /// On success, updates [_response] with the list of categories.
  /// On error, updates [_response] with an error message.
  Future<void> loadCategories() async {
    _isLoading = true;
    notifyListeners();
    final result = await repository.getCategories();
    result.fold(
      (ApiError error) => _updateResponse(error.toString(), error: true),
      (List<Category> response) => _updateResponse(response.toString())
    );
  }

  /// Get a list of users from the API.
  /// 
  /// Set [_isLoading] to true and notifies listeners to show a loading indicator.
  /// Call [repository.getUsers] and processes the result.
  /// On success, updates [_response] with the list of users.
  /// On error, updates [_response] with an error message.
  Future<void> loadUsers() async {
    _isLoading = true;
    notifyListeners();
    final result = await repository.getUsers();
    result.fold(
      (ApiError error) => _updateResponse(error.toString(), error: true),
      (List<User> response) => _updateResponse(response.toString())
    );
  }

  /// Method to update the [_response] and [_isLoading] status.
  /// 
  /// [result] is the message or data to display in the UI.
  /// [error] is a flag that indicates if the response is an error.
  /// If [error] is true, the response will contain an error message.
  void _updateResponse(String result, {bool error = false}) {
    _isLoading = false;
    _response = error ? result : 'Data: ${result.toString()}';
    notifyListeners();
  }

}