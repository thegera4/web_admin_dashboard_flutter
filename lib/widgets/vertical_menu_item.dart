import 'package:flutter/material.dart';
import 'package:admin_dashboard/constants/controllers.dart';
import 'package:get/get.dart';
import 'package:admin_dashboard/constants/style.dart';
import 'custom_text.dart';

class VerticalMenuItem extends StatelessWidget {
  const VerticalMenuItem({
    Key? key, 
    required this.itemName, 
    required this.onTap
  }) : super(key: key);

  final String itemName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {

    return InkWell(
        onTap: onTap,
        onHover: (value) {
          value
              ? menuController.onHover(itemName)
              : menuController.onHover("not hovering");
        },
        child: Obx(() => Container(
              color: menuController.isHovering(itemName)
                  ? lightGray.withOpacity(.1)
                  : Colors.transparent,
              child: Row(
                children: [
                  Visibility(
                    visible: menuController.isHovering(itemName) ||
                        menuController.isActive(itemName),
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    child: Container(
                      width: 3,
                      height: 72,
                      color: dark,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: menuController.returnIconFor(itemName),
                        ),
                        if (!menuController.isActive(itemName))
                          Flexible(
                              child: CustomText(
                            text: itemName,
                            color: menuController.isHovering(itemName)
                                ? dark
                                : lightGray,
                          ))
                        else
                          Flexible(
                              child: CustomText(
                            text: itemName,
                            color: dark,
                            size: 18,
                            weight: FontWeight.bold,
                          ))
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}