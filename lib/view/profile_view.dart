import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/constance.dart';
import 'package:ecommerce_app/core/view_model/profile_view_model.dart';
import 'package:ecommerce_app/view/widget/MyAppBar.dart';
import 'package:ecommerce_app/view/widget/MyBotton.dart';
import 'package:ecommerce_app/view/widget/MyListTile.dart';
import 'package:ecommerce_app/view/widget/MyText.dart';
import 'package:ecommerce_app/view/widget/icon_broken.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        isCenter: true,
        text: MyText(
          text: 'Profile',
          textStyle: Theme.of(context).textTheme.labelLarge,
        ),
      ),
      body: GetBuilder<ProfileViewModel>(
        init: ProfileViewModel(),
        builder: (controller) {
          return SingleChildScrollView(
            child: controller.loading.value
                ? const CupertinoActivityIndicator()
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                clipBehavior: Clip.antiAlias,
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: controller.userModel != null
                                    ? CachedNetworkImage(
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                        imageUrl: controller.userModel!.image!,
                                        placeholder: (context, url) =>
                                            const Center(
                                                child:
                                                    CupertinoActivityIndicator()),
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      )
                                    : Container(),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText(
                                    text: controller.userModel!.name!,
                                    textStyle:
                                        Theme.of(context).textTheme.labelLarge!,
                                  ),
                                  MyText(
                                    text: controller.userModel!.email!,
                                    textStyle:
                                        Theme.of(context).textTheme.bodyMedium!,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 40.0),
                        MyListTile(
                          onTap: () {
                            // Get.bottomSheet(
                            //     Container(
                            //       decoration: const BoxDecoration(
                            //           color: Colors.blue,
                            //           borderRadius: BorderRadius.only(
                            //             topLeft: Radius.circular(20.0),
                            //             topRight: Radius.circular(20.0),
                            //           )),
                            //       height: 200.0,
                            //     ),
                            //     clipBehavior: Clip.antiAlias);
                            Get.defaultDialog(
                                title: 'Edit Profile',
                                titleStyle: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                                content: Column(),
                                confirm: MyBotton(
                                  onPressed: () {},
                                  text: MyText(
                                    text: 'Confirm',
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
                                  color: primaryColor,
                                ));
                          },
                          text: 'Edit Profile',
                          iconLeading: IconBroken.Edit,
                          iconTrailing: IconBroken.Arrow___Right_2,
                        ),
                        const SizedBox(height: 20.0),
                        MyListTile(
                          onTap: () {},
                          text: 'Shoping Address',
                          iconLeading: IconBroken.Location,
                          iconTrailing: IconBroken.Arrow___Right_2,
                        ),
                        const SizedBox(height: 20.0),
                        MyListTile(
                          onTap: () {},
                          text: 'Order History',
                          iconLeading: IconBroken.Time_Circle,
                          iconTrailing: IconBroken.Arrow___Right_2,
                        ),
                        const SizedBox(height: 20.0),
                        MyListTile(
                          onTap: () {},
                          text: 'Cards',
                          iconLeading: IconBroken.Wallet,
                          iconTrailing: IconBroken.Arrow___Right_2,
                        ),
                        const SizedBox(height: 20.0),
                        MyListTile(
                          onTap: () {},
                          text: 'Notifications',
                          iconLeading: IconBroken.Notification,
                          iconTrailing: IconBroken.Arrow___Right_2,
                        ),
                        const SizedBox(height: 20.0),
                        MyListTile(
                          onTap: () {
                            controller.signOut();
                          },
                          text: 'Log Out',
                          iconLeading: IconBroken.Logout,
                          iconTrailing: IconBroken.Arrow___Right_2,
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
