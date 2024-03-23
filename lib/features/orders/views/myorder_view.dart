

// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:freelancerApp/core/const/constant.dart';
import 'package:freelancerApp/core/resources/app_colors.dart';
import 'package:freelancerApp/core/widgets/Custom_Text.dart';
import 'package:freelancerApp/core/widgets/custom_app_bar.dart';
import 'package:freelancerApp/features/orders/controllers/order_controller.dart';
import 'package:freelancerApp/features/orders/widgets/card_order_widget.dart';
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
  
  return ListView.builder(
    shrinkWrap: true,
    itemCount: controller.orderList.length,
    itemBuilder: (context, index) {
    return Padding(
      padding: const EdgeInsets.only(left:20.0,right: 20),
      child: Container(
        decoration:BoxDecoration(
          borderRadius:BorderRadius.circular(12),
          color:AppColors.cardColor
          ),
          child:Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [

              SizedBox(height: 120,
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                controller.orderList[index]['service_image'],
                fit:BoxFit.fill,
              ),),
              const SizedBox(height: 10,),
              Custom_Text(text: controller.orderList[index]['service_name'],
              fontSize:20,fontWeight:FontWeight.bold,
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Custom_Text(text: 
                  controller.orderList[index]['service_price']
                  .toString(),
                  fontSize:20,fontWeight:FontWeight.w700,
                  
                  ),
                  const SizedBox(width: 10,),
                  Custom_Text(text: 
                  currency,
                  fontSize:18,fontWeight:FontWeight.w900,
                  color:AppColors.primary,
                  ),
                ],
              ),
            ]),
          ),
      ),
    );
 
  });
}