import 'package:admin_dashboard/screens/other.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/counter_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final CounterController counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Obx(() =>  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("Clicks: ${counterController.counter.value}")),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () => Get.to(OtherScreen()),
              child: const Text("Open Other Screen"),
            ),
          ),
        ],
        ),),
        floatingActionButton: FloatingActionButton(
          onPressed: () => counterController.increment(),
          child: const Icon(Icons.add),
        )
    );
  }
}