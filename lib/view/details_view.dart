import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/constance.dart';
import 'package:ecommerce_app/core/view_model/cart_view_model.dart';
import 'package:ecommerce_app/model/cart_product_model.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/view/widget/MyBotton.dart';
import 'package:ecommerce_app/view/widget/MyText.dart';
import 'package:ecommerce_app/view/widget/icon_broken.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.productModel});

  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 22),
            width: MediaQuery.of(context).size.width,
            height: 250.0,
            child: Stack(
              children: [
                CachedNetworkImage(
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  imageUrl: productModel.image!,
                  placeholder: (context, url) =>
                      const Center(child: CupertinoActivityIndicator()),
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(
                          IconBroken.Arrow___Left_2,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                      Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: const Icon(IconBroken.Heart),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: '${productModel.name}',
                      textStyle: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(14),
                          width: MediaQuery.of(context).size.width * .4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(width: 1, color: Colors.grey)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              MyText(
                                  text: 'Size  : ',
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge),
                              MyText(
                                  text: productModel.size!,
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(14),
                          width: MediaQuery.of(context).size.width * .4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(width: 1, color: Colors.grey)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              MyText(
                                  text: 'Color  : ',
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge),
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                    color: productModel.color ,
                                    borderRadius:
                                        BorderRadiusDirectional.circular(5)),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 30),
                    MyText(
                      text: "Details",
                      textStyle: Theme.of(context).textTheme.labelLarge,
                    ),
                    const SizedBox(height: 20),
                    MyText(
                      text: productModel.description!,
                      textStyle: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 75,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        text: 'Price',
                        textStyle: Theme.of(context).textTheme.bodyLarge,
                      ),
                      MyText(
                        text: ' \$ ${productModel.price!} ',
                        textStyle: const TextStyle(
                          fontSize: 18,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  GetBuilder<CartViewModel>(
                      init: CartViewModel(),
                      builder: (controller) {
                        return MyBotton(
                            color: primaryColor,
                            onPressed: () {
                              controller.addProductToCart(
                                CartProductModel(
                                    name: productModel.name,
                                    image: productModel.image,
                                    price: productModel.price,
                                    quantity: 1,
                                    productId: productModel.productId),
                              );
                            },
                            text: const Text(
                              'Add',
                              style: TextStyle(color: Colors.white),
                            ),
                            width: 150,
                            height: 50);
                      })
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
