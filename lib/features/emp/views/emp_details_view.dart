

import 'package:flutter/material.dart';
import 'package:freelancerApp/core/const/constant.dart';
import 'package:freelancerApp/core/resources/app_colors.dart';
import 'package:freelancerApp/core/widgets/Custom_Text.dart';
import 'package:freelancerApp/core/widgets/custom_app_bar.dart';
import 'package:freelancerApp/features/emp/views/emp_checkout_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../checkout/views/checkout_view.dart';

// ignore: must_be_immutable
  class EmpDetailsView extends StatelessWidget {
   Map<String,dynamic>emp;
  
   EmpDetailsView({super.key,required this.emp});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.backgroundColor,
      appBar:CustomAppBar('', context, false),
            
             bottomSheet: animBtn(() {
              Get.to(EmpCheckoutView(data: emp,));             
          //Get.toNamed(Routes.CART);
        }, 'buyService'.tr, AppColors.primary),
      body:Padding(
        padding: const EdgeInsets.all(1.0),
        // ignore: prefer_const_literals_to_create_immutables
        child: ListView(children: [
          SizedBox(
            height: 200,
            child:Image.network(emp['image']),
          ),
          const SizedBox(width: 10,),
          Container(
            decoration:BoxDecoration(
              borderRadius:BorderRadius.circular(12)
              ,color:AppColors.cardColor
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Custom_Text(text: emp['name'],fontSize:20,
                  fontWeight:FontWeight.w600,
                  ),
                  const SizedBox(height: 5,),
                  Custom_Text(text: emp['des'],fontSize:14,
                  fontWeight:FontWeight.w600,color:AppColors.textColorGreyMode,
                  ),
                   const SizedBox(height: 5,),  
                    Custom_Text(text: '${emp['price']} $currency',fontSize:20,
                  fontWeight:FontWeight.w800,color:AppColors.primary,
                  
                  ),  
                  
                ],
              ),
            ),
          )


        

          
        ]),
      ),
    );
  }
}
animBtn(void Function() function, String txt, Color color) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: function,
          child: Container(
            height: 50,
            margin: const EdgeInsets.only(bottom: 10, top: 10),
            width: 250,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Center(
              child: Text(
                txt,
                style: GoogleFonts.cairo(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        )
      ],
    );
  }
