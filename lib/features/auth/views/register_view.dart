import 'package:flutter/material.dart';
import 'package:freelancerApp/core/widgets/Custom_Text.dart';
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
                    Obx(() {
                      return Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: ElevatedButton(
                                onPressed: () {
                                  controller.isSelected.value = 1;
                                  controller.roleId.text = '1';
                                },
                                style: controller.isSelected.value == 1
                                    ? ButtonStyle( side: MaterialStateProperty.all(BorderSide(width: 1,color: Colors.white)),
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                AppColors.darkColor))
                                    : const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                AppColors.whiteColor)),
                                child: Text(
                                  'User',
                                  style: controller.isSelected.value == 1
                                      ? const TextStyle(color: Colors.white)
                                      : const TextStyle(color: Colors.black),
                                )),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 1,
                            child: ElevatedButton(
                                onPressed: () {
                                  controller.isSelected.value = 0;
                                  controller.roleId.text = '2';
                                },
                                style: controller.isSelected.value == 0
                                    ? ButtonStyle(
                                      side: MaterialStateProperty.all(BorderSide(width: 1,color: Colors.white)),
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                AppColors.darkColor))
                                    : const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                AppColors.whiteColor)),
                                child: Text(
                                  'Freelancer',
                                  style: controller.isSelected.value == 0
                                      ? const TextStyle(color: Colors.white)
                                      : const TextStyle(color: Colors.black),
                                )),
                          ),
                        ],
                      );
                    }),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: controller.nameController,
                      onSaved: (value) {
                        controller.nameController.text = value!;
                      },
                      validator: (value) {
                        if (value!.length > 100) {
                          return 'User Name Cant Be Larger Than 100 Letter';
                        }
                        if (value.length < 4) {
                          return 'User Name Cant Be Smaller Than 4 Letter';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          fillColor: AppColors.whiteColor,
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: AppColors.whiteColor),
                              borderRadius: BorderRadius.circular(20)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: AppColors.whiteColor),
                              borderRadius: BorderRadius.circular(20)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: AppColors.whiteColor),
                              borderRadius: BorderRadius.circular(20)),
                          prefixIcon: Icon(
                            Icons.account_circle_outlined,
                            color: AppColors.darkColor,
                          ),
                          hintText: 'User Name',
                          hintStyle: const TextStyle(color: Colors.black),
                          labelStyle: const TextStyle(color: Colors.black),
                          labelText: 'User Name'),
                      cursorColor: AppColors.darkColor,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
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
                              borderSide: const BorderSide(
                                  width: 1, color: AppColors.whiteColor),
                              borderRadius: BorderRadius.circular(20)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: AppColors.whiteColor),
                              borderRadius: BorderRadius.circular(20)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: AppColors.whiteColor),
                              borderRadius: BorderRadius.circular(20)),
                          prefixIcon: Icon(
                            Icons.email,
                            color: AppColors.darkColor,
                          ),
                          hintText: 'Email',
                          hintStyle: const TextStyle(color: Colors.black),
                          labelStyle: const TextStyle(color: Colors.black),
                          labelText: 'Email',
                          focusColor: AppColors.whiteColor),
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
                              borderSide: const BorderSide(
                                  width: 1, color: AppColors.whiteColor),
                              borderRadius: BorderRadius.circular(20)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: AppColors.whiteColor),
                              borderRadius: BorderRadius.circular(20)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: AppColors.whiteColor),
                              borderRadius: BorderRadius.circular(20)),
                          prefixIcon: Icon(
                            Icons.admin_panel_settings_sharp,
                            color: AppColors.darkColor,
                          ),
                          hintText: 'Password',
                          hintStyle: const TextStyle(color: Colors.black),
                          labelStyle: const TextStyle(color: Colors.black),
                          labelText: 'Password',
                          focusColor: AppColors.whiteColor),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Padding(
                    //   padding:
                    //       const EdgeInsets.only(top: 3.0, left: 18, right: 18),
                    //   child: GetBuilder<AuthController>(builder: (_) {
                    //     return Column(
                    //       children: [
                    //         Row(
                    //           children: [
                    //             Custom_Text(
                    //               text: 'selectCat'.tr,
                    //               fontSize: 16,
                    //               color: AppColors.textColorDark,
                    //             ),
                    //           ],
                    //         ),
                    //         const SizedBox(
                    //           height: 6,
                    //         ),
                    //         Container(
                    //           width: MediaQuery.of(context).size.width * 0.83,
                    //           decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(13),
                    //               color: Colors.grey[100]!),
                    //           child: DropdownButton<String>(
                    //             value: controller.selectedItem,
                    //             onChanged: (String? newValue) {
                    //               if (newValue != null) {
                    //                 controller.changeCatValue(newValue);
                    //               }
                    //             },
                    //             items: controller.catNames
                    //                 .map<DropdownMenuItem<String>>(
                    //                     (String value) {
                    //               return DropdownMenuItem<String>(
                    //                 value: value,
                    //                 child: Padding(
                    //                   padding: const EdgeInsets.all(8.0),
                    //                   child: Text(value),
                    //                 ),
                    //               );
                    //             }).toList(),
                    //           ),
                    //         ),
                    //       ],
                    //     );
                    //   }),
                    // ),

                    GetBuilder<AuthController>(builder: (_) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                Custom_Text(
                                  text: 'Country'.tr,
                                  fontSize: 16,
                                  color: AppColors.textColorDark,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13),
                                  color: Colors.grey[100]!),
                              child: DropdownButton<String>(
                                isExpanded: true,
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
                        controller.userSignUp();
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
