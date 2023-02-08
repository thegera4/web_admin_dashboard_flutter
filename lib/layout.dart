import 'package:admin_dashboard/helpers/responsiveness.dart';
import 'package:admin_dashboard/widgets/large_screen.dart';
import 'package:admin_dashboard/widgets/small_screen.dart';
import 'package:flutter/material.dart';

class SiteLayout extends StatelessWidget {
  const SiteLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: const ResponsiveWidget(
        largeScreen: LargeScreen(),
        mediumScreen: LargeScreen(),
        smallScreen: SmallScreen(),
      )
    );
  }
}