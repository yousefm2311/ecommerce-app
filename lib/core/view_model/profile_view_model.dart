// ignore_for_file: unrelated_type_equality_checks

import 'package:ecommerce_app/core/services/SettingsServices.dart';
import 'package:ecommerce_app/routes/routes.dart';
import 'package:ecommerce_app/util/local_storage_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileViewModel extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final LocalStorageData localStorageData = Get.put(LocalStorageData());
  final SettingsServices services = Get.put(SettingsServices());

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
