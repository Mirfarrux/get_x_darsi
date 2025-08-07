import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_x_darsi/model/product_model.dart';

class CartController extends GetxController {
  var cart = <Product, int>{}.obs;
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    loadCart();
  }

  void addProduct(Product product) {
    if (cart.containsKey(product)) {
      cart[product] = cart[product]! + 1;
    } else {
      cart[product] = 1;
    }
    saveCart();
  }

  void removeProduct(Product product) {
    if (cart.containsKey(product)) {
      if (cart[product]! > 1) {
        cart[product] = cart[product]! - 1;
      } else {
        cart.remove(product);
      }
      saveCart();
    }
  }

  void deleteProduct(Product product) {
    cart.remove(product);
    saveCart();
  }

  double get totalPrice =>
      cart.entries.map((e) => e.key.price * e.value).fold(0, (a, b) => a + b);

  void saveCart() {
    final saved = cart.entries.map((e) {
      return {'product': e.key.toJson(), 'quantity': e.value};
    }).toList();
    box.write('cart', saved);
  }

  void loadCart() {
    final data = box.read('cart') ?? [];
    cart.clear();
    for (var item in data) {
      cart[Product.fromJson(item['product'])] = item['quantity'];
    }
  }
}
