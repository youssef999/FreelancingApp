

// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:freelancerApp/core/const/constant.dart';
import 'package:freelancerApp/core/resources/app_colors.dart';
import 'package:freelancerApp/core/widgets/Custom_Text.dart';
import 'package:freelancerApp/core/widgets/custom_app_bar.dart';
import 'package:freelancerApp/features/orders/controllers/order_controller.dart';
import 'package:get/get.dart';

class MyOrderView extends StatefulWidget {
  const MyOrderView({super.key});

  @override
  State<MyOrderView> createState() => _MyOrderViewState();
}

class _MyOrderViewState extends State<MyOrderView> {

UserOrderController controller=Get.put(UserOrderController());

  @override
  void initState() {
    controller.getUserOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainly,
      appBar:CustomAppBar('', context, false),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children:[
          const SizedBox(height: 20,),
          GetBuilder<UserOrderController>(
            init: UserOrderController(),
            builder: (_) {
              return UserOrderWidget();
            }
          )
          
        
        ]),
      ),
    );
  }
}

Widget UserOrderWidget(){
  
  UserOrderController controller=Get.put(UserOrderController());
 
 String status='';
  return ListView.builder(
    shrinkWrap: true,
    itemCount: controller.orderList.length,
    itemBuilder: (context, index) {

  if( controller.orderList[index]['order_status']=='pending'){
    status='pending'.tr;
  }

  else if( controller.orderList[index]['order_status']=='accept'){
    status='accept'.tr;
  }
 else if( controller.orderList[index]['order_status']=='declined'){
    status='refuse'.tr;
  }
  else{
    status=controller.orderList[index]['order_status'];
  }


    return Padding(
      padding: const EdgeInsets.only(left:20.0,right: 20),
      child: Container(
        decoration:BoxDecoration(
          borderRadius:BorderRadius.circular(12),
          color:AppColors.cardColor
          ),
          child:Padding(
            padding: const EdgeInsets.all(11.0),
            child: Column(children: [

              SizedBox(height: 120,
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                controller.orderList[index]['service_image'],
                fit:BoxFit.fill,
              ),),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: [
                  Custom_Text(text: controller.orderList[index]['service_name'],
                  fontSize:20,fontWeight:FontWeight.bold,
                  ),
                   Container(
                decoration:BoxDecoration(borderRadius:BorderRadius.circular(12),
                color:Colors.green
                ),
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Custom_Text(text: 
                   status,
                     // controller.orderList[index]['status'],
                      fontSize:16,fontWeight:FontWeight.w500,
                      color:AppColors.textColorLight
                      ),
                 ),
               ),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                   // ignore: prefer_interpolation_to_compose_strings
                   Custom_Text(text: 'freelancer'.tr+ " : ",
                  fontSize:15,color:Colors.grey,
                  ),
                  Custom_Text(text: controller.orderList[index]
                  ['freelancer_name'],
                  fontSize:15,color:Colors.grey,
                  ),
                ],
              ),
                const SizedBox(height: 10,),
                 Row(
                children: [
                   // ignore: prefer_interpolation_to_compose_strings
                   Custom_Text(text: 'date'.tr,
                  fontSize:15,color:Colors.grey,
                  ),
                  Custom_Text(text: controller.orderList[index]
                  ['date'].toString(),
                  fontSize:15,color:Colors.grey,
                  ),
                ],
              ),
                 const SizedBox(height: 10,),
              Row(
               // mainAxisAlignment: MainAxisAlignment.sp,
                children: [
                  Custom_Text(text: 
                  controller.orderList[index]['service_price']
                  .toString(),
                  color:AppColors.primary,
                  fontSize:17,fontWeight:FontWeight.w500,
                  
                  ),
                  const SizedBox(width: 10,),
                  Custom_Text(text: 
                  currency,
                  fontSize:18,fontWeight:FontWeight.w500,
                  color:AppColors.primary,
                  ),
                ],
              ),
              const SizedBox(height: 11,),
             
                   
              
            ]),
          ),
      ),
    );
 
  });
}