import 'package:flutter/material.dart';
import 'package:freelancerApp/core/widgets/custom_textformfield.dart';
import 'package:freelancerApp/features/auth/controllers/auth_controller.dart';
import 'package:freelancerApp/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/resources/app_colors.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    // var email, pass;
    return Scaffold(
      backgroundColor: AppColors.mainly,
      appBar: null,
      body: Form(
        child: Center(
          child: ListView(
            children: [
              const SizedBox(
                height: 100,
              ),
              Column(children: [
                Text('FREELANCING',
                    style: GoogleFonts.cairo(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondaryLightColor,
                    )),
                const Text('تسجيل الدخول',
                    style: TextStyle(
                        fontSize: 15,
                        color: AppColors.primaryDarkColor,
                        fontFamily: 'Hind'))
              ]),
              const SizedBox(
                height: 50,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                    color: AppColors.primaryDarkColor,
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                child: Column(
                  children: [
                    CustomTextFormField(hint: 'email'.tr
                    , obs: false, color:AppColors.textColorDark,
                    validateMessage: 'wrongEmail'.tr
                    , controller: controller.emailController),
                    const SizedBox(
                      height: 20,
                    ),
                     CustomTextFormField(hint: 'password'.tr
                    , obs: true, color:AppColors.textColorDark,
                    validateMessage: 'wrongPass'.tr,obx: true
                    , controller: controller.passController),
                   
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 7,
                          fixedSize: const Size(300, 60),
                          shadowColor: AppColors.darkColor,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 0.1, color: AppColors.darkColor),
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: AppColors.whiteColor),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: AppColors.primaryDarkColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      onPressed: () {
                        controller.userLogin();
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const SizedBox(
                          width: 200,
                        ),
                        TextButton(
                            onPressed: () {
                              print("heeee");
                            },
                            child: Text(
                              'Forgot\n Password ?',
                              style: TextStyle(color: AppColors.darkColor),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                        child: Text(
                      'or',
                      style:
                          TextStyle(color: AppColors.darkColor, fontSize: 20),
                    )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account ?",
                          style: TextStyle(
                              fontSize: 15, color: AppColors.darkColor),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.toNamed(Routes.REGISTER);
                          },
                          child: const Expanded(
                            child: Text(
                              'Register',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: AppColors.secondaryLightColor),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
