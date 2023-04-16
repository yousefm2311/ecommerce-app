import 'package:ecommerce_app/view/widget/MyText.dart';
import 'package:flutter/material.dart';


class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MyText(text: 'Profile view'),
      ),
    );
  }
}