import 'package:flutter/material.dart';
import 'package:admin_dashboard/constants/style.dart';
import 'package:admin_dashboard/widgets/custom_text.dart';
import '../../../helpers/other.dart';

class InfoCardSmall extends StatefulWidget {
  const InfoCardSmall({
    Key? key,
    required this.title,
    required this.value, 
    this.isActive = false,
    required this.onTap
  }) : super(key: key);

  final String title;
  final int value;
  final bool isActive;
  final VoidCallback onTap;

  @override
  State<InfoCardSmall> createState() => _InfoCardSmallState();
}

class _InfoCardSmallState extends State<InfoCardSmall> {
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: widget.isActive ? active : lightGray, width: .5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: widget.title, 
                size: 20, 
                weight: FontWeight.w300, 
                color: widget.isActive ? active : lightGray,
              ),
              widget.value == 0 ? const CircularProgressIndicator() :
              widget.title == 'Value of stock:' ?
              CustomText(
                text: formatCurrency(widget.value), 
                size: 20, 
                weight: FontWeight.bold, 
                color: widget.isActive ? active : dark,
              ):
              CustomText(
                text: widget.value.toString(), 
                size: 20, 
                weight: FontWeight.bold, 
                color: widget.isActive ? active : dark,
              )
            ],
          )
        ),
      ),
    );
  }
}