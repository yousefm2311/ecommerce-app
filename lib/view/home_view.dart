// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/view_model/home_view_model.dart';
import 'package:ecommerce_app/view/details_view.dart';
import 'package:ecommerce_app/view/widget/MyText.dart';
import 'package:ecommerce_app/view/widget/icon_broken.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  HomeViewModel c = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(builder: (controller) {
      return Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     controller.addPrduct();
        //   },
        //   child: const Icon(Icons.add),
        // ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 70.0, left: 20.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _searchTexztFormField(),
                const SizedBox(height: 30.0),
                MyText(
                  text: 'Category',
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                const SizedBox(height: 30.0),
                _listViewCategory(),
                const SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                      text: 'Best Selling',
                      textStyle: Theme.of(context).textTheme.bodyLarge,
                    ),
                    MyText(
                      text: 'See All',
                      textStyle: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                const SizedBox(height: 30.0),
                _listViewProducts(),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _searchTexztFormField() => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Get.isDarkMode ? Colors.grey.shade800 : Colors.grey.shade200,
        ),
        child: TextFormField(
          decoration: const InputDecoration(
            prefixIcon: Icon(IconBroken.Search),
            border: InputBorder.none,
          ),
        ),
      );

  Widget _listViewCategory() {
    return GetBuilder<HomeViewModel>(builder: (controller) {
      return controller.loading.value
          ? const Center(child: CupertinoActivityIndicator())
          : SizedBox(
              height: 100.0,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Get.isDarkMode
                                ? Colors.grey.shade800
                                : Colors.grey.shade100),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.grey.shade100),
                            child: CachedNetworkImage(
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                              imageUrl: controller.categoryModel[index].image!,
                              placeholder: (context, url) => const Center(
                                  child: CupertinoActivityIndicator()),
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                )),
                              ),
                            ),
                          ),
                        ),
                      ),
                      MyText(
                        text: controller.categoryModel[index].name!,
                        textStyle: Theme.of(context).textTheme.bodyLarge,
                      )
                    ],
                  );
                },
                scrollDirection: Axis.horizontal,
                itemCount: controller.categoryModel.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width: 20);
                },
              ),
            );
    });
  }

  Widget _listViewProducts() {
    return GetBuilder<HomeViewModel>(builder: (controller) {
      return controller.loading.value
          ? const Center(child: CupertinoActivityIndicator())
          : SizedBox(
              height: 350.0,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(DetailsView(
                              productModel: controller.productModel[index]));
                        },
                        child: Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          width: MediaQuery.of(context).size.width * .42,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Get.isDarkMode
                                ? Colors.grey.shade800
                                : Colors.grey.shade100,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 230,
                                width: 200,
                                child: CachedNetworkImage(
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                  imageUrl:
                                      controller.productModel[index].image!,
                                  placeholder: (context, url) => const Center(
                                      child: CupertinoActivityIndicator()),
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    )),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyText(
                                        text: controller
                                            .productModel[index].name!,
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .labelLarge),
                                    MyText(
                                      text:
                                          '${controller.productModel[index].description}',
                                      textStyle: const TextStyle(
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                    const SizedBox(height: 10.0),
                                    MyText(
                                      text:
                                          '\$${controller.productModel[index].price}',
                                      textStyle: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.blueAccent,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20.0),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
                scrollDirection: Axis.horizontal,
                itemCount: controller.productModel.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width: 20);
                },
              ),
            );
    });
  }
}
