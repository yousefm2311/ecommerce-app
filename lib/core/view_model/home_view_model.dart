import 'package:ecommerce_app/core/services/home_services.dart';
import 'package:ecommerce_app/model/category_model.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CategoryModel> get categoryModel => _categoryModel;
  final List<CategoryModel> _categoryModel = [];

  List<ProductModel> get productModel => _productModel;
  final List<ProductModel> _productModel = [];

  HomeViewModel() {
    getCategory();
    getBestSellingProducts();
  }
  getCategory() async {
    _loading.value = true;
    await HomeService().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        // _categoryModel = [];
        _categoryModel.add(CategoryModel.fromJson(value[i].data() as Map));
        _loading.value = false;
      }
      update();
    });
  }

  getBestSellingProducts() async {
    _loading.value = true;

    await HomeService().getProduct().then((value) {
      for (int i = 0; i < value.length; i++) {
        // _categoryModel = [];
        _productModel.add(ProductModel.fromJson(value[i].data() as Map));
        _loading.value = false;
      }
      update();
    });
  }
}
