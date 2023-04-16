import 'package:ecommerce_app/view/widget/MyText.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MyText(text: 'Cart view'),
      ),
    );
  }
}
