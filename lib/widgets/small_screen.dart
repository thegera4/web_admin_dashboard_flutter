import 'package:admin_dashboard/helpers/local_navigator.dart';
import 'package:flutter/material.dart';

class SmallScreen extends StatelessWidget {
  const SmallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: localNavigator()
    );
  }
}