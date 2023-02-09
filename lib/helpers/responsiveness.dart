import 'package:flutter/material.dart';

const int largeScreenSize = 1366;
const int mediumScreenSize = 768;
const int smallScreenSize = 360;
const int customScreenSize = 1100;

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({
    super.key, 
    required this.largeScreen, 
    required this.mediumScreen, 
    required this.smallScreen, 
  });

  final Widget largeScreen;
  final Widget mediumScreen;
  final Widget smallScreen;

  static bool isSmallScreen(BuildContext context) =>
    MediaQuery.of(context).size.width < mediumScreenSize;

  static bool isMediumScreen(BuildContext context) =>
    MediaQuery.of(context).size.width >= smallScreenSize &&
    MediaQuery.of(context).size.width < mediumScreenSize;

  static bool isCustomScreen(BuildContext context) =>
    MediaQuery.of(context).size.width >= mediumScreenSize &&
    MediaQuery.of(context).size.width < customScreenSize;

  static bool isLargeScreen(BuildContext context) =>
    MediaQuery.of(context).size.width >= customScreenSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        if (width >= largeScreenSize) {
          return largeScreen;
        } else if (width >= mediumScreenSize && width < largeScreenSize) {
          return mediumScreen;
        } else {
          return smallScreen;
        }
      },
    );
  }
}