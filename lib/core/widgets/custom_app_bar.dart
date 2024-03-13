


// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../resources/app_colors.dart';
import 'Custom_Text.dart';


PreferredSizeWidget CustomAppBar(String text,bool leading,double height){
  
  return AppBar(
      toolbarHeight: height,
      elevation:0.2,
      title:
      Text(text,style:const TextStyle(fontWeight:FontWeight.w500,
      fontSize: 18
      ),),
      leading:(leading==true)?
      IconButton(onPressed: (){
        Get.back();
      }, icon: Icon(Icons.arrow_back_ios,size: 28,
        color:AppColors.iconColor,
      ))
          :const SizedBox()
  );
}

PreferredSizeWidget CustomAppBar2(String text,bool leading,double height){
  
  return AppBar(
      toolbarHeight: height,
      elevation:0.0,
   //   backgroundColor:AppColors.appBarColor,
      title:Custom_Text(text: text,
        fontSize: 21,color:AppColors.textColorLight,
        alignment:Alignment.center,
      ),
      leading:(leading==true)?
      IconButton(onPressed: (){
        Get.offAllNamed('/bottomBar');
      }, icon: Icon(Icons.arrow_back_ios,size: 28,
        color:AppColors.iconColor,
      ))
          :const SizedBox()
  );
}