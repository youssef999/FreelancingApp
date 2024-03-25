// ignore_for_file: unused_local_variable, avoid_print, duplicate_ignore

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:freelancerApp/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../Core/const/app_message.dart';

class AuthController extends GetxController {

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController checkPassController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  TextEditingController roleId = TextEditingController();

  bool loading = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Rx<int> isSelected = 0.obs;

  @override
  void onInit() async {
    getAllCategories();
    getAllCountries();
    super.onInit();
  }

  User? user = FirebaseAuth.instance.currentUser;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  List<Map<String, dynamic>> categoryList = [];
  List<Map<String, dynamic>> countryList = [];
  final List<String> catNames = [];
  final List<String> countryNames = [];
  String selectedItem = 'ترجمة';
  String selectedCountry = 'مصر';

  List<Map<String,dynamic>> userDataList=[];
 List<Map<String,dynamic>> freelancerDataList=[];
 final box=GetStorage();

getRoleIdByUser() async{
userDataList=[];
QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection
        ('users').where('email',isEqualTo: emailController.text).get();
      try{
        List<Map<String, dynamic>> data
        = querySnapshot.docs.map((DocumentSnapshot doc) =>
        doc.data() as Map<String, dynamic>).toList();
        userDataList=data;
        if(userDataList.isNotEmpty){
          roleId.text='1';
          box.write('roleId',roleId.text);
        }else{
   getRoleIdByFreelancer();
        }     
      }catch(e){
        // ignore: avoid_print
        print("E.......");
        // ignore: avoid_print
        print(e);
     
        print("E.......");
      }
      update();

  }

  getRoleIdByFreelancer()async{

freelancerDataList=[];
QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection
        ('freelancers').where('email',isEqualTo: emailController.text).get();
      try{
        List<Map<String, dynamic>> data
        = querySnapshot.docs.map((DocumentSnapshot doc) =>
        doc.data() as Map<String, dynamic>).toList();
        freelancerDataList=data;
        if(freelancerDataList.isNotEmpty){
          roleId.text='2';
          box.write('roleId',roleId.text);
        }
        else{
          print("ELSE");
         
        }


     
      }catch(e){
        // ignore: avoid_print
        print("E.......");
        // ignore: avoid_print
        print(e);
     
        print("E.......");
      }
      update();

  }

  changeCatValue(String value) {
    selectedItem = value;
    update();
  }

  changeCountryValue(String value) {
    selectedCountry = value;
    update();
  }

  getAllCategories() async {
    categoryList = [];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('cat').get();
    try {
      List<Map<String, dynamic>> data = querySnapshot.docs
          .map((DocumentSnapshot doc) => doc.data() as Map<String, dynamic>)
          .toList();

      categoryList = data;

      for (int i = 0; i < categoryList.length; i++) {
        catNames.add(categoryList[i]['name']);
      }
    } catch (e) {
      // ignore: avoid_print
      print("E.......");
      // ignore: avoid_print
      print(e);
      // orderState='error';
      // ignore: avoid_print
      print("E.......");
    }
    update();
  }

  getAllCountries() async {
    print("ccc");

    countryList = [];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('countries').get();
    try {
      List<Map<String, dynamic>> data = querySnapshot.docs
          .map((DocumentSnapshot doc) => doc.data() as Map<String, dynamic>)
          .toList();

      countryList = data;

      for (int i = 0; i < countryList.length; i++) {
        countryNames.add(countryList[i]['name']);
      }

      print(countryNames);
    } catch (e) {
      // ignore: avoid_print
      print("E.......");
      // ignore: avoid_print
      print(e);
      // orderState='error';
      // ignore: avoid_print
      print("E.......");
    }
    update();
  }

  addTokenToFirebase() async {
    const String chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789)*&1!';
    Random random = Random();
    String result = '';

    for (int i = 0; i < 12; i++) {
      result += chars[random.nextInt(chars.length)];
    }

    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
    await _firebaseMessaging.requestPermission();

