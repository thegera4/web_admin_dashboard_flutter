import 'package:flutter/material.dart';
import 'package:admin_dashboard/constants/controllers.dart';
import 'package:admin_dashboard/constants/style.dart';
import 'package:admin_dashboard/widgets/custom_text.dart';
import 'package:admin_dashboard/widgets/side_menu_item.dart';
import 'package:get/get.dart';
import '../helpers/responsiveness.dart';
import '../routing/routes.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      color: light,
      child: ListView(
        children: [
          if (ResponsiveWidget.isSmallScreen(context))
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    SizedBox(width: width / 48),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Image.asset("assets/icons/logo.png"),
                    ),
                    Flexible(
                      child: CustomText(
                        text: "Admin Panel",
                        size: 20,
                        weight: FontWeight.bold,
                        color: active,
                      ),
                    ),
                    SizedBox(width: width / 48),
                  ],
                ),
              ],
            ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: sideMenuItems.map((item) => 
              SideMenuItem(
                itemName: item.name == authenticationPageRoute
                        ? "Log Out"
                        : item.name,
                onTap: () {
                  //TODO: add logic to log out from firebase (sigout)
                  
                  if (item.route == authenticationPageRoute) {
                    menuController.changeActiveItemTo(overViewPageDisplayName);
                    Get.offAllNamed(authenticationPageRoute);
                  }
                  if (!menuController.isActive(item.name)) {
                    menuController.changeActiveItemTo(item.name);
                    if (ResponsiveWidget.isSmallScreen(context)) {
                      Get.back();
                    }
                    navigationController.navigateTo(item.route);
                  }

                }
              )).toList(),
          )
        ],
      ),
    );
  }
}
