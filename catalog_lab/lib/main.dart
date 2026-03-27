import 'package:flutter/material.dart';

void main() => runApp(const CatalogApp());

class CatalogApp extends StatelessWidget {
  const CatalogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Catalog',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: CatalogScreen(),
    );
  }
}

class Product {
  final String name;
  final String price;
  final String imageUrl;
  final Color color;

  Product({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.color,
  });
}

class CatalogScreen extends StatelessWidget {
  CatalogScreen({super.key});

  final List<Product> products = [
    Product(
      name: 'Jebena (Coffee Pot)',
      price: '\$25',
      imageUrl:
          'https://images.pexels.com/photos/6205787/pexels-photo-6205787.jpeg?auto=compress&cs=tinysrgb&w=800',
      color: Colors.brown,
    ),
    Product(
      name: 'Ethiopian Coffee Beans',
      price: '\$18',
      imageUrl:
          'https://images.pexels.com/photos/894695/pexels-photo-894695.jpeg?auto=compress&cs=tinysrgb&w=800',
      color: Colors.green,
    ),
    Product(
      name: 'Habesha Kemis',
      price: '\$75',
      imageUrl:
          'https://images.pexels.com/photos/6311392/pexels-photo-6311392.jpeg?auto=compress&cs=tinysrgb&w=800',
      color: Colors.purple,
    ),
    Product(
      name: 'Traditional Coffee Cups',
      price: '\$30',
      imageUrl:
          'https://images.pexels.com/photos/6205792/pexels-photo-6205792.jpeg?auto=compress&cs=tinysrgb&w=800',
      color: Colors.orange,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Catalog')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];

            return Card(
              color: product.color.withOpacity(0.1),
              child: InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('You selected ${product.name}')),
                  );
                },
                child: Column(
                  children: [
                    Expanded(
                      child: Image.network(
                        product.imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        loadingBuilder: (context, child, progress) {
                          if (progress == null) return child;
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.broken_image, size: 50);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        product.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(product.price),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
