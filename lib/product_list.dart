import 'package:flutter/material.dart';
import 'create_post.dart'; 

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Onions',
      'quantity': 50,
      'price': 500,
      'image': 'assets/onions.png'
    },
    {
      'name': 'Potatoes',
      'quantity': 100,
      'price': 1000,
      'image': 'assets/potatoes.png'
    },
    {
      'name': 'Rice',
      'quantity': 500,
      'price': 1200,
      'image': 'assets/rice.png'
    },
    {
      'name': 'Maize',
      'quantity': 50,
      'price': 1000,
      'image': 'assets/maize.png'
    },
  ];

  List<Map<String, dynamic>> filteredProducts = [];
  String selectedCategory = 'All'; // Currently selected category
  String searchQuery = ''; // Search query

  @override
  void initState() {
    super.initState();
    filteredProducts = products; // Initialize with all products
  }

  void updateCategory(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  void updateSearchQuery(String query) {
    setState(() {
      searchQuery = query;
      // Filter products based on search query
      filteredProducts = products
          .where((product) =>
              product['name'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF018241), // Green background
        title: Row(
          children: [
            IconButton(
              icon: Image.asset(
                'assets/arrow-left.png',
                height: 30,
                width: 30,
              ),
              onPressed: () {
                // Navigate to CreatePostPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CreatePostPage()),
                );
              },
            ),
            const SizedBox(width: 8), // Spacing between the icon and text
            const Text(
              'All Products',
              style: TextStyle(
                color: Colors.white, // Text color set to white
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: updateSearchQuery,
              decoration: InputDecoration(
                hintText: 'Search for products...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xFF018241)),
                ),
                prefixIcon: const Icon(Icons.search, color: Color(0xFF018241)),
              ),
            ),
          ),
          // Category Tabs
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CategoryTab(
                  label: 'All',
                  isSelected: selectedCategory == 'All',
                  onTap: () => updateCategory('All'),
                ),
                CategoryTab(
                  label: 'On Sales',
                  isSelected: selectedCategory == 'On Sales',
                  onTap: () => updateCategory('On Sales'),
                ),
                CategoryTab(
                  label: 'Sold',
                  isSelected: selectedCategory == 'Sold',
                  onTap: () => updateCategory('Sold'),
                ),
              ],
            ),
          ),
          // Product List
          Expanded(
            child: ListView.builder(
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return ProductCard(
                  name: product['name'],
                  quantity: product['quantity'],
                  price: product['price'],
                  imageUrl: product['image'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


class CategoryTab extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Function onTap;

  const CategoryTab({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? const Color(0xFF018241) : Colors.black,
              fontSize: 16,
            ),
          ),
          if (isSelected)
            Container(
              margin: const EdgeInsets.only(top: 4),
              height: 3,
              width: 30,
              color: const Color(0xFF018241),
            ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final int quantity;
  final int price;
  final String imageUrl;

  const ProductCard({
    super.key,
    required this.name,
    required this.quantity,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8.0,
            offset: Offset(0, 4),
          ),
        ],
        border: Border.all(color: const Color(0xFF018241)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 150,
                  height: 120,
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xFF018241)),
                  ),
                  clipBehavior:
                      Clip.antiAlias, // Optional: adds a smooth clipping effect
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit
                          .cover, // Ensures the image covers the entire container
                      width: 150, // Explicitly set the width
                      height: 120, // Explicitly set the height
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text('Quantity Left: $quantity kg',
                            style: const TextStyle(color: Colors.grey)),
                        const SizedBox(height: 4),
                        Text('Price: $price Rwf/Kg',
                            style: const TextStyle(
                                color: Color(0xFF018241),
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 0, bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF018241),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                    ),
                    child: const Text('Edit'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF44336),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                    ),
                    child: const Text('Remove'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
