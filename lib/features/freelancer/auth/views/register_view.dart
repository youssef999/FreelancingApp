import 'package:flutter/material.dart';
import 'package:freelancerApp/core/resources/app_assets.dart';
import 'package:freelancerApp/core/resources/app_colors.dart';
import 'package:freelancerApp/core/widgets/Custom_Text.dart';
import 'package:freelancerApp/core/widgets/Custom_button.dart';
import 'package:freelancerApp/core/widgets/custom_app_bar.dart';
import 'package:get/get.dart';
import '../../../../core/widgets/custom_textformfield.dart';
import '../controllers/auth_controller.dart';
import 'login_view.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {

  final controller=Get.put(AuthController());

  @override
  void initState() {
   controller.getAllCategories();
   controller.getAllCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBar('signup'.tr,true,50),
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                decoration:BoxDecoration(
                    borderRadius:BorderRadius.circular(21),
                    color:AppColors.lightColor
                ),
                height: 180,
                width:MediaQuery.of(context).size.width,
                child:Image.asset(AppAssets.logo,
                  //   fit:BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:3.0,left:18,right:18),
                child: SizedBox(
                  height:82,
                  child: CustomTextFormField(
                    hint: 'email'.tr,
                    obx: false,
                    type: TextInputType.emailAddress,
                    obs: false,
                    color: AppColors.textColorDark,
                    controller: controller.emailController,),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(top:3.0,left:18,right:18),
                child: SizedBox(
                  height:82,
                  child: CustomTextFormField(
                    hint: 'name'.tr,
                    obx: false,
                    type: TextInputType.name,
                    obs: false,
                    color: AppColors.textColorDark,
                    controller: controller.nameController,),
                ),
              ),
              const SizedBox(
                height: 15,
              ),

              Padding(
                padding: const EdgeInsets.only(top:3.0,left:18,right:18),
                child: GetBuilder<AuthController>(
                  builder: (_) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Custom_Text(text: 'selectCat'.tr,
                            fontSize: 16,color:AppColors.textColorDark,
                            ),
                          ],
                        ),
                        const SizedBox(height: 6,),
                        Container(
                          width:MediaQuery.of(context).size.width*0.83,
                          decoration:BoxDecoration(
                            borderRadius:BorderRadius.circular(13),
                            color:Colors.grey[100]!
                          ),
                          child: DropdownButton<String>(
                            value:controller.selectedItem,
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                controller.changeCatValue(newValue);
                              }
                            },
                            items: controller.catNames.map<DropdownMenuItem<String>>((String value) {
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
                  }
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(top:3.0,left:18,right:18),
                child: GetBuilder<AuthController>(
                    builder: (_) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Custom_Text(text: 'selectCountry'.tr,
                                fontSize: 16,color:AppColors.textColorDark,
                              ),
                            ],
                          ),
                          const SizedBox(height: 6,),
                          Container(
                            width:MediaQuery.of(context).size.width*0.83,
                            decoration:BoxDecoration(
                                borderRadius:BorderRadius.circular(13),
                                color:Colors.grey[100]!
                            ),
                            child: DropdownButton<String>(
                              value:controller.selectedCountry,
                              onChanged: (String? newValue) {
                                if (newValue != null) {
                                  controller.changeCountryValue(newValue);
                                }
                              },
                              items: controller.countryNames.
                              map<DropdownMenuItem<String>>((String value) {
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
                    }
                ),
              ),
              const SizedBox(
                height: 15,
              ),



              Padding(
                padding: const EdgeInsets.only(top:3.0,left:18,right:18),
                child: SizedBox(
                  height: 82,
                  child: CustomTextFormField(
                      hint: 'password'.tr,
                      obx: true,
                      type: TextInputType.visiblePassword,
                      obs: true,
                      color: AppColors.textColorDark,
                      controller: controller.passController),
                ),
              ),



              GetBuilder<AuthController>(
                  builder: (_) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        (controller.loading==true)?
                        CustomButton(
                            text: "signup".tr,
                            onPressed: () {
                              controller.userSignUp();
                            },
                            color1: AppColors.buttonColor,
                            color2: Colors.white):const Center(
                          child:CircularProgressIndicator(),
                        )
                      ],
                    );
                  }
              ),

              const SizedBox(
                height: 16,
              ),


              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Custom_Text(
                      text: 'haveAccount'.tr,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      alignment: Alignment.center,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Custom_Text(
                        text: 'login'.tr,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        alignment: Alignment.center,
                        color: Colors.black
                    ),
                  ],
                ),
                onTap: () {
                  Get.to( const LoginView());
                },
              ),
              const SizedBox(
                height: 10,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
