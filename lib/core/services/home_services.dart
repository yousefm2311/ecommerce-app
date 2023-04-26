import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:flutter/foundation.dart';

class HomeService {
  final CollectionReference _categoryCollectionRef =
      FirebaseFirestore.instance.collection('categories');

  final CollectionReference _productCollectionRef =
      FirebaseFirestore.instance.collection('product');

  Future<List<QueryDocumentSnapshot>> getCategory() async {
    var value = await _categoryCollectionRef.get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getProduct() async {
    var value = await _productCollectionRef.get();
    return value.docs;
  }

  addProduct(ProductModel model) async {
    return await _productCollectionRef.add(model.toMap()).then(
      (value) {
        update(id: value.id, model);
      },
    ).catchError(
      (error) {},
    );
  }

  update(ProductModel model, {required id}) async {
    ProductModel productModel = ProductModel(
      description: model.description,
      image: model.image,
      price: model.price,
      name: model.name,
      size: model.size,
      productId: id,
    );

    return await _productCollectionRef
        .doc(id)
        .update(productModel.toMap())
        .then((value) {
      print('yes');
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
