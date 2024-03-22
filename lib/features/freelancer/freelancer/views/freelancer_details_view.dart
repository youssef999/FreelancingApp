


// ignore_for_file: must_be_immutable


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freelancerApp/core/resources/app_colors.dart';
import 'package:freelancerApp/core/widgets/Custom_Text.dart';
import 'package:freelancerApp/core/widgets/custom_app_bar.dart';
import 'package:freelancerApp/features/freelancer/freelancer/controllers/freelancer_controller.dart';
import 'package:freelancerApp/features/freelancer/freelancer/views/show_service_details.dart';
import 'package:freelancerApp/routes/app_routes.dart';
import 'package:get/get.dart';

class FreelancerDetailsView extends StatefulWidget {
  DocumentSnapshot data;

  FreelancerDetailsView({super.key, required this.data});


  @override
  State<FreelancerDetailsView> createState() => _FreelancerDetailsViewState();
}

class _FreelancerDetailsViewState extends State<FreelancerDetailsView> {

FreelancerController controller=Get.put(FreelancerController());
  @override
  void initState() {
   controller.getFreelancerServices();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.backgroundColor,
      appBar:CustomAppBar('', context, false),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: [
          const SizedBox(height: 11,),
          Row(
            children: [
              CircleAvatar(
                radius: 55,
                backgroundImage:NetworkImage(widget.data['image']),
              ),
              const SizedBox(width:20,),
              Custom_Text(text: widget.data['name'],
              fontSize:22,color:AppColors.textColorDark,
              fontWeight:FontWeight.w600,
              ),
            ],
          ),
          const SizedBox(height: 5,),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Custom_Text(text: widget.data['des'],
                fontSize:16,color:AppColors.textColorGreyMode,
                fontWeight:FontWeight.w500,
                ),
           ),
           const SizedBox(height: 5,),
           Custom_Text(text: 'services'.tr,
           fontSize:20,color:AppColors.textColorDark,
           ),
            const SizedBox(height: 5,),
           GetBuilder<FreelancerController>(
             builder: (_) {
               return freelancerServiceWidget();
             }
           )

          
        ]),
      ),
    );
  }

  Widget freelancerServiceWidget(){

    FreelancerController controller=Get.put(FreelancerController());
    
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount:controller.freelancerServicesList.length,
      itemBuilder: ((context, index) {
      return InkWell(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            decoration:BoxDecoration(
              borderRadius:BorderRadius.circular(12),
              color:AppColors.cardColor
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(children: [
             
              
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: SizedBox(
                    height: 150,
                    width:300,
                    child: Image.network(controller.freelancerServicesList
                    [index]['image'],
                      fit:BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 5,),
              
                Custom_Text(text:
                 controller.freelancerServicesList[index]['name'],
                 fontSize: 18,
                 color:AppColors.textColorDark,
                 fontWeight:FontWeight.w600,
                 ),
                  const SizedBox(height: 5,),
              
                
              ]),
            ),
          ),
        ),
        onTap:(){
          Get.to(ShowServiceDetails(data: 
          controller.freelancerServicesList[index],));
          // Get.to(ShowServiceDetails(posts: 
          // controller.freelancerServicesList[index],));
         
        },
      );
    }));
  }
}