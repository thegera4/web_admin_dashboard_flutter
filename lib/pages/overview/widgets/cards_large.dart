import 'package:admin_dashboard/constants/constants.dart';
import 'package:admin_dashboard/controllers/customers_controller.dart';
import 'package:admin_dashboard/controllers/products_controller.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/pages/overview/widgets/info_card.dart';
import 'package:get/get.dart';
import '../../../models/product.dart';

class OverviewCardsLargeScreen extends StatefulWidget {
  const OverviewCardsLargeScreen({
    super.key,
  });

  @override
  State<OverviewCardsLargeScreen> createState() => _OverviewCardsLargeScreenState();
}

class _OverviewCardsLargeScreenState extends State<OverviewCardsLargeScreen> {

  final CustomersController customersController= Get.put(CustomersController());

  final ProductsController productsController= Get.put(ProductsController());
  
  @override
  void initState() {
    super.initState();
    productsController.fetchProducts();
    customersController.fetchCustomers();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    int calculateTotalStock(List<Product> stock){
      int totalStock=0;
      for(int i = 0; i < productsController.products.length; i++){
        totalStock += productsController.products[i].stock!;
      }
      return totalStock;
    }

    int calculateTotalValue(List<Product> stock){
      int totalValue=0;
      for(int i = 0; i < productsController.products.length; i++){
        totalValue += 
        productsController.products[i].stock! * 
        productsController.products[i].price!;
      }
      return totalValue;
    }

    return Obx(() => Row(
      children: [
        InfoCard(
          title: Constants.totalStock,
          value: calculateTotalStock(productsController.products),
          onTap: () {},
          topColor: Colors.orange,
        ),
        SizedBox( width: width / 64, ),
        InfoCard(
          title: Constants.valueOfStock,
          value: calculateTotalValue(productsController.products),
          topColor: Colors.lightGreen,
          onTap: () {},
        ),
        SizedBox( width: width / 64, ),
        InfoCard(
          title: Constants.productsCount,
          value: productsController.products.length,
          topColor: Colors.redAccent,
          onTap: () {},
        ),
        SizedBox( width: width / 64, ),
        InfoCard(
          title: Constants.customerCount,
          value: customersController.customers.length,
          onTap: () {},
        ),
      ],
    )
    );
  }
}
