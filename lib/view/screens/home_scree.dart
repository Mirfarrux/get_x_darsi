import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_darsi/viewmodel/control.dart';
import 'package:get_x_darsi/viewmodel/product_controller.dart';
import 'cart_screen.dart';

class HomeScreen extends StatelessWidget {
  final productController = Get.find<ProductController>();
  final cartController = Get.find<CartController>();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => Get.to(() => CartScreen()),
          ),
        ],
      ),
      body: Obx(() {
        if (productController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: productController.productList.length,
          itemBuilder: (context, index) {
            final product = productController.productList[index];
            return ListTile(
              leading: Image.network(
                product.image,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(product.title),
              subtitle: Text('\$${product.price}'),
              trailing: ElevatedButton(
                onPressed: () => cartController.addToCart(product),
                child: Text('Add'),
              ),
            );
          },
        );
      }),
    );
  }
}
