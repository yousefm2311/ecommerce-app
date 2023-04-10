// ignore_for_file: file_names

import 'package:flutter/material.dart';

class MyBotton extends StatelessWidget {
  const MyBotton(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.color,
      required this.width,
      required this.height});

  final Function() onPressed;
  final Widget text;
  final Color color;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(13.0)),
      child: MaterialButton(
        onPressed: onPressed,
        child: text,
      ),
    );
  }
}
