

import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:freelancerApp/core/const/app_message.dart';
import 'package:freelancerApp/core/widgets/Custom_Text.dart';
import 'package:freelancerApp/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddServiceController extends GetxController{


TextEditingController serviceNameController=TextEditingController();
TextEditingController serviceDescriptionController=TextEditingController();
TextEditingController servicePriceController=TextEditingController();
List<String>catList=[];
 XFile? pickedImageXFile;
  final ImagePicker _picker = ImagePicker();
  var imageLink = '';
  String downloadUrl = '';
  String downloadUrl2= '';
  List<String> downloadUrls = [];

  List<String> downloadUrls2 = [];

 List<XFile>? pickedImageXFiles;
  List<XFile>? pickedImageXFiles2;
  bool isImage=false;

  bool isLoading=false;

  List<Map<String,dynamic>>categoryList=[];

  List<String>catNames=[];


    String selectedCategory = 'ترجمة';

  changeCatValue(String value) {
    selectedCategory = value;
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
  

  showDialogBox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            backgroundColor: Colors.white,
            title: const Custom_Text(
              text: 'الصورة ',
              alignment: Alignment.center,
              fontSize: 19,
              color: Colors.black,
            ),
            children: [
              SimpleDialogOption(
                child: const Custom_Text(
                  text: 'كاميرا ',
                  alignment: Alignment.center,
                  fontSize: 14,
                  color: Colors.black,
                ),
                onPressed: () {
                  captureImage();
                },
              ),
              SimpleDialogOption(
                  child: const Custom_Text(
                    text: ' اختر صورة  ',
                    alignment: Alignment.center,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    pickImage();
                  }),
              SimpleDialogOption(
                  child: const Custom_Text(
                    text: 'الغاء  ',
                    alignment: Alignment.center,
                    fontSize: 14,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    Get.back();
                  })
            ],
          );
        });
  }

  captureImage() async {
    pickedImageXFile = await _picker.pickImage(source: ImageSource.camera);
    Get.back();
    //pickedImageXFile;  
        update();
  }

  pickImage() async {
    pickedImageXFile = await _picker.pickImage(source: ImageSource.gallery);
    Get.back();
    update();
    //   uploadImageToFirebaseStorage(pickedImageXFile!);
  }

    pickMultiImage() async {
    pickedImageXFiles = await _picker.pickMultiImage(
      imageQuality: 100,
    );
    isImage = true;
        update();

  }

  addServiceToFireStore()async {
const String chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789)*&1!';
  Random random = Random();
  String result = '';

  for (int i = 0; i < 12; i++) {
    result += chars[random.nextInt(chars.length)];
  }

try{
await FirebaseFirestore.instance.collection('services')
.doc(result)
.set({
  'serviceId':result,
   'service_name':serviceNameController.text,
   'service_details':serviceDescriptionController.text,
    'price':servicePriceController.text,
    //'service_image':downloadUrls[0],
    }).then((value) {
      isLoading=false;
      update();
      // ignore: avoid_print
      print("DONE");
      appMessage(text: 'serviceDone'.tr,fail: false);
    });
}catch(e){
  isLoading=false;
  update();
  // ignore: avoid_print
  print(e);
  appMessage(text: "serviceFail".tr,fail: true);
}
  
}


startAddingService(){
  //uploadMultiImageToFirebaseStorage(pickedImageXFiles!).then((value) {
    addServiceToFireStore();
 // });
}

Future uploadMultiImageToFirebaseStorage(List<XFile> images) async {

    for(int i=0;i<images.length;i++){
      try {
        String fileName = DateTime.now().millisecondsSinceEpoch.toString();
        Reference reference =
        FirebaseStorage.instance.ref().child('images/$fileName');
        UploadTask uploadTask = reference.putFile(File(images[i].path));
        TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
        downloadUrl = await taskSnapshot.ref.getDownloadURL();
        downloadUrls.add(downloadUrl);
      } catch (e) {
        // Handle any errors that occur during the upload process
        print('Error uploading image to Firebase Storage: $e');
      }
    }

    return downloadUrls;
  }


}