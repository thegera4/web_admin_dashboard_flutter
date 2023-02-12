import 'package:admin_dashboard/service/products_service.dart';
import 'package:get/get.dart';
import '../models/product.dart';

class ProductsController extends GetxController {
  var products = <Product>[].obs;
  var isLoading = true.obs;

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await ProductsService().fetchProducts();
      if (products.isNotEmpty) {
        this.products.assignAll(products);
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
