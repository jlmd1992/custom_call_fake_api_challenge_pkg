# Custom Call Fake API Package

This package allows queries to the Fake Store API to retrieve data such as products, categories and users. It provides a centralised service for handling HTTP requests, error handling via the `dartz` library, and immutable data models.

## Features

- Fake Store API consumption for products, categories and users.
- Error handling using `Either` from the `dartz` library.
- Immutable data models.
- Example of use in a Flutter application.

## Instalación

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
  final apiService = ApiService();

  // Get products
  final products = await apiService.fetchProducts();
  products.fold(
    (error) => print('Error: ${error.message}'),
    (products) => print('Products: $products'),
  );
}
```

# Available Methods

- fetchProducts(): Get a list of products from the API.
- fetchCategories(): Get a list of product categories.
- fetchUsers(): Get list of users.

Each of these methods returns an Either that contains the data or an error, which makes error handling easier.

# Running the Example

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