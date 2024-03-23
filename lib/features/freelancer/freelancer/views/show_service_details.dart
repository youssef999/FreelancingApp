

import 'package:flutter/material.dart';
import 'package:freelancerApp/core/const/constant.dart';
import 'package:freelancerApp/core/resources/app_colors.dart';
import 'package:freelancerApp/core/widgets/Custom_Text.dart';
import 'package:freelancerApp/core/widgets/Custom_button.dart';
import 'package:freelancerApp/core/widgets/custom_app_bar.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ShowServiceDetails extends StatelessWidget {
  
  Map<String,dynamic> data;

 ShowServiceDetails({super.key,required this.data});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar:CustomAppBar('', context, false),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: [
          const SizedBox(height: 12,),
          Row(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage:NetworkImage(data['image']),
              ),
              const SizedBox(width: 20,),
              Custom_Text(text: data['name'],
              fontSize:20,fontWeight: FontWeight.w600,
              )
            ],
          ),
          const SizedBox(height: 12,),
  Row(
  children: [

 Custom_Text(text: 'price'.tr,
 fontSize:18,fontWeight: FontWeight.w600,
 ),
 const SizedBox(width: 10,),
  Custom_Text(text: data['price'].toString()+currency,
  fontSize:30,fontWeight:FontWeight.bold,
  color:AppColors.primary,
  ),
  ],
),
 const SizedBox(height: 12,),
            Custom_Text(text: data['description'],
            color:AppColors.textColorGreyMode,
              fontSize:16,fontWeight: FontWeight.w500,
              ),
               const SizedBox(height: 42,),
               Padding(
                 padding: const EdgeInsets.only(left:14.0,right: 14),
                 child: CustomButton(text: 'buyService'.tr, onPressed: (){
                 
                 }),
               )


          
        ]),
      ),
    );
  }
}