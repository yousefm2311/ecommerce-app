// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyOptionsContainer extends StatelessWidget {
  MyOptionsContainer({
    super.key,
    required this.icon,
    this.color,
    this.colorIcon,
    required this.width,
    required this.height,
    this.iconSize = 30,
    this.onTap,
  });
  final IconData icon;
  Color? color;
  Color? colorIcon;
  final double width;
  final Function()? onTap;
  final double height;
  double iconSize;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Get.isDarkMode
              ? const Color.fromARGB(255, 29, 29, 29)
              : Colors.grey.shade200,
          border: Border.all(
              color:
                  Get.isDarkMode ? Colors.grey.shade800 : Colors.grey.shade300,
              width: 2.0),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Icon(
          icon,
          size: iconSize,
          color: colorIcon,
        ),
      ),
    );
  }
}
