

// ignore_for_file: avoid_print, must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freelancerApp/core/resources/app_colors.dart';
import 'package:freelancerApp/features/chat/controllers/chat_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// ignore: must_be_immutable
class ChatView extends StatefulWidget {
  static const String screenRoute = 'chat_screen';

  String rec;

  ChatView({Key? key,required this.rec}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {


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
         
      MessageStreamWidget(rec: widget.rec,),
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
                      controller: controller.messageController,
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

                      controller.messageController.clear();
                      controller.sendMessage();
                      
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

class MessageStreamWidget extends StatelessWidget {
  String rec;
   MessageStreamWidget({super.key,required this.rec});

  @override
  Widget build(BuildContext context) {
    final box=GetStorage();
    String email=box.read('email') ?? 'x';
    ChatController controller=Get.put(ChatController());
    return   StreamBuilder<QuerySnapshot>(
            stream:FirebaseFirestore.instance.
            collection('chat').where
            ('sender',isEqualTo: email)
            .where('rec',isEqualTo: rec)
            .orderBy('time')
            .snapshots()
             , builder: (context, snapshot) {
              
              List<MessageLine>messageWidgets=[];

              if(!snapshot.hasData){
             // 
              }

              final messages
              =snapshot.data!.docs.reversed;
              for(var message in messages){
                final messageText=message.get('text');
                final currentUser=controller.signedInUser.email;
                final messageSender=
              message.get('sender');
              bool isMe=false;

              if(currentUser==messageSender){
                isMe=true;
              }
                final  messageWidget=MessageLine(sender: messageSender
                , txt: messageText,isMe: isMe,
              
                );
                //Text('$messageText $messageSender');
              
                messageWidgets.add(messageWidget);
              }

             
               return Expanded(
                 child: ListView(
                  reverse: true,
                  padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                  children: messageWidgets,
                 ),
               );
             });
  }
}

class MessageLine extends StatelessWidget {

  String txt;
 
  String sender;

  bool isMe;
  
   MessageLine({super.key,required this.sender,required this.txt,
   required this.isMe,
   });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: isMe? CrossAxisAlignment.end
        :CrossAxisAlignment.start
        ,
        children: [

         Text(sender,style:TextStyle(color:AppColors.textColorGreyMode,
         fontSize:12
         ),),
          Material(
            borderRadius: isMe?const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomRight:Radius.circular(30)
            ):const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft:Radius.circular(30)
            ),
            elevation: 5,
            color:isMe?AppColors.primary:AppColors.darkColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical:10.0,
              horizontal: 10
              ),
              child: Text(txt ,
              style:TextStyle(color:AppColors.textColorLight,
              fontSize: 16,fontWeight:FontWeight.w500
              ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}