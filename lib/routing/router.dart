//import 'package:admin_dashboard/pages/authentication/authentication.dart';
import 'package:admin_dashboard/pages/clients/clients.dart';
import 'package:admin_dashboard/pages/drivers/drivers.dart';
import 'package:admin_dashboard/pages/overview/overview.dart';
import 'package:admin_dashboard/routing/routes.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case overViewPageRoute:
      return getPageRoute(const OverviewPage());
    case driversPageRoute:
      return getPageRoute(const DriversPage());
    case clientsPageRoute:
      return getPageRoute(const ClientsPage());
    //case authenticationPageroute:
      //return getPageRoute(const AuthenticationPage());
    default:
      return getPageRoute(const OverviewPage());
  }
}

PageRoute getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
