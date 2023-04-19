// ignore_for_file: must_be_immutable

import 'package:ecommerce_app/constance.dart';
import 'package:ecommerce_app/core/view_model/auth_view_model.dart';
import 'package:ecommerce_app/routes/routes.dart';
import 'package:ecommerce_app/view/widget/MyAppBar.dart';
import 'package:ecommerce_app/view/widget/MyBotton.dart';
import 'package:ecommerce_app/view/widget/MyText.dart';
import 'package:ecommerce_app/view/widget/MyTextField.dart';
import 'package:ecommerce_app/view/widget/containerOptions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LoginView extends GetWidget<AuthViewModel> {
  const LoginView({super.key});

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
          child: Form(
            key: controller.formKey,
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
                  controller: controller.emailController,
                  type: TextInputType.emailAddress,
                  onSave: (value) {},
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email is required';
                    }
                    return null;
                  },
                  text: 'Enter Your Email Address',
                  isShow: false,
                ),
                const SizedBox(height: 20.0),
                MyText(
                  text: 'Password',
                  textStyle: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 10.0),
                GetBuilder<AuthViewModel>(builder: (context) {
                  return MyTextFormField(
                    controller: controller.passwordController,
                    type: TextInputType.visiblePassword,
                    onSave: (value) {},
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password is required';
                      }
                      return null;
                    },
                    text: 'Enter Your Password',
                    suffixIcon: IconButton(
                      onPressed: () {
                        context.isVisibility();
                      },
                      icon: context.visibility
                          ? const Icon(Icons.visibility_rounded)
                          : const Icon(Icons.visibility_off_rounded),
                    ),
                    isShow: context.visibility,
                  );
                }),
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
                GetX<AuthViewModel>(builder: (c) {
                  return MyBotton(
                    height: 60,
                    color: primaryColor,
                    onPressed: () {
                      c.formKey.currentState!.save();
                      if (c.formKey.currentState!.validate()) {
                        c.signInWithEmailAndPassword();
                      }
                    },
                    width: double.infinity,
                    text: c.isLoading.value
                        ? const CupertinoActivityIndicator(
                            color: Colors.white,
                          )
                        : MyText(
                            text: 'Sign In',
                            textStyle: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                  );
                }),
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
      ),
    );
  }
}
