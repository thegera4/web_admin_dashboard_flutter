import 'package:flutter/material.dart';
import 'package:admin_dashboard/constants/controllers.dart';
import 'package:get/get.dart';
import 'package:admin_dashboard/constants/style.dart';
import 'custom_text.dart';

class HorizontalMenuItem extends StatelessWidget {
  const HorizontalMenuItem({ 
    Key? key, 
    required this.itemName, 
    required this.onTap 
  }) : super(key: key);

  final String itemName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return InkWell(
              onTap: onTap,
              onHover: (value){ value ?
                menuController.onHover(itemName) : 
                menuController.onHover("not hovering");
              },
              child: Obx(() => Container(
              color: menuController.isHovering(itemName) ? 
                lightGray.withOpacity(.1) : Colors.transparent,
              child: Row(
                      children: [
                        Visibility(
                          visible: menuController.isHovering(itemName) || 
                                   menuController.isActive(itemName),
                          maintainSize: true,
                          maintainAnimation: true,
                          maintainState: true,
                          child: Container(
                            width: 6,
                            height: 40,
                            color: dark,
                          ),
                        ),
                       SizedBox(width:width / 88),
                       Padding(
                        padding: const EdgeInsets.all(16),
                        child: menuController.returnIconFor(itemName),
                       ),
                      if(!menuController.isActive(itemName))
                      Flexible(child: CustomText(
                        text: itemName , 
                        color: menuController.isHovering(itemName) ? 
                        dark : lightGray,
                      ))
                      else
                        Flexible(child: CustomText(
                          text: itemName , 
                          color:  dark , 
                          size: 18, 
                          weight: FontWeight.bold,
                      ))
                      ],
                    ),
                  ))
                );
  }
}