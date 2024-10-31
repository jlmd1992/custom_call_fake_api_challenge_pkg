# Custom Call Fake API Package

This package allows queries to the Fake Store API to retrieve data such as products, categories and users. It provides a centralised service for handling HTTP requests, error handling via the `dartz` library, and immutable data models.

## Features

- Fake Store API consumption for products, categories and users.
- Error handling using `Either` from the `dartz` library.
- Immutable data models.
- Example of use in a Flutter application.

## Installation

To use this package in your Flutter project, add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  custom_call_fake_api_challenge:
    git:
      url: https://github.com/jlmd1992/custom_call_fake_api_challenge_pkg.git
      ref: master
```

## Usage

This package provides an ApiService class with methods to consume different endpoints of the Fake Store API.

- Initialise ApiService and consume products

```dart
import 'package:custom_call_fake_api_challenge/custom_call_fake_api_challenge.dart';

void main() async {
  final repository = StoreRepository();

  final products = await repository.getProducts();
  products.fold(
    (error) => print('Error: ${error.message}'),
    (products) => print('Products: $products'),
  );
}
```

## Available Methods

- fetchProducts(): Get a list of products from the API.
- fetchCategories(): Get a list of product categories.
- fetchUsers(): Get list of users.

Each of these methods returns an Either that contains the data or an error, which makes error handling easier.

## Error Handling

Each API request returns a result of type `Either<ApiError, List<T>>`, where:

- On success, a list of objects (Product, Category, or User) is returned.
- On error, an ApiError object containing an error message is returned.

## Error Types

| Status Code      | Error Scenario                  | Description                                                                 |
|------------------|---------------------------------|-----------------------------------------------------------------------------|
| 400              | Bad request                     | Occurs when the submitted request has invalid parameters or is incorrectly. |
| 404              | Not Found                       | Indicates that the requested resource does not exist.                       |
| 500              | Internal Server Error           | Occurs when there is a problem in the API server.                           |
| Timeout/Network  | Network error or timeout        | Indicates connectivity problems or that the API did not respond in time.    |

## Return data types

- Success: `List<Product>`, `List<Category>`, or `List<User>`, depending on the endpoint.
- Error: `ApiError` with the properties:
  - `code`: The HTTP code associated with the error.
  - `message`: Descriptive message of the error.

## Error Handling Example

Each API result is handled using Either, which allows developers to handle success and error cases efficiently.

Example of error handling for products:

```dart
void getProductsWithErrorHandling() async {
  final result = await repository.getProducts();

  result.fold(
    (error) {
      switch (error.code) {
        case 400:
          print('Bad request: ${error.message}');
          break;
        case 404:
          print('Not found: ${error.message}');
          break;
        case 500:
          print('Internal error: ${error.message}');
          break;
        default:
          print('Unknown error: ${error.message}');
      }
    },
    (products) {
      products.forEach((product) => print('Product: ${product.title} - ${product.price}'));
    },
  );
}
```

This example is similar for `Categories` and `Users`, to capture the errors.

## Running the Example

This package includes a complete example in the example/ directory that shows how to consume endpoints and handle responses.

To run the example:

- Navigate to example directory:

```bash
cd example
```

- Install dependencies:

```bash
flutter pub get
```

- Run the sample application:

```bash
flutter run
```