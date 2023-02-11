import 'package:get/get.dart';
import '../constants/constants.dart';
import '../models/customer.dart';

class CustomerService extends GetConnect {

  Future<List<Customer>> fetchCustomers() async {
    final response = await get(Constants.customersUrl);
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      final List customers = response.body;
      return customers.map((customer) => Customer.fromJson(customer)).toList();
    }
  }

}
