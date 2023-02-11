import 'package:flutter/material.dart';
import 'package:admin_dashboard/constants/style.dart';
import 'package:admin_dashboard/widgets/custom_text.dart';
import 'package:get/get.dart';
import '../../../controllers/customers_controller.dart';

class InfoCardSmall extends StatefulWidget {
  const InfoCardSmall({
    Key? key,
    required this.title,
    required this.value, 
    this.isActive = false,
    required this.onTap
  }) : super(key: key);

  final String title;
  final String value;
  final bool isActive;
  final VoidCallback onTap;

  @override
  State<InfoCardSmall> createState() => _InfoCardSmallState();
}

class _InfoCardSmallState extends State<InfoCardSmall> {

  final CustomersController customersController =
      Get.put(CustomersController());

  @override
  void initState() {
    super.initState();
    customersController.fetchCustomers();
  }
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: widget.isActive ? active : lightGray, width: .5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            CustomText(
              text: widget.title, 
              size: 24, 
              weight: FontWeight.w300, 
              color: widget.isActive ? active : lightGray,
            ),
            Obx(() => customersController.customers.isEmpty
                    ? const CircularProgressIndicator()
                    :CustomText(
              text: customersController.customers.length.toString(), 
              size: 24, 
              weight: FontWeight.bold, 
              color: widget.isActive ? active : dark,
            )
            ),

          ],)
        ),
      ),
    );
  }
}