import 'package:ecommerce_app/constance.dart';
import 'package:ecommerce_app/core/view_model/profile_view_model.dart';
import 'package:ecommerce_app/view/widget/MyBotton.dart';
import 'package:ecommerce_app/view/widget/MyText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GetBuilder<ProfileViewModel>(
            init: ProfileViewModel(),
            builder: (controller) {
              return MyBotton(
                color: primaryColor,
                onPressed: () {
                  controller.signOut();
                },
                text: MyText(
                  text: 'Sign Out',
                  textStyle: Theme.of(context).textTheme.displaySmall,
                ),
                width: 150,
                height: 60,
              );
            }),
      ),
    );
  }
}
