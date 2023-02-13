import 'package:admin_dashboard/widgets/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/helpers/responsiveness.dart';
import 'package:admin_dashboard/widgets/large_screen.dart';
import 'package:admin_dashboard/widgets/small_screen.dart';

import 'widgets/top_nav.dart';

class SiteLayout extends StatelessWidget {
  SiteLayout({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: topNavigationBar(context, scaffoldKey),
      drawer: const Drawer(
        child: SideMenu()
      ),
      body: const ResponsiveWidget(
        largeScreen: LargeScreen(),
        mediumScreen: LargeScreen(),
        smallScreen: SmallScreen(),
      )
    );
  }
}