import 'package:flutter/material.dart';
import 'package:admin_dashboard/constants/controllers.dart';
import 'package:admin_dashboard/constants/style.dart';
import 'package:admin_dashboard/widgets/custom_text.dart';
import 'package:admin_dashboard/widgets/side_menu_item.dart';
import 'package:get/get.dart';
import '../helpers/responsiveness.dart';
import '../routing/routes.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
            color: light,
            child: ListView(
              children: [
                if(ResponsiveWidget.isSmallScreen(context))
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 40,),
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
                const SizedBox(height: 40,),
                Divider(color: lightGray.withOpacity(.1), ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: sideMenuItems.map((itemName) => 
                    SideMenuItem(
                      itemName: itemName == authenticationPageroute ? 
                                "Log Out" : itemName,
                      onTap: () {
                        if(itemName == authenticationPageroute){
                          // ignore: todo
                          //TODO: got to  authentication page

                        }
                        if (!menuController.isActive(itemName)) {
                          menuController.changeActiveItemTo(itemName);
                          if(ResponsiveWidget.isSmallScreen(context)) {
                            Get.back();
                            // ignore: todo
                            //TODO: go to item name route
                          }
                          }
                      }
                    ))
                  .toList(),
                )
              ],
            ),
          );
  }
}