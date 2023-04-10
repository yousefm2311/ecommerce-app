// ignore_for_file: must_be_immutable

import 'package:ecommerce_app/constance.dart';
import 'package:ecommerce_app/routes/routes.dart';
import 'package:ecommerce_app/view/widget/MyAppBar.dart';
import 'package:ecommerce_app/view/widget/MyBotton.dart';
import 'package:ecommerce_app/view/widget/MyText.dart';
import 'package:ecommerce_app/view/widget/MyTextField.dart';
import 'package:ecommerce_app/view/widget/containerOptions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        leading: Padding(
          padding: const EdgeInsets.all(6.0),
          child: MyOptionsContainer(
            height: 10,
            onTap: () {
              Get.back();
            },
            width: 10,
            icon: Icons.arrow_back_ios_new_rounded,
            iconSize: 20,
          ),
        ),
        text: MyText(
          text: 'Sign Up',
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
                'Sign Up in with one of the following options',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Expanded(
                    child: MyOptionsContainer(
                      height: 65.0,
                      width: double.infinity,
                      icon: MdiIcons.google,
                      iconSize: 40,
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  Expanded(
                    child: MyOptionsContainer(
                      width: double.infinity,
                      height: 65.0,
                      icon: MdiIcons.facebook,
                      iconSize: 40,
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40.0),
              MyText(
                text: 'Name',
                textStyle: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10.0),
              MyTextFormField(
                type: TextInputType.name,
                onSave: (value) {},
                validator: (value) {
                  return null;
                },
                text: 'Enter Your Name',
                controller: emailController,
                isShow: false,
              ),
              const SizedBox(height: 20.0),
              MyText(
                text: 'Email',
                textStyle: const TextStyle(fontSize: 16),
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
                textStyle: const TextStyle(fontSize: 16),
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
              const SizedBox(height: 20.0),
              MyBotton(
                height: 60,
                color: primaryColor,
                onPressed: () {},
                width: double.infinity,
                text: MyText(
                  text: 'Create Account',
                  textStyle: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                    text: 'Already have an account?',
                    textStyle: const TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                  const SizedBox(width: 5),
                  InkWell(
                    onTap: () {
                      Get.offAllNamed(AppRoutes.login);
                    },
                    child: MyText(
                      text: 'Login',
                      textStyle: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: primaryColor.shade300,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
