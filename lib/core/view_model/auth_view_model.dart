// ignore_for_file: unused_field, unused_local_variable, import_of_legacy_library_into_null_safe

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FacebookLogin _facebookLogin = FacebookLogin();

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
    final FacebookLoginResult facebookUser =
        await _facebookLogin.logIn(permissions: [FacebookPermission.email]);

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
}
