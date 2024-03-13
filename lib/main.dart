
import 'package:freelancerApp/features/splash/splash_view.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

import 'core/localization/local.dart';


 void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  // AwesomeNotifications()
  //     .initialize(null, [
  //   NotificationChannel
  //     (channelKey:'basic-channel' ,
  //       channelName: 'Basic notifications',
  //       channelDescription: 'notification chanel for testing')
  // ]);
  //configureFirebaseMessaging();
  runApp(const MyApp());
}

// FirebaseMessaging messaging = FirebaseMessaging.instance;
// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
// FlutterLocalNotificationsPlugin();
//
// Future<void> configureFirebaseMessaging() async {
//   const AndroidInitializationSettings initializationSettingsAndroid =
//   AndroidInitializationSettings('@mipmap/ic_launcher');
//   const InitializationSettings initializationSettings =
//   InitializationSettings(android: initializationSettingsAndroid);
//   const AndroidNotificationDetails androidPlatformChannelSpecifics =
//   AndroidNotificationDetails('your_channel_id', 'your_channel_name',
//
//       importance: Importance.max, priority: Priority.high);
//
//
//   // ignore: unused_local_variable
//   const NotificationDetails platformChannelSpecifics =
//   NotificationDetails(android: androidPlatformChannelSpecifics);
//   await flutterLocalNotificationsPlugin.initialize(initializationSettings);
//
//   print("NOTIF");
//   FirebaseMessaging.instance
//       .getInitialMessage()
//       .then((RemoteMessage? message) async {
//     // Handle the initial message when the app is opened from a notification
//     if (message != null) {
//       triggerNotification(message.notification!.title!,message.notification!.body!);
//
//     }
//   });
//
//   FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
//
//     triggerNotification(message.notification!.title!,message.notification!.body!);
//
//     print("Foreground message: ${message.notification?.title}");
//
//
//   });
//
//   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
//
//     print("Opened app message: ${message.notification?.title}");
//     triggerNotification(message.notification!.title!,message.notification!.body!);
//
//
//   });
//
//   Future<void> _firebaseMessagingBackgroundHandler(
//       RemoteMessage message) async {
//     triggerNotification(message.notification!.title!,message.notification!.body!);
//     print("OPEN APP: ${message.notification?.title}");
//   //  triggerNotification(message.notification!.title!,message.notification!.body!);
//   }
//   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
// }
//
// triggerNotification(String title,String msg){
//
//   AwesomeNotifications().createNotification(content:
//   NotificationContent(id: 1,
//       channelKey:'basic-channel' ,
//       title: title,
//       body: msg
//   ));
// }

 class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final box=GetStorage();
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
    return  GetMaterialApp(
      color:  Colors.blueAccent,
      debugShowCheckedModeBanner: false,
       title: '',
        locale:lang,
        translations: MyLocal(),
      home:
      const SplashView()
    );
  }
}


