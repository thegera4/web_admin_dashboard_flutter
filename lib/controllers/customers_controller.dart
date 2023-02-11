import 'package:admin_dashboard/service/customers_service.dart';
import 'package:get/get.dart';
import '../models/customer.dart';

class CustomersController extends GetxController {
  var customers = <Customer>[].obs;
  var isLoading = true.obs;

  void fetchCustomers() async {
    try {
      isLoading(true);
      final customers = await CustomerService().fetchCustomers();
      if (customers.isNotEmpty) {
        this.customers.assignAll(customers);
      }
    } finally {
      isLoading(false);
    }
  }
  
}