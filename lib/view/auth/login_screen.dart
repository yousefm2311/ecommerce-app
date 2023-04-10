// ignore_for_file: must_be_immutable

import 'package:ecommerce_app/constance.dart';
import 'package:ecommerce_app/core/view_model/auth_view_model.dart';
import 'package:ecommerce_app/routes/routes.dart';
import 'package:ecommerce_app/view/widget/MyAppBar.dart';
import 'package:ecommerce_app/view/widget/MyBotton.dart';
import 'package:ecommerce_app/view/widget/MyText.dart';
import 'package:ecommerce_app/view/widget/MyTextField.dart';
import 'package:ecommerce_app/view/widget/containerOptions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  LoginScreen({super.key});

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        text: MyText(
          text: 'Login',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40.0),
              Text(
                'Login in with one of the following options',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Expanded(
                    child: MyOptionsContainer(
                      height: 65.0,
                      width: double.infinity,
                      onTap: () {
                        controller.googleSignIn();
                      },
                      icon: MdiIcons.google,
                      iconSize: 40,
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  Expanded(
                    child: MyOptionsContainer(
                      onTap: () {
                        controller.facebookSignIn();
                      },
                      width: double.infinity,
                      height: 65.0,
                      icon: MdiIcons.facebook,
                      iconSize: 40,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40.0),
              MyText(
                text: 'Email',
                textStyle: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 10.0),
              MyTextFormField(
                type: TextInputType.emailAddress,
                onSave: (value) {},
                validator: (value) {
                  return null;
                },
                text: 'Enter Your Email Address',
                controller: emailController,
                isShow: false,
              ),
              const SizedBox(height: 20.0),
              MyText(
                text: 'Password',
                textStyle: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 10.0),
              MyTextFormField(
                type: TextInputType.visiblePassword,
                onSave: (value) {},
                validator: (value) {
                  return null;
                },
                text: 'Enter Your Password',
                suffixIcon: const Icon(Icons.visibility_rounded),
                controller: passwordController,
                isShow: true,
              ),
              const SizedBox(height: 10.0),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: InkWell(
                  onTap: () {},
                  child: MyText(
                    text: 'forgot password ? ',
                    textStyle: TextStyle(color: primaryColor.shade500),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              MyBotton(
                height: 60,
                color: primaryColor,
                onPressed: () {},
                width: double.infinity,
                text: MyText(
                  text: 'Sign In',
                  textStyle: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              MyBotton(
                height: 60,
                borderShow: true,
                onPressed: () {
                  Get.toNamed(AppRoutes.register);
                },
                width: double.infinity,
                text: MyText(
                  text: 'Register',
                  textStyle: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
