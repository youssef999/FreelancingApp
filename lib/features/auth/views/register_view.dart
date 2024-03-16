import 'package:flutter/material.dart';
import 'package:freelancerApp/core/widgets/Custom_Text.dart';
import 'package:freelancerApp/core/widgets/custom_textformfield.dart';
import 'package:freelancerApp/features/auth/controllers/auth_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/resources/app_colors.dart';

class SignUpView extends GetView<AuthController> {
  const SignUpView({super.key});

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
                const Text('انشيء حساب جديد',
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
                  , obs: false, color: AppColors.textColorDark
                 , icon:Icons.email
                  , controller: controller.emailController),
                    const SizedBox(
                      height: 20,
                    ),
                       CustomTextFormField(hint: 'name'.tr
                  , obs: false, color: AppColors.textColorDark,icon:Icons.person
                  , controller: controller.nameController),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(hint: 'password'.tr
                  , obs: true,
                  obx: true,
                   color: AppColors.textColorDark
                  , controller: controller.passController),
                  
                  
                   
                    // TextFormField(
                    //   keyboardType: TextInputType.visiblePassword,
                    //   controller: controller.passController,
                    //   onSaved: (value) {
                    //     controller.passController.text = value!;
                    //   },
                    //   validator: (value) {
                    //     if (value!.length > 100) {
                    //       return 'PassWord Cant Be Larger Than 100 Letter';
                    //     }
                    //     if (value.length < 4) {
                    //       return 'Password Cant Be Smaller Than 4 Letter';
                    //     }
                    //     return null;
                    //   },
                    //   obscureText: true,
                    //   decoration: InputDecoration(
                    //       fillColor: AppColors.whiteColor,
                    //       filled: true,
                    //       border: OutlineInputBorder(
                    //           borderSide: BorderSide(
                    //               width: 1, color: AppColors.whiteColor),
                    //           borderRadius: BorderRadius.circular(20)),
                    //       focusedBorder: OutlineInputBorder(
                    //           borderSide: BorderSide(
                    //               width: 1, color: AppColors.whiteColor),
                    //           borderRadius: BorderRadius.circular(20)),
                    //       enabledBorder: OutlineInputBorder(
                    //           borderSide: BorderSide(
                    //               width: 1, color: AppColors.whiteColor),
                    //           borderRadius: BorderRadius.circular(20)),
                    //       prefixIcon: Icon(
                    //         Icons.admin_panel_settings_sharp,
                    //         color: AppColors.darkColor,
                    //       ),
                    //       hintText: 'Password',
                    //       hintStyle: TextStyle(color: Colors.black),
                    //       labelStyle: TextStyle(color: Colors.black),
                    //       labelText: 'Password',
                    //       focusColor: AppColors.whiteColor),
                    // ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 3.0, left: 18, right: 18),
                      child: GetBuilder<AuthController>(builder: (_) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                Custom_Text(
                                  text: 'selectCat'.tr,
                                  fontSize: 16,
                                  color: AppColors.textColorDark,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.83,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13),
                                  color: Colors.grey[100]!),
                              child: DropdownButton<String>(
                                value: controller.selectedItem,
                                onChanged: (String? newValue) {
                                  if (newValue != null) {
                                    controller.changeCatValue(newValue);
                                  }
                                },
                                items: controller.catNames
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(value),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        );
                      }),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 3.0, left: 18, right: 18),
                      child: GetBuilder<AuthController>(builder: (_) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                Custom_Text(
                                  text: 'selectCountry'.tr,
                                  fontSize: 16,
                                  color: AppColors.textColorDark,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.83,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13),
                                  color: Colors.grey[100]!),
                              child: DropdownButton<String>(
                                value: controller.selectedCountry,
                                onChanged: (String? newValue) {
                                  if (newValue != null) {
                                    controller.changeCountryValue(newValue);
                                  }
                                },
                                items: controller.countryNames
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(value),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        );
                      }),
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
                        "Register",
                        style: TextStyle(
                          color: AppColors.primaryDarkColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      onPressed: () {
                        controller.userLogin();
                      },
                    ),
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
