import 'package:admin_dashboard/controllers/customers_controller.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/pages/overview/widgets/info_card.dart';
import 'package:get/get.dart';

class OverviewCardsLargeScreen extends StatelessWidget {
  const OverviewCardsLargeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

  final CustomersController customersController =
          Get.put(CustomersController());
    

    return Row(
      children: [
        InfoCard(
          title: "Current customers:",
          value: 32,
          onTap: () {
            customersController.fetchCustomers();
          },
          topColor: Colors.orange,
        ),
        SizedBox(
          width: width / 64,
        ),
        InfoCard(
          title: "Current customers:",
          value: 32,
          topColor: Colors.lightGreen,
          onTap: () {

          },
        ),
        SizedBox(
          width: width / 64,
        ),
        InfoCard(
          title: "Current customers:",
          value: 32,
          topColor: Colors.redAccent,
          onTap: () {},
        ),
        SizedBox(
          width: width / 64,
        ),
        InfoCard(
          title: "Current customers:",
          value: 32,
          onTap: () {},
        ),
      ],
    );
  }
}
