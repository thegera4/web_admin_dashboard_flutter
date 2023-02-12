import 'package:get/get.dart';
import '../constants/constants.dart';
import '../models/product.dart';

class ProductsService extends GetConnect {
  Future<List<Product>> fetchProducts() async {
    final response = await get(Constants.productsUrl);
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      final List products = response.body['products'];
      return products.map((product) => Product.fromJson(product)).toList();
    }
  }
}