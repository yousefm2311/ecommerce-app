import 'package:ecommerce_app/view/cart_view.dart';
import 'package:ecommerce_app/view/home_view.dart';
import 'package:ecommerce_app/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlViewModel extends GetxController {
  int currentIndex = 0;

  List<Widget> screens = [ HomeScreen(), const CartView(), const ProfileView()];
  void changeCurrentIndex(index) {
    currentIndex = index;
    update();
  }
}
