

// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freelancerApp/features/chat/controllers/chat_controller.dart';
import 'package:get/get.dart';

class ChatScreen extends StatefulWidget {
  static const String screenRoute = 'chat_screen';

  const ChatScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {


ChatController controller=Get.put(ChatController());
  @override
  void initState() {
    super.initState();
   controller.getCurrentUser();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[900],
        title: Row(
          children: [
            Image.asset('assets/images/chat.webp', height: 25),
            const SizedBox(width: 10),
            Text('chat'.tr),
          ],
        ),
      
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
         
           StreamBuilder<QuerySnapshot>(
            stream:FirebaseFirestore.instance.collection('chat').snapshots()
             , builder: (context, snapshot) {
              
              List<Text>messageWidgets=[];

              if(!snapshot.hasData){
 
             // 
              }

              final messages
              =snapshot.data!.docs;

              for(var message in messages){
                final messageText=message.get('text');
                final messageSender=
                message.get('sender');

                final  messageWidget=Text('$messageText $messageSender');
              
                messageWidgets.add(messageWidget);
              }

             
               return Column(
                children: messageWidgets,
               );
             }),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.orange,
                    width: 2,
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        controller.messageText=value;
                      }
                    ,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        hintText: 'Write your message here...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {

  controller.messageStreams();
                     // controller.sendMessage();
                      
                    },
                    child: Text(
                      'send',
                      style: TextStyle(
                        color: Colors.blue[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}