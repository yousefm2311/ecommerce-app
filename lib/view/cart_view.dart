import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/constance.dart';
import 'package:ecommerce_app/core/view_model/cart_view_model.dart';
import 'package:ecommerce_app/model/cart_product_model.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/view/widget/MyBotton.dart';
import 'package:ecommerce_app/view/widget/MyText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<CartViewModel>(
          init: CartViewModel(),
          builder: (controller) {
            return controller.loading.value
                ? const Center(child: CupertinoActivityIndicator())
                : Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            return _cartView(context,
                                controller.cartProductModel[index], index);
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(),
                          itemCount: controller.cartProductModel.length,
                        ),
                      ),
                      Container(
                        height: 75,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText(
                                    text: 'TOTAL',
                                    textStyle:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  MyText(
                                    text: ' \$ ${controller.totalPrice} ',
                                    textStyle: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              MyBotton(
                                  color: primaryColor,
                                  onPressed: () {},
                                  text: const Text(
                                    'CHECKOUT',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  width: 150,
                                  height: 50)
                            ],
                          ),
                        ),
                      )
                    ],
                  );
          }),
    );
  }

  Widget _cartView(context, CartProductModel model, index) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Row(
        children: [
          Container(
            width: 130,
            height: 130,
            decoration: BoxDecoration(color: Colors.grey.shade100),
            child: CachedNetworkImage(
              errorWidget: (context, url, error) => const Icon(Icons.error),
              imageUrl: model.image!,
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
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: SizedBox(
                height: 130,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyText(
                      text: model.name!,
                      textStyle: Theme.of(context).textTheme.labelLarge,
                    ),
                    MyText(
                      text: '\$ ${model.price}  ',
                      textStyle: Theme.of(context).textTheme.bodyLarge,
                    ),
                    GetBuilder<CartViewModel>(builder: (controller) {
                      return Row(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                            ),
                            child: Center(
                              child: Center(
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    controller.increaseQuantity(
                                      index,
                                    );
                                  },
                                  icon: const Icon(Icons.add),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 2),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                            ),
                            child: Center(
                                child: MyText(
                                    text:
                                        '${controller.cartProductModel[index].quantity}')),
                          ),
                          const SizedBox(width: 2),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                            ),
                            child: Center(
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  controller.decreaseQuantity(index);
                                },
                                icon: const Icon(Icons.remove),
                              ),
                            ),
                          ),
                        ],
                      );
                    })
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
