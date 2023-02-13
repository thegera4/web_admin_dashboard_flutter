//import 'package:admin_dashboard/constants/controllers.dart';
import 'package:admin_dashboard/helpers/responsiveness.dart';
import 'package:admin_dashboard/pages/overview/widgets/top_selling_products.dart';
import 'package:admin_dashboard/pages/overview/widgets/cards_large.dart';
import 'package:admin_dashboard/pages/overview/widgets/cards_medium.dart';
import 'package:admin_dashboard/pages/overview/widgets/cards_small.dart';
import 'package:admin_dashboard/pages/overview/widgets/revenue_section_large.dart';
import 'package:admin_dashboard/pages/overview/widgets/revenue_section_small.dart';
//import 'package:admin_dashboard/widgets/custom_text.dart';
import 'package:flutter/material.dart';
//import 'package:get/get.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /*Obx((() => Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6
                  ),
                  child: CustomText(
                    text: menuController.activeItem.value,
                    size: 24,
                    weight: FontWeight.bold,
                  )
                )
              ],
        ))),*/
        Expanded(
          child: ListView(
            children: [
              if (ResponsiveWidget.isLargeScreen(context))
                const OverviewCardsLargeScreen(),
              if (ResponsiveWidget.isCustomScreen(context))
                const OverviewCardsMediumScreen(),
              if (ResponsiveWidget.isSmallScreen(context) || 
                  ResponsiveWidget.isMediumScreen(context))
                const OverviewCardsSmallScreen(),

              if(!ResponsiveWidget.isSmallScreen(context))
                const RevenueSectionLarge(),
              if(ResponsiveWidget.isSmallScreen(context))
                const RevenueSectionSmall(),
            
               const AvailableDriversTable(),
              

            ]
          )
        ),
      ],
    );
  }
}
