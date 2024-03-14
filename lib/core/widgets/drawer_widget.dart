// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:freelancerApp/core/resources/app_colors.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        width: MediaQuery.of(context).size.width / 1.34,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topRight: Radius.circular(
            24 * 2,
          ),
        )),
        backgroundColor: AppColors.secondaryLightColor,
        child: ListView(
          children: [
            _backIcon(),
            _drawerWidget(context),
          ],
        ),
      ),
    );
  }

  _drawerWidget(BuildContext context) {
    return const  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [],
    );
  }

  _backIcon() {
    return GestureDetector(
      onTap: () {
        Get.close(1);
      },
      child: const Padding(
        padding: EdgeInsets.only(top: 24 * 0.4, left: 24 * 0.6),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Icon(
            Iconsax.arrow_left,
            color: AppColors.primaryLightTextColor,
          ),
        ),
      ),
    );
  }
}
