import 'package:ecommerce_app/core/services/SettingsServices.dart';
import 'package:ecommerce_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthMiddleWare extends GetMiddleware {
  var shared = Get.put(SettingsServices());

  @override
  RouteSettings? redirect(String? route) {
    if (shared.sharedPref!.getString('uId') != null) {
      return RouteSettings(name: AppRoutes.home);
    }
    return null;
  }
}
