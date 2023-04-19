import 'package:ecommerce_app/core/view_model/control_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconly/iconly.dart';

class ControlView extends StatelessWidget {
  const ControlView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControlViewModel>(
      init: ControlViewModel(),
      builder: (controller) {
      return Scaffold(
        body: controller.screens[controller.currentIndex],
        bottomNavigationBar: bottomNavigationBar(),
      );
    });
  }

  Widget bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(

      builder: (controller) {
      return BottomNavigationBar(
        currentIndex: controller.currentIndex,
        onTap: (value) {
          controller.changeCurrentIndex(value);
        },
        items: const [
          BottomNavigationBarItem(
            activeIcon: Icon(IconlyBold.home),
            label: '',
            icon: Icon(IconlyLight.home),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(IconlyBold.bag),
            label: '',
            icon: Icon(IconlyLight.bag),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(IconlyBold.profile),
            label: '',
            icon: Icon(IconlyLight.profile),
          ),
        ],
      );
    });
  }
}
