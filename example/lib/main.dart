import 'package:custom_call_fake_api_challenge/custom_call_fake_api_challenge.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  final ApiService apiService = ApiService();
  String _response = "";

  /// function to get product list
  void _getProducts() async {
    final result = await apiService.fetchProducts();
    setState(() {
      result.fold(
        (error) => _response = 'Error: ${error.message}',
        (products) => _response = 'Products: ${products.length}\n\n${products.toString()}',
      );
    });
  }

  /// function to get categories list
  void _getCategories() async {
    final result = await apiService.fetchCategories();
    setState(() {
      result.fold(
        (error) => _response = 'Error: ${error.message}',
        (categories) => _response = 'Categories: ${categories.length}\n\n${categories.toString()}',
      );
    });
  }

  /// function to get user list
  void _getUsers() async {
    final result = await apiService.fetchUsers();
    setState(() {
      result.fold(
        (error) => _response = 'Error: ${error.message}',
        (users) => _response = 'Users: ${users.length}\n\n${users.toString()}',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fake Store API Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: _getProducts,
                    child: const Text('Get Products'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _getCategories,
                    child: const Text('Get Categories'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _getUsers,
                    child: const Text('Get Users'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), 
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  _response,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
