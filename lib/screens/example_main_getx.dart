import 'package:admin_dashboard/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( //GetMaterialApp is a material app with GetX support
      title: 'Flutter Demo',
      theme: ThemeData( primarySwatch: Colors.blue,),
      home: HomeScreen(),
    );
  }
}