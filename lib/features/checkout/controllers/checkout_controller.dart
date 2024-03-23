

// ignore_for_file: avoid_print, duplicate_ignore

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freelancerApp/features/root/view/root_view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../core/const/app_message.dart';

class CheckoutController extends GetxController{

TextEditingController desController=TextEditingController();
TextEditingController priceController=TextEditingController();
TextEditingController notesController=TextEditingController();
TextEditingController timeController=TextEditingController();
bool isLoading=false;

List<Map<String,dynamic>>userList=[];

String userName='';

getUserName()async {

userList=[];

final box=GetStorage();

 String email=box.read('email');

 QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection
        ('users').where('email',isEqualTo: email)
        .get();

        print("EMAIL==$email");
        
      try{
        List<Map<String, dynamic>> data
        = querySnapshot.docs.map((DocumentSnapshot doc) =>
        doc.data() as Map<String, dynamic>).toList();
      userList=data;
      userName=userList[0]['name'];
      // ignore: duplicate_ignore, duplicate_ignore
      }catch(e){
        // ignore: avoid_print
        print("E.......");
        // ignore: avoid_print
        print(e);
       // orderState='error';
        // ignore: avoid_print
        print("E.......");
      }
      print("user===$userName");
      update();
}


 addOrderToFirebase(DocumentSnapshot data)async{
 
 final box=GetStorage();

 String email=box.read('email');

const String chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789)*&1!';
  Random random = Random();
  String result = '';
  for (int i = 0; i < 12; i++) {
    result += chars[random.nextInt(chars.length)];
  }
 try{
 await FirebaseFirestore.instance.collection('orders').doc(result)
   .set({
  
  'service_name':data['name'].toString(),
  
  'date':DateTime.now().toString(),
  
  "freelancer_email":data['freelancer_email'],
  
  'freelancer_name':data['freelancer_name'],
  
  'service_image':data['image'],

  'order_des':desController.text,

  'client_name':userName,

  'client_email':email,

  'service_price':priceController.text,

  'notes':notesController.text,

  'notes2':'',

  'task_time':timeController.text,

  'id':result,

  'status':'pending',


    }).then((value) {
     isLoading=true;
      update();
      // ignore: avoid_print
      print("DONE");
      appMessage(text: 'dealSent'.tr,fail: false);
      Get.offAll(RootView());
     // Get.toNamed('/bottomBar');
    });
} catch(e){
  isLoading=false;
  update();
  // ignore: avoid_print, prefer_interpolation_to_compose_strings
  print("EEE=="+e.toString());
  appMessage(text: "Can't Add Item Now",fail: true);
}
}


}