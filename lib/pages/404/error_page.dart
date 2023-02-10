import 'package:flutter/material.dart';
import 'package:admin_dashboard/widgets/custom_text.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/error.png", width: 350,),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CustomText(
                text: "Page not found", 
                size: 24, 
                weight: FontWeight.bold,
              ),
            ],
          )
        ],
      ),
    );
  }
}