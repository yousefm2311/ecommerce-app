// ignore_for_file: must_be_immutable

import 'package:ecommerce_app/core/services/SettingsServices.dart';
import 'package:ecommerce_app/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  SettingsServices settings = Get.find();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        centerTitle: true,
      ),
      body: Center(
        child: MaterialButton(
            onPressed: () {
              _auth.signOut();
              settings.sharedPref!.remove('uId');
              Get.offAllNamed(AppRoutes.login);
            },
            child: const Text('Logout')),
      ),
    );
  }
}
