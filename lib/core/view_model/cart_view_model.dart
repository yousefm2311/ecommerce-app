import 'package:ecommerce_app/core/services/database/cart_database_helper.dart';
import 'package:ecommerce_app/model/cart_product_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CartProductModel> _cartProductModel = [];
  List<CartProductModel> get cartProductModel => _cartProductModel;

  double get totalPrice => _totalPrice;
  double _totalPrice = 0.0;

  CartViewModel() {
    getAllCartProduct();
  }

  getAllCartProduct() async {
    try {
      _loading.value = true;
      var dbHelper = CartDatabaseHelper.db;
      _cartProductModel = await dbHelper.getAllProductCart();
      if (kDebugMode) {
        print(_cartProductModel.length);
      }

      _loading.value = false;
      getTotalPrice();
    } catch (e) {
      _loading.value = false;
      if (kDebugMode) {
        print(e.toString());
      }
    }

    update();
  }

  addProductToCart(CartProductModel cartProductModel) async {
    if (_cartProductModel.isEmpty) {
      var dbHelper = CartDatabaseHelper.db;
      await dbHelper.insert(cartProductModel);
    } else {
      // bool found = false;
      // for (int i = 0; i < _cartProductModel.length; i++) {
      //   if (_cartProductModel[i].productId == cartProductModel.productId) {
      //     found = true;
      //     break;
      //   } else if (!found) {
      //     _cartProductModel = [];
      //     var dbHelper = CartDatabaseHelper.db;
      //     await dbHelper.insert(cartProductModel);
      //     break;
      //   }
      // }
      // if (!found) {}
      // bool found = _cartProductModel
      //     .any((element) => element.productId == cartProductModel.productId);
      // if (!found) {
      //   var dbHelper = CartDatabaseHelper.db;
      //   await dbHelper.insert(cartProductModel);
      // }
      if (_cartProductModel.isEmpty ||
          !_cartProductModel
              .any((p) => p.productId == cartProductModel.productId)) {
        var dbHelper = CartDatabaseHelper.db;
        await dbHelper.insert(cartProductModel);
      }
    }

    update();
  }

  getTotalPrice() {
    for (var i = 0; i < _cartProductModel.length; i++) {
      _totalPrice += (double.parse(_cartProductModel[i].price!) *
          _cartProductModel[i].quantity);

      if (kDebugMode) {
        print(_totalPrice);
      }
      update();
    }
  }

  increaseQuantity(int index) async {
    _cartProductModel[index].quantity++;

    _totalPrice += (double.parse(_cartProductModel[index].price!));
    var dbHelper = CartDatabaseHelper.db;
    await dbHelper.update(_cartProductModel[index]);

    update();
  }

  decreaseQuantity(int index) async {
    _cartProductModel[index].quantity--;

    _totalPrice -= (double.parse(_cartProductModel[index].price!));
    var dbHelper = CartDatabaseHelper.db;
    await dbHelper.update(_cartProductModel[index]);
    update();
  }
}
