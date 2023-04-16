// ignore_for_file: file_names, must_be_immutable

import 'package:ecommerce_app/constance.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTextFormField extends StatelessWidget {
  MyTextFormField(
      {super.key,
 this.controller,
 this.perfixIcon,
      required this.isShow,
      this.suffixIcon,
      required this.text,
      this.onSave,
      this.validator,
      required this.type});

   TextEditingController? controller;
  final bool isShow;
  Widget? suffixIcon;
  final TextInputType type;
  final String text;
  Function(String?)? onSave;
  String? Function(String?)? validator;
  Widget? perfixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: type,
      controller: controller,
      onSaved: onSave,
      validator: validator,
      obscureText: isShow,
      style: TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black),
      decoration: InputDecoration(
        hintText: text,
        hintStyle: Theme.of(context).textTheme.bodyMedium,
        suffixIcon: suffixIcon,
        prefixIcon: perfixIcon,
        suffixIconColor: primaryColor,
        fillColor: Get.isDarkMode
            ? const Color.fromARGB(255, 29, 29, 29)
            : Colors.grey.shade200,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13.0),
          borderSide: BorderSide(
            width: 2.5,
            color: primaryColor.shade800,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13.0),
          borderSide: BorderSide(
            color: Get.isDarkMode ? Colors.grey.shade800 : Colors.grey.shade300,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
