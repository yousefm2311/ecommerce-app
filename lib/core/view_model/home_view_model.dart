import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/category_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  List<CategoryModel> get categoryModel => _categoryModel;
  List<CategoryModel> _categoryModel = [];
  final CollectionReference _categoryCollectionRef =
      FirebaseFirestore.instance.collection('categories');

  HomeViewModel() {
    getCategory();
  }
  getCategory() async {
    _categoryCollectionRef.get().then((value) {
      for (int i = 0; i < value.docs.length; i++) {
        // _categoryModel = [];
        _categoryModel.add(CategoryModel.formJson(value.docs[i].data() as Map));
        if (kDebugMode) {
          print(_categoryModel.map((e) => e.name));
        }
      }
      update();
    });
  }
}
