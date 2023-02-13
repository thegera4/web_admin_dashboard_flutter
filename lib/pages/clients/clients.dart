//import 'package:admin_dashboard/constants/controllers.dart';
//import 'package:admin_dashboard/helpers/responsiveness.dart';
import 'package:admin_dashboard/pages/clients/widgets/clients_table.dart';
//import 'package:admin_dashboard/widgets/custom_text.dart';
import 'package:flutter/material.dart';
//import 'package:get/get.dart';

class ClientsPage extends StatelessWidget {
  const ClientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /*Obx((() => Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6
                  ),
                  child: CustomText(
                    text: menuController.activeItem.value,
                    size: 24,
                    weight: FontWeight.bold,
                  )
                )
              ],
        ))),*/
        Expanded(
          child: ListView(
            children: const [
              ClientsTable(),
            ],
          ),
        ),
      ],
    );
  }
}
