import 'package:flutter/material.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  final List<Map<String, String>> categories = [
    {"name": "Vegetables", "image": "assets/vegetables.png"},
    {"name": "Fruits", "image": "assets/fruits.png"},
    {"name": "Nuts", "image": "assets/nuts.png"},
    {"name": "Cereals", "image": "assets/cereals.png"},
    {"name": "Meat", "image": "assets/meat.png"},
  ];

  final List<Map<String, dynamic>> products = [
    {"name": "Carrots", "price": "2000 Rwf/Kg", "image": "assets/carrots.png"},
    {"name": "Potatoes", "price": "800 Rwf/Kg", "image": "assets/potatoes.png"},
    {"name": "Tomatoes", "price": "500 Rwf/Kg", "image": "assets/tomatoes.png"},
    {"name": "Avocadoes", "price": "1000 Rwf/Kg", "image": "assets/avocadoes.png"},
    {"name": "Apples", "price": "800 Rwf/Kg", "image": "assets/apples.png"},
    {"name": "Spinach", "price": "500 Rwf/Kg", "image": "assets/spinach.png"},
    {"name": "Corn", "price": "500 Rwf/Kg", "image": "assets/corn.png"},
    {"name": "Onions", "price": "600 Rwf/Kg", "image": "assets/onions.png"},
    {"name": "Cucumbers", "price": "700 Rwf/Kg", "image": "assets/cucumbers.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Row(
            children: [
              Icon(Icons.search, color: Colors.grey),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search in here",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.grey),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Category Section
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Shop by category",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(categories[index]['image']!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(categories[index]['name']!),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              // Recommended Section
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recommended",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    "See more",
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    image: products[index]['image']!,
                    name: products[index]['name']!,
                    price: products[index]['price']!,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String image;
  final String name;
  final String price;

  const ProductCard({
    super.key,
    required this.image,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Image.asset(image, fit: BoxFit.cover),
            ),
            const SizedBox(height: 5),
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              price,
              style: const TextStyle(color: Colors.grey),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add_circle, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
