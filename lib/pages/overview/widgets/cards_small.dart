import 'package:admin_dashboard/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/customers_controller.dart';
import '../../../controllers/products_controller.dart';
import '../../../models/product.dart';
import 'info_card_small.dart';

class OverviewCardsSmallScreen extends StatefulWidget {
  const OverviewCardsSmallScreen({super.key});

  @override
  State<OverviewCardsSmallScreen> createState() => _OverviewCardsSmallScreenState();
}

class _OverviewCardsSmallScreenState extends State<OverviewCardsSmallScreen> {
  
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

    return SizedBox(
      height: 400,
      child: Obx(() => Column(
        children: [
          InfoCardSmall(
            title: Constants.totalStock,
            value: calculateTotalStock(productsController.products),
            onTap: () {},
            isActive: true,
          ),
          SizedBox( height: width / 64, ),
          InfoCardSmall(
            title: Constants.valueOfStock,
            value: calculateTotalValue(productsController.products),
            onTap: () {},
          ),
          SizedBox(height: width / 64,),
          InfoCardSmall(
            title: Constants.productsCount,
            value: productsController.products.length,
            onTap: () {},
          ),
          SizedBox( height: width / 64, ),
          InfoCardSmall(
            title: Constants.customerCount,
            value: customersController.customers.length,
            onTap: () {},
          ),       
        ],
      ),
    ),
    );
  }
}