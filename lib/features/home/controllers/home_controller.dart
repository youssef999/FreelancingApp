import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:freelancerApp/core/resources/app_colors.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final box = GetStorage();
  String typeFilter = '';
  RxList sliderImagesList = [].obs;
  CarouselSliderController sliderController = CarouselSliderController();

  List<DocumentSnapshot> searchResults = [];
  bool isSearching = false;
  final RxList<Color> colors = [
    AppColors.whiteColor,
    AppColors.whiteColor,
    AppColors.whiteColor,
    AppColors.whiteColor,
    AppColors.whiteColor,
    AppColors.whiteColor,
  ].obs;
  int? balance = 0; // Variable to store the balance
  Future<QuerySnapshot<Map<String, dynamic>>> getUserDataByEmail(
      String email) async {
    final userRef = FirebaseFirestore.instance.collection('users');
    return await userRef.where('email', isEqualTo: email).get();
  }

  RxMap<String, dynamic>? userData = <String, dynamic>{}.obs;
  void data() async {
    final User? currentUser = FirebaseAuth.instance.currentUser;
    final String? email = currentUser?.email;

    if (email != null) {
      final snapshot = await getUserDataByEmail(email);
      if (snapshot.docs.isNotEmpty) {
        if (kDebugMode) {
          print('BBBBBBBBBBBBBBBBBBBBB ${snapshot.docs.first.data()}');
        }
        userData?.value = snapshot.docs.first.data();
        update();
      }
    }
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  late Stream<String> progressString;
  late String res;
  bool downloading = false;
  bool isDisable = true;

  Future<void> dowloadImage(BuildContext context, String url) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    progressString.listen((data) {
      res = data;
      downloading = true;
    }, onDone: () async {
      downloading = false;

      print("Task Done");

      downloading = false;

      isDisable = false;
      scaffoldMessenger.showSnackBar(const SnackBar(
        content: Text(
          'Image Set To Wallpaper Successfully',
          style: TextStyle(
            fontSize: 12,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFFe91e63),
      ));
      print("Task Done");
      Get.back();
    }, onError: (error) {
      downloading = false;
      isDisable = true;
      print("Some Error");
    });
  }

  Future<void> fetchSliderImages() async {
    QuerySnapshot snapshot = await firestore.collection('advertise').get();
    sliderImagesList.value = snapshot.docs.map((doc) => doc['image']).toList();
    update();
  }

  void updateData(String docId) {
    DocumentReference docRef = firestore.collection('user').doc(docId);
    docRef.update({'price': 0, 'lock': false}).then((value) {
      if (kDebugMode) {
        print("Document updated successfully");
      }
    }).catchError((error) {
      if (kDebugMode) {
        print("Failed to update document: $error");
      }
    });
  }

  void clearSearch() {
    searchResults.clear();
    isSearching = false;
  }

  Future<void> searchProducts(String keyword) async {
    if (keyword.isEmpty) {
      clearSearch();
      return;
    }

    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('data')
        .where('name', isGreaterThanOrEqualTo: keyword)
        .where('name', isLessThan: '${keyword}z')
        .get();

    searchResults = snapshot.docs;
    isSearching = true;
  }

  @override
  void onInit() async {
    await fetchSliderImages();
    data();
    super.onInit();
  }
}
