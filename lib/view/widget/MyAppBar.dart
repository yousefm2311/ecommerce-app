// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  MyAppBar({super.key, required this.text, this.leading, this.actions});
  final Widget text;
  Widget? leading;
  List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleTextStyle: TextStyle(
          color: Get.isDarkMode ? Colors.white : Colors.black,
          fontSize: 22.0,
          fontWeight: FontWeight.bold),
      elevation: 0.0,
      title: text,
      leading: leading,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
