import 'package:admin_dashboard/controllers/counter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtherScreen extends StatelessWidget {
  OtherScreen({super.key});

  final CounterController _counterController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Screen was clicked: ${_counterController.counter.value}"),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => Get.back(),
            child: const Text("Open Other Screen"),
          ),
        ],
      )
    );
  }
}