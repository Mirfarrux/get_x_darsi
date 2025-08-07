import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_x_darsi/model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <Product>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      final response = await http.get(
        Uri.parse("https://api.escuelajs.co/api/v1/products"),
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        productList.value = data.map((e) => Product.fromJson(e)).toList();
      }
    } finally {
      isLoading(false);
    }
  }
}
