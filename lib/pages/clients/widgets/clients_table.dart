import 'package:adaptive_scrollbar/adaptive_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/style.dart';
import '../../../controllers/customers_controller.dart';
import '../../../widgets/custom_text.dart';

class ClientsTable extends StatefulWidget {
  const ClientsTable({super.key});

  @override
  State<ClientsTable> createState() => _ClientsTableState();
}

class _ClientsTableState extends State<ClientsTable> {
  final CustomersController customersController =
      Get.put(CustomersController());

  @override
  void initState() {
    super.initState();
    customersController.fetchCustomers();
  }


  @override
  Widget build(BuildContext context) {
    var columns = const [
      DataColumn(label: Text('Username')),
      DataColumn(label: Text('Name')),
      DataColumn(label: Text('Email')),
      DataColumn(label: Text('Address')),
      //DataColumn(label: Text('Phone')),
      DataColumn(label: Text('Actions')),
    ];

    final verticalScrollController = ScrollController();
    final horizontalScrollController = ScrollController();

    return Obx(() => Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: active.withOpacity(.4), width: .5),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 6),
              color: lightGray.withOpacity(.1),
              blurRadius: 12)
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 30),
      child: AdaptiveScrollbar(
        underColor: Colors.blueGrey.withOpacity(0.3),
        sliderDefaultColor: active.withOpacity(0.7),
        sliderActiveColor: active,
        controller: verticalScrollController,
        child: AdaptiveScrollbar(
          controller: horizontalScrollController,
          position: ScrollbarPosition.bottom,
          underColor: lightGray.withOpacity(0.3),
          sliderDefaultColor: active.withOpacity(0.7),
          sliderActiveColor: active,
          width: 13.0,
          sliderHeight: 100.0,
          child: SingleChildScrollView(
            controller: verticalScrollController,
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              controller: horizontalScrollController,
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                customersController.isLoading.value
                    ? const CircularProgressIndicator() :
                 DataTable(
                  columns: columns,
                  rows: List<DataRow>.generate(
                    customersController.customers.length,
                    (index) => DataRow(cells: [
                      DataCell(CustomText(
                        text: customersController.customers[index].username
                            .toString(),)),
                      DataCell(CustomText(
                        text: customersController.customers[index].name
                            .toString())),
                      DataCell(CustomText(
                        text: customersController.customers[index].email
                            .toString())),
                      DataCell(CustomText(
                        text: '${customersController.customers[index].address!
                            .street} ${customersController.customers[index]
                            .address!.suite} ${customersController
                            .customers[index].address!
                            .city} , zip: ${customersController
                            .customers[index].address!.zipcode}',
                      )),
                      /*DataCell(CustomText(
                        text: customersController.customers[index].phone
                            .toString())),*/
                      DataCell(Container(
                        decoration: BoxDecoration(
                          color: light,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: active, width: .5),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        child: CustomText(
                          text: 'Block Client',
                          color: active.withOpacity(.7),
                          weight: FontWeight.bold,
                        ),
                      )),
                    ]),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    )
    );
  }
}
