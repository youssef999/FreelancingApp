

// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings, duplicate_ignore

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:freelancerApp/Core/const/app_message.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../root/view/root_view.dart';

class OrderController extends GetxController{

List<Map<String,dynamic>> orderList=[];
TextEditingController priceController=TextEditingController();
TextEditingController avgTimeController =TextEditingController();
TextEditingController noteController =TextEditingController();


  @override
  void onInit() {
    getFreelancerOrders();
    super.onInit();
  }

getFreelancerOrders() async{
  final box=GetStorage();
  // ignore: unused_local_variable
  String email=box.read('email')??'';
    orderList= [];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('orders')
        .where('client_email',isEqualTo: email)
        .get();
    try {
      List<Map<String, dynamic>> data = querySnapshot.docs
          .map((DocumentSnapshot doc) => doc.data() as Map<String, dynamic>)
          .toList();
      orderList = data;
    // ignore: duplicate_ignore
    } catch (e) {
      // ignore: avoid_print
      print("E.......");
      // ignore: avoid_print
      print(e);
      // orderState='error';
      // ignore: avoid_print
      print("E.......");
    }
    print("ORDER==="+orderList.toString());
    update();
  }

 changeOrderStatus(String orderId,String status)async{
  print(status);
    FirebaseFirestore.instance.collection('orders').doc(orderId)
        .update({
      'order_status':status
    }).then(
      (value) {
   
      appMessage(text: 'changeStatusDone'.tr, fail: false);

      Get.offAll(RootView());
      
    });
  }
}





