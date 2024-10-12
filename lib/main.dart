import 'package:flutter/material.dart';
import 'product_list.dart';

void main() {
  runApp(const ProductListApp());
}

class ProductListApp extends StatelessWidget {
  const ProductListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product List',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const ProductListPage(),
    );
  }
}
