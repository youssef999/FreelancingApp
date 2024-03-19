
// ignore_for_file: must_be_immutable, unused_local_variable

import 'package:flutter/material.dart';
import 'package:freelancerApp/core/widgets/custom_app_bar.dart';
import 'package:freelancerApp/features/freelancer/orders/controllers/order_controller.dart';
import 'package:freelancerApp/features/freelancer/orders/widgets/order_widget.dart';
import 'package:get/get.dart';

class OrdersView extends GetView<OrderController> {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {

    OrderController controller=Get.put(OrderController());

    return GetBuilder<OrderController>(
      builder: (_) {
        return Scaffold(
          appBar:CustomAppBar('', context, false),
          body:ListView(children:  [
            const SizedBox(height: 11,),
            OrderWidgetFromFirebase(controller: controller),
        
          ]
          ),
        );
      }
    );
  }
}

class OrderWidgetFromFirebase extends StatelessWidget {
  
  OrderController controller;
 
  OrderWidgetFromFirebase({super.key,required this.controller});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      builder: (_) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount:controller.orderList.length,
          itemBuilder: (context, index) {
        return OrderCardWidget(data:controller.orderList[index]);
        });
      }
    );
  }
}