    // Get the device token
    String? token = await _firebaseMessaging.getToken();
    await FirebaseFirestore.instance.collection('tokens').doc(result).set({
      'token': token!,
    }).then((value) {
      print("DONE ADD TOKEN");
    });
  }

  changePassword() async {
    if (passController.text == checkPassController.text &&
        passController.text.length > 5) {
      try {
        await user!.updatePassword(passController.text.toString());
      } catch (e) {
        // ignore: avoid_print
        print(e);
      }
    } else {
      appMessage(
          text: 'كلمة المرور غير متطابقة او عددها اقل من 6 ', fail: true);
    }
  }

  Future<void> resetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text)
          .then((value) {
        appMessage(text: "checkMail".tr, fail: true);

        Get.toNamed(Routes.LOGIN)!
            .then((value) => appMessage(text: "checkMail".tr, fail: false));
      });
      // Password reset email sent successfully
    } catch (e) {
      appMessage(text: 'ادخل بريد سليم ', fail: false);
      // Handle any errors that occur during the password reset process
      // ignore: avoid_print
      print('Error sending password reset email: $e');
    }
  }

  userLogin() async {

    print("LOGINNN");
    loading = true;
    update();
    final box = GetStorage();
    if (emailController.text.length > 2 && passController.text.length > 5) {
      try {
        await _auth
            .signInWithEmailAndPassword(
                email: emailController.text, password: passController.text)
            .then((value) async {
          print("DONE");
          Get.offAllNamed(Routes.ROOT);
          print("val$value");
          loading = false;
          box.write('email', emailController.text);         
          update();
        });
      } catch (e) {
        loading = false;
        update();
        String error = '';
        print("E====$e");
        if (e.toString().contains('The password is invalid')) {
          error = 'wrongPass'.tr;
        } else if (e.toString().contains('There is no user record')) {
          error = 'wrongMail'.tr;
        } else {
          error = 'Something Went Wrong Try Agian ';
        }
      }
    } else {
      if (emailController.text.contains('@') == false) {
        appMessage(text: 'wrongMail'.tr, fail: false);
      }
      if (passController.text.length < 5) {
        appMessage(text: 'wrongPass'.tr, fail: false);
      }
    }
  }

  userSignUp() async {
    final userId = FirebaseAuth.instance.currentUser;
    loading = true;
    update();
    final box = GetStorage();
    try {
      await _auth
          .createUserWithEmailAndPassword(
        email: emailController.text,
        password: passController.text,
      )
          .then((user) async {

          
        try {
          await firestore.collection(
            roleId.text == '1'? 'users' : 'freelancers').add({
            'name': nameController.text,
            'password': passController.text,
            'email': emailController.text,
            'country': selectedCountry,
            'roleId': roleId.text,
            'type':'normal',
            'uid': userId?.uid
          });
          Get.offAllNamed(Routes.LOGIN);
        } catch (e) {
          print(e.toString());
          print("ERRORR");
        }
        loading = false;
        box.write('roleId', roleId.text);
        box.write('email', emailController.text);
        box.write('name', nameController.text);update();
      });
    } catch (e) {
      print(e);
    }
    loading = false;
    update();
  }




  addNewUser() async {
    const String chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789)*&1!';
    Random random = Random();
    String result = '';
    final box=GetStorage();
    for (int i = 0; i < 12; i++) {
      result += chars[random.nextInt(chars.length)];
    }

    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(result)
          .set({
        'name': nameController.text,
        'email': emailController.text,
        'id': result,
        'country': selectedCountry,
      // ignore: duplicate_ignore
      }).then((value) {
        update();
        // ignore: avoid_print
        print("DONE");
        appMessage(text: 'welcome'.tr, fail: false);
         box.write('user_email', emailController.text);
        box.write('user_name', nameController.text);
        // Get.toNamed('/bottomBar');
      });
    } catch (e) {
      update();
      print(e);
      appMessage(text: "error".tr, fail: true);
    }
  }

  addNewFreelancer() async {
    final box=GetStorage();
    const String chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789)*&1!';
    Random random = Random();
    String result = '';

    for (int i = 0; i < 12; i++) {
      result += chars[random.nextInt(chars.length)];
    }

    try {
      await FirebaseFirestore.instance
          .collection('freelancers')
          .doc(result)
          .set({
        'name': nameController.text,
        'email': emailController.text,
        'id': result,
        'cat': selectedItem,
        'country': selectedCountry,
      }).then((value) {
        update();
        // ignore: avoid_print
        print("DONE");
        appMessage(text: 'welcome'.tr, fail: false);
         box.write('freelancer_email', emailController.text);
        box.write('freelancer_name', nameController.text);
        // Get.toNamed('/bottomBar');
      });
    } catch (e) {
      update();
      print(e);
      appMessage(text: "error".tr, fail: true);
    }
  }
}
