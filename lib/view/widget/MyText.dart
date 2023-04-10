// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
   MyText({super.key, required this.text,  this.textStyle});

  final String text;
   var textStyle;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle
    );
  }
}
