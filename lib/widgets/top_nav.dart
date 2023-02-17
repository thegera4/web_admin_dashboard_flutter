import 'package:flutter/material.dart';
import 'package:admin_dashboard/constants/style.dart';
import 'package:admin_dashboard/helpers/responsiveness.dart';
import 'custom_text.dart';
import 'package:admin_dashboard/controllers/logged_user_controller.dart';
import 'package:get/get.dart';
import 'package:image_network/image_network.dart';

final LoggedUserController _loggedUserController = Get.find();

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) =>
    AppBar(
      leading: !ResponsiveWidget.isSmallScreen(context)
          ? Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Image.asset(
                    "assets/icons/logo.png",
                    width: 28,
                  ),
                ),
              ],
            )
          : IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                key.currentState!.openDrawer();
              }),
      title: Row(
        children: [
          Visibility(
              visible: !ResponsiveWidget.isSmallScreen(context),
              child: CustomText(
                text: "Admin Panel",
                color: lightGray,
                size: 20,
                weight: FontWeight.bold,
              )),
          Expanded(child: Container()),
          IconButton(
              icon: Icon(
                Icons.settings,
                color: dark,
              ),
              onPressed: () {}),
          Stack(
            children: [
              IconButton(
                  icon: Icon(
                    Icons.notifications,
                    color: dark.withOpacity(.7),
                  ),
                  onPressed: () {}),
              Positioned(
                top: 7,
                right: 7,
                child: Container(
                  width: 12,
                  height: 12,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: active,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: light, width: 2)),
                ),
              )
            ],
          ),
          Container(
            width: 1,
            height: 22,
            color: lightGray,
          ),
          const SizedBox(
            width: 24,
          ),
          if (!ResponsiveWidget.isSmallScreen(context))
            Obx(() => CustomText(
                  text: _loggedUserController.loggedUser.name ?? "User Name",
                  color: lightGray,
                )),
          const SizedBox(
            width: 16,
          ),
          Container(
            decoration: BoxDecoration(
                color: active.withOpacity(.5),
                borderRadius: BorderRadius.circular(30)),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              padding: const EdgeInsets.all(2),
              margin: const EdgeInsets.all(2),
              child: Obx(() => CircleAvatar(
                    backgroundColor: light,
                    child: _loggedUserController.loggedUser.imageUrl == null
                        ? Icon(
                            Icons.person_outline,
                            color: dark,
                          )
                        : ImageNetwork(
                            image: _loggedUserController.loggedUser.imageUrl!, 
                            width: 40,
                            height: 40,
                            borderRadius: BorderRadius.circular(70),
                            onLoading: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                        )
                  )),
            ),
        ],
      ),
      iconTheme: IconThemeData(color: dark),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );