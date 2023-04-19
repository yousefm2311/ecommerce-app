import 'package:ecommerce_app/core/services/home_services.dart';
import 'package:ecommerce_app/model/category_model.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:flutter/material.dart';
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
        _productModel.add(ProductModel.fromJson(value[i].data() as Map));
        _loading.value = false;
      }
      update();
    });
  }

  addPrduct() async {
    _loading.value = true;
    await HomeService().addProduct(ProductModel(
      description:
          'Consequat qui sint irure est id laboris est duis cupidatat est. ',
      image:
          'https://ehabgroup.com/media/catalog/product/cache/06d35a09f18452ed935fb5b36a0a49f1/s/a/samsung_galaxy_a23_6gb_128gb_blue.jpg',
      price: '200',
      name: 'YOUSEF',
      size: 'M',
    ));
  }

  // updateProduct() async {
  //   await HomeService().update(id: 'JztyMT9l3rUFewTLQNo6',);
  // }
}
