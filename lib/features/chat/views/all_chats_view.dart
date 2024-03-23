

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:freelancerApp/core/resources/app_assets.dart';
import 'package:freelancerApp/core/resources/app_colors.dart';
import 'package:freelancerApp/core/widgets/Custom_Text.dart';
import 'package:freelancerApp/core/widgets/Custom_button.dart';
import 'package:freelancerApp/core/widgets/custom_app_bar.dart';
import 'package:freelancerApp/features/chat/controllers/chat_controller.dart';
import 'package:freelancerApp/features/chat/views/chat_view.dart';
import 'package:get/get.dart';

class AllChatsView extends StatefulWidget {
  const AllChatsView({super.key});

  @override
  State<AllChatsView> createState() => _AllChatsViewState();
}

class _AllChatsViewState extends State<AllChatsView> {


ChatController controller=Get.put(ChatController());
  @override
  void initState() {

 controller.getAllUserChat();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainly,
      appBar:CustomAppBar('', context, false),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children:  [
          AllChatWidget(controller: controller,)
        ]),
      ),
    );
  }
}
class AllChatWidget extends StatelessWidget {

  ChatController controller;
   AllChatWidget({super.key,required this.controller});

  @override
  Widget build(BuildContext context) {

    return GetBuilder<ChatController>(
      builder: (_) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount:controller.recNames.length,
          itemBuilder:((context, index) {
            return  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                    decoration:BoxDecoration(
              borderRadius:BorderRadius.circular(15),
              color:AppColors.cardColor
              ),
              child: Padding(padding: const EdgeInsets.all(12),
              child:Column(children: [
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children: [
                    Custom_Text(text: controller.recNames[index],
                    color:AppColors.textColorDark,fontSize: 15,),
                 
                    CustomButton(text: 'chat'.tr, onPressed: (){

                        Get.to( ChatView(
                          rec: controller.recNames[index],
                        ));
                    })
                   
                  ],
                ),
                
                
              
              
              ]),
              
              ),
                  ),
            );
          
        }));
      }
    );
  
    
  
   
  }
}