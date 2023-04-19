// ignore_for_file: unnecessary_null_comparison, await_only_futures, unnecessary_string_interpolations

import 'dart:convert';

import 'package:ecommerce_app/constance.dart';
import 'package:ecommerce_app/core/services/SettingsServices.dart';
import 'package:ecommerce_app/model/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class LocalStorageData extends GetxController {
  SettingsServices settings = Get.put(SettingsServices());

  Future<UserModel?> get getUser async {
    try {
      UserModel userModel = await _getUserData();
      if (userModel == null) {
        return null;
      }
      return userModel;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return null;
  }

  setUser(UserModel userModel) async {
    await settings.sharedPref!
        .setString('$CACHEDUSERDATA', json.encode(userModel.toJson()));
  }

  _getUserData() async {
    var value = await settings.sharedPref!.getString('$CACHEDUSERDATA');
    return UserModel.fromJson(json.decode(value!));
  }

  void deleteUser() async {
    await settings.sharedPref!.clear();
  }
}
