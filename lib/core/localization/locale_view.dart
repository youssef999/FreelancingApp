

import 'package:flutter/material.dart';
import 'package:freelancerApp/core/localization/localization_controller.dart';
import 'package:get/get.dart';
import '../resources/app_colors.dart';
import '../widgets/Custom_button.dart';
import '../widgets/custom_app_bar.dart';



class LocalView extends GetWidget<LocaleController> {
  const LocalView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('changeLang'.tr, true, 50),
      body:Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          //   mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 60,),
            CustomButton(text: 'English', onPressed: (){
              controller.changeLang('en');
            Get.offAllNamed('/bottomBar');
            }
                , color1:AppColors.buttonColor
                , color2: AppColors.buttonColor2),

            const SizedBox(height: 30,),

            CustomButton(text: 'العربية ', onPressed: (){
              controller.changeLang('ar');
             Get.offAllNamed('/bottomBar');
            }
                , color1:AppColors.buttonColor
                , color2: AppColors.buttonColor2),
          ],
        ),
      ),
    );
  }
}
