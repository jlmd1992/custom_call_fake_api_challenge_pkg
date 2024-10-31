import 'package:example/src/provider/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePageScreen extends StatelessWidget {
  
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final ApiProvider apiProvider = context.watch<ApiProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fake Store API Example Package'),
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
                    onPressed: apiProvider.loadProducts,
                    child: const Text('Get Products'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: apiProvider.loadCategories,
                    child: const Text('Get Categories'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: apiProvider.loadUsers,
                    child: const Text('Get Users'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), 
            Expanded(
              child: SingleChildScrollView(
                child: 
                  apiProvider.isLoading 
                    ? const Center(child: CircularProgressIndicator()) 
                    : Text(apiProvider.response, style: const TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
