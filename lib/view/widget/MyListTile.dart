// ignore_for_file: file_names

import 'package:ecommerce_app/view/widget/MyText.dart';
import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  const MyListTile(
      {super.key,
      required this.text,
      required this.iconLeading,
      required this.iconTrailing,
      required this.onTap});

  final String text;
  final IconData iconLeading;
  final IconData iconTrailing;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        title: MyText(text: text),
        leading: Icon(iconLeading),
        trailing: Icon(iconTrailing),
      ),
    );
  }
}
