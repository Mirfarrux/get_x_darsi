import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_darsi/model/product_model.dart';
import 'package:get_x_darsi/view/screens/cart_screen.dart';
import 'package:get_x_darsi/viewmodel/control.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController controller = Get.put(CartController());

    final List<Product> products = List.generate(
      6,
      (index) => Product(
        id: index,
        name: "Mahsulot ${index + 1}",
        price: (10 + index * 5).toDouble(),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mahsulotlar"),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => Get.to(() => const CartScreen()),
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final p = products[index];
          return Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  p.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("${p.price.toStringAsFixed(0)} so'm"),
                ElevatedButton(
                  onPressed: () => controller.addProduct(p),
                  child: const Text("Savatchaga qo‘shish"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
