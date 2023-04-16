import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/user_model.dart';
import 'package:flutter/foundation.dart';

class FireStoreUser {
  final CollectionReference _userCollectionRef =
      FirebaseFirestore.instance.collection('users');

  Future<void> addUserToFireStore(UserModel userModel) async {
    return await _userCollectionRef
        .doc(userModel.uId)
        .set(userModel.toJson())
        .then((value) {})
        .catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
