import 'package:flutter/material.dart';
import 'package:freelancerApp/core/resources/app_colors.dart';
import 'package:freelancerApp/core/widgets/Custom_Text.dart';
import 'package:freelancerApp/core/widgets/adv.dart';
import 'package:freelancerApp/core/widgets/custom_app_bar.dart';
import 'package:freelancerApp/features/emp/views/emp_details_view.dart';
import 'package:freelancerApp/features/home/views/firebase_data.dart';
import 'package:freelancerApp/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainly,
      appBar: CustomAppBar('Home', context, true),
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              const AdvWidget(),
              GetBuilder<HomeController>(builder: (_) {
                return Column(
                  children: [
                    Container(
                      height: 50,
                      padding: const EdgeInsets.only(left: 10, right: 10),

                      child: TextFormField(
                        onChanged: (value) {
                          print('$value');
                          controller.searchProducts(value);
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Search for  Shirts , Jackets , Pants ...',
                          hintStyle: const TextStyle(height: 1),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    if (controller.isSearching.value &&
                        controller.searchResults.isNotEmpty)
                      GestureDetector(
                        onTap: controller.clearSearch,
                        child: ListView(
                          shrinkWrap: true,
                          padding:const EdgeInsets.all(10),
                          children: controller.searchResults.map((document) {
                            final product =
                                document.data() as Map<String, dynamic>;
                            return Container(
                              margin:
                                  const EdgeInsets.only(top: 0, bottom: 2),
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  color: Colors.white,
                                  border: Border.all(
                                      style: BorderStyle.solid,
                                      color: Colors.white,
                                      width: 1)),
                              child: ListTile(
                                title: Text(product['name'],style: GoogleFonts.cairo(),),
                                trailing: Image.network(product['image'],width: 100,),
                                onTap: () {
                                  Get.toNamed(Routes.SERVICEDETAILS,arguments: document);
                                },
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                  ],
                );
              }),
              const SizedBox(
                height: 20,
              ),
              Text(
                'المهن الاعلي في الطلب',
                textAlign: TextAlign.start,
                style: GoogleFonts.cairo(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const FireBaseView(
                typeFilter: 'top',
                collection: 'services',
              ),
              Text(
                'freelancers'.tr,
                style: GoogleFonts.cairo(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const FireBaseView(
                typeFilter: 'normal',
                collection: 'freelancers',
              ),
const SizedBox(
                height: 11,
              ),
              Text(
                'serviceProviders'.tr,
                style: GoogleFonts.cairo(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            GetBuilder<HomeController>(
              builder: (_) {
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: EmployeeWidget(),
                );
              }
            ),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget EmployeeWidget(){
    HomeController controller=Get.put(HomeController());
    return SizedBox(
      height: 144,
      child: ListView.builder(
        itemCount: controller.empList.length,
        scrollDirection:Axis.horizontal,
      
        itemBuilder: (context, index) {
        return InkWell(
          child: Column(
            children: [
              Container(
                width: 140,
                decoration: BoxDecoration(borderRadius:BorderRadius.circular(20),
                color:AppColors.cardColor
                ),
                child: Column(children: [
                  SizedBox(
                    height: 100,
                    child:Image.network(controller.empList[index]['image']),
                  ),
                  const SizedBox(height: 5,),
                 
                ]),
              ),
         
         const SizedBox(height: 6,),
         Custom_Text(text: controller.empList[index]['name'],
                  fontSize:17,color:AppColors.textColorDark,
                  )    
           ],
          ),
          onTap:(){
             Get.to(EmpDetailsView(
                    emp: controller.empList[index],
                   ));
          },
        );
      }),
    );
  }
}

