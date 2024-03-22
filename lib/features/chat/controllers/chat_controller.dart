

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ChatController extends GetxController{

  
  final auth = FirebaseAuth.instance;
  late User signedInUser;

  String messageText='';

  void getCurrentUser() {
    try {
      final user = auth.currentUser;
      if (user != null) {
        signedInUser = user;
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
      'time': DateTime.now(),
      'reciever':''
    });
  }

  getMessages()async{
   final messages= await FirebaseFirestore.instance.collection('chat').get();

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
}
  


