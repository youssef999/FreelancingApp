// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:freelancerApp/core/resources/app_colors.dart';
import 'package:freelancerApp/core/widgets/custom_image_widget.dart';
import 'package:freelancerApp/features/root/controller/root_controller.dart';
import 'package:freelancerApp/routes/app_routes.dart';
import 'package:get/get.dart';

PreferredSizeWidget CustomAppBar(String text, BuildContext context) {
  final bottomNavBarController = Get.put(RootController(), permanent: false);

  return AppBar(
    backgroundColor: AppColors.whiteColor,
    elevation: bottomNavBarController.selectedIndex.value == 0 ? 0 : 0,
    centerTitle: true,
    leading: GestureDetector(
      onTap: () {
        Scaffold.of(context).openDrawer();
      },
      child: const Padding(
          padding: EdgeInsets.only(left: 24, right: 24 * 0.2),
          child: CustomImageWidget(
            path: 'assets/icon/drawer_menu.svg',
            height: 17,
            width: 17,
            color: AppColors.primaryBGLightColor,
          )),
    ),
    title: Padding(
      padding: const EdgeInsets.all(24 * 1.2),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: AppColors.primaryBGLightColor,
          fontSize: 12 * 2,
        ),
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 24 * 0.6),
        child: GestureDetector(
          onTap: () {
            Get.toNamed(Routes.PROFILE);
          },
          child: const CustomImageWidget(
            path: 'assets/icon/profile.svg',
            height: 28,
            width: 28,
            color: AppColors.primaryBGLightColor,
          ),
        ),
      )
    ],
  );
}
