// ignore_for_file: unrelated_type_equality_checks

import 'package:ecommerce_app/core/services/SettingsServices.dart';
import 'package:ecommerce_app/model/user_model.dart';
import 'package:ecommerce_app/routes/routes.dart';
import 'package:ecommerce_app/util/local_storage_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileViewModel extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final LocalStorageData localStorageData = Get.put(LocalStorageData());
  final SettingsServices services = Get.put(SettingsServices());

  ValueNotifier<bool> get loading => _loading;

  final ValueNotifier<bool> _loading = ValueNotifier(false);

  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }

  UserModel? get userModel => _userModel;
  UserModel? _userModel;

  void getCurrentUser() async {
    _loading.value = true;
    await localStorageData.getUser.then((value) {
      _userModel = value;
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
    _loading.value = false;
    update();
  }

  Future<void> signOut() async {
    if (GoogleSignIn() == true) {
      GoogleSignIn().signOut().then((value) {
        localStorageData.deleteUser();
        Get.offAllNamed(AppRoutes.login);
      });
    } else {
      await _auth.signOut().then((value) {
        localStorageData.deleteUser();
        Get.offAllNamed(AppRoutes.login);
      });
    }
  }
}
