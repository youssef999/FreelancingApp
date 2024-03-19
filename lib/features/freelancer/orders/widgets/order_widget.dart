

import 'package:flutter/material.dart';
import 'package:freelancerApp/Core/resources/app_colors.dart';
import 'package:freelancerApp/core/widgets/Custom_Text.dart';
import 'package:freelancerApp/features/freelancer/views/service_details_view.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class OrderCardWidget extends StatelessWidget {
  Map<String,dynamic> data;

OrderCardWidget({super.key,required this.data});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration:BoxDecoration(
             boxShadow: [
                    BoxShadow(
                      color: Colors.grey[300]!.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
            borderRadius: BorderRadius.circular(11),
            color: AppColors.cardColor
          ),
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(children: [
              SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child:Image.network(data['service_image'],
                  fit:BoxFit.fill,
                ),
              ),
              const SizedBox(height: 7,),
              Custom_Text(text: data['service_name'],color:AppColors.textColorDark,fontSize: 15,),
              const SizedBox(height: 7,),
               Row(
                 children: [
                   const SizedBox(width: 14,),
                  Text('from'.tr,style: TextStyle(
                    color:AppColors.textColorGreyMode
                  ),),
                  const SizedBox(width: 14,),
                   Custom_Text(text: data['user_email'],color:AppColors.primary,fontSize: 15,),
                 ],
               ),
            ]),
          )
        ),
      ),
      onTap:(){
       //Get.to(ServiceDetailsView(service: data));
      },
    );
  }
}