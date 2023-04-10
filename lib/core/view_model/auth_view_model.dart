// ignore_for_file: unused_field, unused_local_variable, import_of_legacy_library_into_null_safe

import 'package:ecommerce_app/core/services/SettingsServices.dart';
import 'package:ecommerce_app/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FacebookLogin _facebookLogin = FacebookLogin();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Rx<User?>? _user;
  // String? get user => _user!.value!.email;

  bool visibility = true;
  void isVisibility() {
    visibility = !visibility;
    update();
  }

  void googleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser!.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      await _auth.signInWithCredential(credential);
    } on PlatformException catch (e) {
      if (e.code == 'sign_in_canceled') {
        Get.snackbar('Cancel', e.toString());
      } else {
        rethrow;
      }
    }
  }

  void facebookSignIn() async {
    final FacebookLoginResult facebookUser = await _facebookLogin.logIn();

    final accessToken = facebookUser.accessToken!.token;
// if user is login
    if (facebookUser.status == FacebookLoginStatus.success) {
      final facebookCredential = FacebookAuthProvider.credential(accessToken);
      UserCredential userCredential =
          await _auth.signInWithCredential(facebookCredential);
      if (kDebugMode) {
        print(userCredential.user!.displayName);
      }
    }
  }

  RxBool isLoading = false.obs;

  var shared = Get.put(SettingsServices());
  void signInWithEmailAndPassword() async {
    try {
      isLoading.value = true;
      final credential = await _auth
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((value) {
        if (kDebugMode) {
          print(value);
        }
        isLoading.value = false;
        shared.sharedPref!.setString('uId', value.user!.uid);
        Get.offAllNamed(AppRoutes.home);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar("Error", 'No user found for that email.');
        isLoading.value = false;
      } else if (e.code == 'wrong-password') {
        Get.snackbar("Error", 'Wrong password provided for that user.');
        isLoading.value = false;
      }
    }
  }

  void createAccountWithEmailAndPassword() async {
    try {
      isLoading.value = true;
      await _auth
          .createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text)
          .then((value) {
        if (kDebugMode) {
          print(value.user!.email);
        }
        Get.snackbar(
          'success',
          'Created successfully',
          backgroundColor: Colors.green.shade400,
          colorText: Colors.white,
        );
        isLoading.value = false;
        Get.offAllNamed(AppRoutes.home);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        if (kDebugMode) {
          print('The password provided is too weak.');
          Get.snackbar('Error password', 'The password provided is too weak.');
        }
      } else if (e.code == 'email-already-in-use') {
        if (kDebugMode) {
          print('The account already exists for that email.');
          Get.snackbar('Error create account',
              'The account already exists for that email.');
        }
      }
      isLoading.value = false;
    } catch (e) {
      Get.snackbar('Error create account', e.toString());
      isLoading.value = false;
    }
  }
}
