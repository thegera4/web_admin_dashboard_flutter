// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/products_controller.dart';
import '../../../widgets/custom_text.dart';

class ProductsTable extends StatefulWidget {
  const ProductsTable({super.key});

  @override
  State<ProductsTable> createState() => _ProductsTableState();
}

class _ProductsTableState extends State<ProductsTable> {
  final ProductsController productsController = Get.put(ProductsController());

  @override
  void initState() {
    super.initState();
    productsController.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    var columns = const [
      DataColumn(label: Text('Brand')),
      DataColumn(label: Text('Category')),
      DataColumn(label: Text('Product')),
      DataColumn(label: Text('Price')),
      DataColumn(label: Text('Rating')),
      DataColumn(label: Text('Stock')),
      DataColumn(label: Text('Actions')),
    ];

    final DataTableSource data = MyData();

    return Obx(() => Padding(
        padding: const EdgeInsets.all(16),
          child: productsController.products.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : PaginatedDataTable(
                  columns: columns,
                  source: data,
                  //header: const Text('All Products'),
                  columnSpacing: 50,
                  horizontalMargin: 30,
                  rowsPerPage: 10,
                ),
        ));
  }
}

class MyData extends DataTableSource {
  final ProductsController productsController = Get.put(ProductsController());

  List<Map<String, dynamic>> data = [];

  MyData() {
    for (var i = 0; i < productsController.products.length; i++) {
      data.add({
        'brand': productsController.products[i].brand,
        'category': productsController.products[i].category,
        'product': productsController.products[i].title,
        'price': productsController.products[i].price.toString(),
        'rating': productsController.products[i].rating.toString(),
        'stock': productsController.products[i].stock.toString(),
        'actions': {
          'edit': () {
            print('Edit');
          },
          'delete': () {
            print('Delete');
          },
        },
      });
    }
  }

  @override
  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell(CustomText(text: data[index]['brand'])),
      DataCell(CustomText(text: data[index]['category'])),
      DataCell(CustomText(text: data[index]['product'])),
      DataCell(CustomText(text: data[index]['price'])),
      DataCell(Row(
        children: [
          const Icon(Icons.star, color: Colors.orangeAccent),
          const SizedBox(width: 5),
          CustomText(text: data[index]['rating']),
        ],
      )),
      DataCell(CustomText(text: data[index]['stock'])),
      DataCell(Row(
        children: [
          IconButton(
            icon: const Icon(Icons.edit),
            color: Colors.indigo,
            onPressed: data[index]['actions']['edit'],
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            color: Colors.redAccent,
            onPressed: data[index]['actions']['delete'],
          ),
        ],
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
