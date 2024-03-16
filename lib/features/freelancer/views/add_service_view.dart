

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:freelancerApp/core/resources/app_colors.dart';
import 'package:freelancerApp/core/widgets/Custom_button.dart';
import 'package:freelancerApp/core/widgets/custom_app_bar.dart';
import 'package:freelancerApp/core/widgets/custom_textformfield.dart';
import 'package:freelancerApp/features/freelancer/controllers/add_services_controller.dart';
import 'package:get/get.dart';

import '../../../core/widgets/Custom_Text.dart';

class AddServicesView extends StatefulWidget {
  const AddServicesView({super.key});

  @override
  State<AddServicesView> createState() => _AddServicesViewState();
}

class _AddServicesViewState extends State<AddServicesView> {

  final controller=Get.put(AddServiceController());

  @override
  void initState() {

controller.getAllCategories();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar:CustomAppBar('',context,false),
      body:Padding(
        padding: const EdgeInsets.all(5.0),
        child: GetBuilder<AddServiceController>(
          builder: (_) {
            return ListView(children: [
                            const SizedBox(height: 20,),
                            (controller.pickedImageXFiles != null
                                && controller.pickedImageXFiles!.isNotEmpty)?
                            Column(
                              children: [
                                Container(
                                  decoration:BoxDecoration(border:
                                  Border.all(color:AppColors.primary,
                                  width: 2
                                  ),

                                  borderRadius:BorderRadius.circular(15)),
                                   
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: InkWell(
                                      child: Container(
                                        height:  MediaQuery.of(context).size.width*0.41,
                                        width: MediaQuery.of(context).size.width*0.6,
                                        
                                        decoration:BoxDecoration(
                                    
                                            image: DecorationImage(
                                                image:
                                            
                                                FileImage(
                                                    File(controller.pickedImageXFiles![0]
                                                        .path)),
                                                
                                                fit:BoxFit.fill
                                            )
                                        ),
                                      ),
                                      onTap:(){
                                        controller.pickMultiImage();
                                      },
                                    ),
                                  ),
                                ),
                              ])
                                :     InkWell(
                              child:  Column(
                                children: [
                                  const CircleAvatar(
                                    radius: 100,
                                    child:Icon(Icons.image,size: 60,)
                                  ),
                                  const SizedBox(height: 10,),
                                  Custom_Text(text: 'addServiceImage'.tr,color:Colors.black,
                                    fontSize:21,alignment:Alignment.center,
                                  ),
                                ],
                              ),
                              onTap:(){
                                controller.pickMultiImage();
                              //  cubit.showDialogBox(context);
                              },
                            ),
                            const SizedBox(height: 5,),
            
            
            
            
            
            
            
              CustomTextFormField(hint: 'serviceName'.tr,
              validateMessage: '',
               obs: false, color: AppColors.textColorDark
               , controller: controller.serviceNameController),
            
               const SizedBox(height: 5,),

                 const SizedBox(
                height: 15,
              ),

              Padding(
                padding: const EdgeInsets.only(top:3.0,left:18,right:18),
                child: GetBuilder<AddServiceController>(
                  builder: (_) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Custom_Text(text: 'selectCat'.tr,
                            fontSize: 16,color:AppColors.textColorDark,
                            ),
                          ],
                        ),
                        const SizedBox(height: 6,),
                        Container(
                          width:MediaQuery.of(context).size.width*0.83,
                          decoration:BoxDecoration(
                            borderRadius:BorderRadius.circular(13),
                            color:Colors.grey[100]!
                          ),
                          child: DropdownButton<String>(
                            value:controller.selectedCategory,
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                controller.changeCatValue(newValue);
                              }
                            },
                            items: controller.catNames.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(value),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    );
                  }
                ),
              ),
            
             CustomTextFormField(hint: 'serviceDetails'.tr,
               obs: false, color: AppColors.textColorDark,
               validateMessage: '',
               max: 6
               , controller: controller.serviceDescriptionController),
            
            
            const SizedBox(height: 5,),
            
             CustomTextFormField(hint: 'servicePrice'.tr,
               obs: false, color: AppColors.textColorDark,
               validateMessage: '',
               type:TextInputType.number
               , controller: controller.servicePriceController),
            
               const SizedBox(height: 5),
            
               CustomButton(text: 'addService'.tr
               , onPressed: (){

              controller. startAddingService();
            
               }, )
            
               
            
            
            
            
            
            
            
            
            ]);
          }
        ),
      ),
    );
  }
}