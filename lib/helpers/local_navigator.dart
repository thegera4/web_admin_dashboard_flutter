import 'package:admin_dashboard/constants/controllers.dart';
import 'package:admin_dashboard/routing/router.dart';
import 'package:admin_dashboard/routing/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Navigator localNavigator() => Navigator(
      key: navigationController.navigatorKey,
      initialRoute: overViewPageRoute,
      onGenerateRoute: generateRoute
);