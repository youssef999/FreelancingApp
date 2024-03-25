// ignore_for_file: avoid_print
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:freelancerApp/core/localization/local.dart';
import 'package:freelancerApp/firebase_options.dart';
import 'package:freelancerApp/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
    final box=GetStorage();
     ///en //ar //' '
    Locale lang=const Locale('ar');
    String langx=box.read('locale')??'x';
    if(langx!='x'){
      lang=Locale(langx);
    }
    else{
      print("Here");
      lang=const Locale('ar');
      box.write('locale','ar');
    }
  runApp(
    GetMaterialApp(
      translations: MyLocal(),
      title: "FreeLancers",
     locale:lang,
      initialRoute: Theme1AppPages.INITIAL,
      getPages: Theme1AppPages.routes,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
    ),
  );
}