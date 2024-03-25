

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


  sendMessage(String rec)async{
    final box=GetStorage();
    String email=box.read('email') ?? '';

     String roleId=box.read('roleId') ?? '1';
    
    String r='';
    String e='';
      if(roleId=='1'){
       r=rec;
       e=email; 
       
      }else{
        r=email;
        e=rec;
      }
  
   
   await  FirebaseFirestore.instance.collection('chat').add({
      'text': messageText,
      'sender': e,
      'time': FieldValue.serverTimestamp(),
      'rec':r,
      //'reciever':''
    });
  }

  getMessages(String rec)async {

    final box=GetStorage();
      // ignore: unused_local_variable
      String email=box.read('email');
        String roleId=box.read('roleId');

        String e='';
        String r='';
        if(roleId=='1'){
          e=email;
          r=rec;
        }else{
          e=rec;
          r=email;
        }

   final messages= await FirebaseFirestore.instance.collection('chat')
   .where('sender',isEqualTo: e).where('rec',isEqualTo:r)
   
   .orderBy('time')
   .get();

  for(var message in messages.docs){
    // ignore: avoid_print
    print(message.data());
  }
  }


  void messageStreams()async{
    await for(var snapShot in 
    FirebaseFirestore.instance.collection('chat').snapshots()){
     for (var message in snapShot.docs){
      print(message.data());
     }
    }
  }

 List<Map<String,dynamic>>userChatList=[];
 List<String>recNames=[];


  getAllUserChat()async{

      
      final box=GetStorage();
      String roleId=box.read('roleId');
     String type='';
      if(roleId=='1'){
        type='sender';
      }
      else{
        type='rec';
      }
      // ignore: unused_local_variable
      String email=box.read('email')??"freelancer2024@gmail.com";

      print("EMAIL========="+email);
    userChatList= [];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('chat')
        .where(type,isEqualTo:email)
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
final box=GetStorage();
String roleId=box.read('roleId');

if(roleId=='1'){
for(int i=0;i<userChatList.length;i++){
    if(recNames.contains(userChatList[i]['rec'])){
     print("CONTAINS");
    }else{
     
 recNames.add( userChatList[i]['rec']);
      
    }
     update();

   }
}else{
  for(int i=0;i<userChatList.length;i++){
    if(recNames.contains(userChatList[i]['sender'])){
     print("CONTAINS");
    }else{
     
 recNames.add( userChatList[i]['sender']);
      
    }
     update();

   }
}
   



  }


}
  


