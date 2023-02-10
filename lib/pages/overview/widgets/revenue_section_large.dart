import 'package:flutter/material.dart';
import 'package:admin_dashboard/constants/style.dart';
import 'package:admin_dashboard/pages/overview/widgets/chart.dart';
import 'package:admin_dashboard/pages/overview/widgets/revenue_info.dart';
import 'package:admin_dashboard/widgets/custom_text.dart';

class RevenueSectionLarge extends StatelessWidget {
  const RevenueSectionLarge({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
                padding: const EdgeInsets.all(24),
                margin: const EdgeInsets.symmetric(vertical: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 6),
                        color: lightGray.withOpacity(.1),
                        blurRadius: 12
                    )
                  ],
                  border: Border.all(color: lightGray, width: .5),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomText(
                            text: "Revenue Chart",
                            size: 20,
                            weight: FontWeight.bold,
                            color: lightGray,
                          ),
                          const SizedBox(
                              width: 600,
                              height: 200,
                              child: Chart()
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: const [
                              RevenueInfo(
                                title: "Today's revenue",
                                amount: "230",
                              ),
                              RevenueInfo(
                                title: "Last 7 days",
                                amount: "1,100",
                              ),
                            ],
                          ),
                          const SizedBox(height: 30,),
                          Row(
                            children: const [
                              RevenueInfo(
                                title: "Last 30 days",
                                amount: "3,230",
                              ),
                              RevenueInfo(
                                title: "Last 12 months",
                                amount: "11,300",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
  }
}