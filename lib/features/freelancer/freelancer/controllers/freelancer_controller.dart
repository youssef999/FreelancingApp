

// ignore_for_file: avoid_print, duplicate_ignore

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FreelancerController extends GetxController{


List<Map<String,dynamic>> freelancerServicesList=[];

final box=GetStorage();



  getFreelancerServices() async {
    
    String email=box.read('email');
    freelancerServicesList = [];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('services')
        .where('freelancer_email',isEqualTo:'test@gmail.com')
        .get();
    try {
      List<Map<String, dynamic>> data = querySnapshot.docs
          .map((DocumentSnapshot doc) => doc.data() as Map<String, dynamic>)
          .toList();

      freelancerServicesList = data;
     
    } catch (e) {
      // ignore: avoid_print
      print("E.......");
      // ignore: avoid_print
      print(e);
      // orderState='error';
      // ignore: avoid_print
      print("E.......");
    }
    print("SERVICESS==$freelancerServicesList");

    update();
  }


}