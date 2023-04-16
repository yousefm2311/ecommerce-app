// ignore_for_file: must_be_immutable

import 'package:ecommerce_app/core/services/SettingsServices.dart';
import 'package:ecommerce_app/core/view_model/home_view_model.dart';
import 'package:ecommerce_app/view/widget/MyText.dart';
import 'package:ecommerce_app/view/widget/icon_broken.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<String> items = [
    'Yousef ',
    'Yousef ',
    'Yousef ',
    'Yousef ',
    'Yousef ',
  ];

  SettingsServices settings = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
        init: HomeViewModel(),
        builder: (controller) {
          return Scaffold(
            body: Container(
              padding:
                  const EdgeInsets.only(top: 70.0, left: 20.0, right: 20.0),
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
          );
        });
  }

  Widget _searchTexztFormField() => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.grey.shade200,
        ),
        child: TextFormField(
          decoration: const InputDecoration(
            prefixIcon: Icon(IconBroken.Search),
            border: InputBorder.none,
          ),
        ),
      );

  Widget _listViewCategory() {
    return SizedBox(
      height: 100.0,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Colors.grey.shade100),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.sports_football_sharp,
                    size: 50,
                  ),
                ),
              ),
              MyText(text: items[index])
            ],
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 20);
        },
      ),
    );
  }

  Widget _listViewProducts() {
    return SizedBox(
      height: 350.0,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                width: MediaQuery.of(context).size.width * .42,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.grey.shade100,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/watch.jpg',
                    ),
                    const SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                              text: items[index],
                              textStyle:
                                  Theme.of(context).textTheme.labelLarge),
                          MyText(text: 'Bang and Olu'),
                          const SizedBox(height: 10.0),
                          MyText(
                            text: '\$755',
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
            ],
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 20);
        },
      ),
    );
  }
}
