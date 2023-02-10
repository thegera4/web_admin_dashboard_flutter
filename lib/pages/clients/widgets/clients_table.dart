import 'package:adaptive_scrollbar/adaptive_scrollbar.dart';
import 'package:flutter/material.dart';

import '../../../constants/style.dart';
import '../../../widgets/custom_text.dart';

class ClientsTable extends StatelessWidget {
  const ClientsTable({super.key});

  @override
  Widget build(BuildContext context) {
    
    var columns = const [
      DataColumn(label: Text('Name')),
      DataColumn(label: Text('Phone')),
      DataColumn(label: Text('Location')),
      DataColumn(label: Text('Rating')),
      DataColumn(label: Text('Action')),

    ];

    final verticalScrollController = ScrollController();
    final horizontalScrollController = ScrollController();

   return Container(
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
                  child: DataTable(
                    columns: columns,
                    rows: List<DataRow>.generate( 10,
                      (index) =>  DataRow(cells: [
                                    const DataCell(CustomText(
                                      text:'John Doe'
                                    )),
                                    const DataCell(CustomText(
                                      text:'1234567890'
                                    )),
                                    const DataCell(CustomText(
                                      text:'New York'
                                    )),
                                    DataCell(Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Icon(
                                          Icons.star,
                                          color: Colors.deepOrange,
                                          size: 18,
                                        ),
                                        SizedBox(width: 5,),
                                        CustomText(text: "4.5",)
                                      ],
                                    )),
                                    DataCell(Container(
                                      decoration: BoxDecoration(
                                        color: light,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: active, 
                                          width: .5
                                        ),
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
    );
  }
}
