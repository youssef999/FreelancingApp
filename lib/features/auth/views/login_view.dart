import 'package:flutter/material.dart';
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
                    TextFormField(
                      controller: controller.emailController,
                      onSaved: (value) {
                        controller.emailController.text = value!;
                      },
                      validator: (value) {
                        if (value!.length > 100) {
                          return 'Email Cant Be Larger Than 100 Letter';
                        }
                        if (value.length < 4) {
                          return 'Email Cant Be Smaller Than 4 Letter';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          fillColor: AppColors.whiteColor,
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: AppColors.whiteColor),
                              borderRadius: BorderRadius.circular(20)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: AppColors.whiteColor),
                              borderRadius: BorderRadius.circular(20)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: AppColors.whiteColor),
                              borderRadius: BorderRadius.circular(20)),
                          prefixIcon: Icon(
                            Icons.account_circle_outlined,
                            color: AppColors.darkColor,
                          ),
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.black),
                          labelStyle: TextStyle(color: Colors.black),
                          labelText: 'Email'),
                      cursorColor: AppColors.darkColor,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: controller.passController,
                      onSaved: (value) {
                        controller.passController.text = value!;
                      },
                      validator: (value) {
                        if (value!.length > 100) {
                          return 'PassWord Cant Be Larger Than 100 Letter';
                        }
                        if (value.length < 4) {
                          return 'Password Cant Be Smaller Than 4 Letter';
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          fillColor: AppColors.whiteColor,
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: AppColors.whiteColor),
                              borderRadius: BorderRadius.circular(20)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: AppColors.whiteColor),
                              borderRadius: BorderRadius.circular(20)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: AppColors.whiteColor),
                              borderRadius: BorderRadius.circular(20)),
                          prefixIcon: Icon(
                            Icons.admin_panel_settings_sharp,
                            color: AppColors.darkColor,
                          ),
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.black),
                          labelStyle: TextStyle(color: Colors.black),
                          labelText: 'Password',
                          focusColor: AppColors.whiteColor),
                    ),
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
