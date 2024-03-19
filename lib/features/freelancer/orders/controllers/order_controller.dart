

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OrderController extends GetxController{

List<Map<String,dynamic>> orderList=[];


  @override
  void onInit() {
    getFreelancerOrders();
    super.onInit();
  }

getFreelancerOrders() async{

  print("www");
  final box=GetStorage();

  String email=box.read('freelancer_email')??'';
    orderList= [];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('orders')
        .where('freelancer_email',isEqualTo: 'test@gmail.com')
        .get();
    try {
      List<Map<String, dynamic>> data = querySnapshot.docs
          .map((DocumentSnapshot doc) => doc.data() as Map<String, dynamic>)
          .toList();
      orderList = data;
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





}