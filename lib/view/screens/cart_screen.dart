import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_darsi/model/product_model.dart';
import 'package:get_x_darsi/viewmodel/control.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController controller = Get.find();

    return Scaffold(
      appBar: AppBar(title: const Text("Savatcha")),
      body: Obx(() {
        if (controller.cart.isEmpty) {
          return const Center(child: Text("Savatcha bo‘sh"));
        }
        return Column(
          children: [
            Expanded(
              child: ListView(
                children: controller.cart.entries.map((entry) {
                  final Product product = entry.key;
                  final int quantity = entry.value;
                  return ListTile(
                    title: Text(product.name),
                    subtitle: Text("${product.price.toStringAsFixed(0)} so'm"),
                    trailing: SizedBox(
                      width: 155,
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () => controller.removeProduct(product),
                          ),
                          Text("$quantity"),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () => controller.addProduct(product),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => controller.deleteProduct(product),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.grey[300],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Jami:", style: TextStyle(fontSize: 18)),
                  Obx(
                    () => Text(
                      "${controller.totalPrice.toStringAsFixed(0)} so'm",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
          ],
        );
      }),
    );
  }
}
