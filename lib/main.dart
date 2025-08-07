import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_darsi/view/screens/home_scree.dart';
import 'package:get_x_darsi/viewmodel/control.dart';
import 'package:get_x_darsi/viewmodel/product_controller.dart';

void main() {
  Get.put(ProductController());
  Get.put(CartController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cart Project',
      home: HomeScreen(),
    );
  }
}
