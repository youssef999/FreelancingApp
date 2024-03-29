
import 'package:flutter/material.dart';
import 'package:freelancerApp/core/widgets/custom_app_bar.dart';
import 'package:freelancerApp/features/freelancer/service/controllers/freelancer_services_controller.dart';

import 'package:get/get.dart';

import '../widgets/service_card_widget.dart';



 class FreelancerServicesView extends StatefulWidget {
  const FreelancerServicesView({super.key});

  @override
  State<FreelancerServicesView> createState() => _FreelancerServicesViewState();
}

class _FreelancerServicesViewState extends State<FreelancerServicesView> {

  final controller=Get.put(FreelancerServicesController());

  @override
  void initState() {
    controller.getAllServices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBar('', context,false),
      body:ListView(children:  [

        const SizedBox(height: 12,),

          GetBuilder<FreelancerServicesController>(
          builder: (_) {
            return GridView.builder(
              itemCount: controller.serviceList.length,
              shrinkWrap: true,
              gridDelegate: 
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
            childAspectRatio:1.1,
            crossAxisSpacing: 10
            //mainAxisExtent: 1
            ), 
            itemBuilder: (context, index) {
              
              return ServiceCardWidget(data:controller.serviceList[index]);
            });
          }
        )



        
      ]),
      
    );
  }

  
}
