import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_darsi/viewmodel/control.dart';

class CartScreen extends StatelessWidget {
  final cartController = Get.find<CartController>();

  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: Obx(() {
        if (cartController.cartItems.isEmpty) {
          return Center(child: Text('Savatcha bo‘sh'));
        }

        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartController.cartItems.length,
                itemBuilder: (context, index) {
                  final product = cartController.cartItems[index];
                  return ListTile(
                    leading: Image.network(product.image, width: 50),
                    title: Text(product.title),
                    subtitle: Text('\$${product.price}'),
                    trailing: IconButton(
                      icon: Icon(Icons.remove_circle_outline),
                      onPressed: () => cartController.removeFromCart(product),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Obx(() {
                return Text(
                  'Umumiy narx: \$${cartController.totalPrice.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                );
              }),
            ),
            SizedBox(height: 50),
          ],
        );
      }),
    );
  }
}
