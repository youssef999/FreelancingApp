

// ignore_for_file: prefer_interpolation_to_compose_strings, avoid_print, duplicate_ignore

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ChatController extends GetxController{

  
  final auth = FirebaseAuth.instance;
  late User signedInUser;

  String messageText='';

  TextEditingController messageController=TextEditingController();

  void getCurrentUser() {
    try {
      final user = auth.currentUser;
      if (user != null) {
        signedInUser = user;
        // ignore: avoid_print
        print(signedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  sendMessage()async{
   await  FirebaseFirestore.instance.collection('chat').add({
      'text': messageText,
      'sender': signedInUser.email,
      'time': FieldValue.serverTimestamp(),
      //'reciever':''
    });
  }

  getMessages(String rec)async {

    final box=GetStorage();
      // ignore: unused_local_variable
      String email=box.read('email');

   final messages= await FirebaseFirestore.instance.collection('chat')
   .where('sender',isEqualTo: email).where('rec',isEqualTo:rec)
   
   .orderBy('time')
   .get();

  for(var message in messages.docs){
    // ignore: avoid_print
    print(message.data());
  }
  }


  void messageStreams()async{
    await for(var snapShot in FirebaseFirestore.instance.collection('chat').snapshots()){
     for (var message in snapShot.docs){
      print(message.data());
     }
    }
  }

 List<Map<String,dynamic>>userChatList=[];
 List<String>recNames=[];


  getAllUserChat()async{
      final box=GetStorage();
      // ignore: unused_local_variable
      String email=box.read('email');
    userChatList= [];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('chat')
        .where('sender',isEqualTo:email)
        .get();
    try {
      List<Map<String, dynamic>> data = querySnapshot.docs
          .map((DocumentSnapshot doc) => doc.data() as Map<String, dynamic>)
          .toList();

     userChatList= data;
    // userChatList= userChatList.toSet().toList();
     
    } catch (e) {
      // ignore: avoid_print
      print("E.......");
      // ignore: avoid_print
      print(e);
      // orderState='error';
      // ignore: avoid_print
      print("E.......");
    }
    print('chat==='+userChatList.toString());
    filterReceiver();
   

    update();

  }

  filterReceiver()async{

   for(int i=0;i<userChatList.length;i++){
    if(recNames.contains(userChatList[i]['rec'])){
     print("CONTAINS");
    }else{
   recNames.add( userChatList[i]['rec']);
    }
     update();

   }



  }


}
  


