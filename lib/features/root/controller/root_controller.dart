// ignore_for_file: unused_local_variable

import 'package:freelancerApp/features/freelancer/orders/views/order_request_view.dart';
import 'package:freelancerApp/features/freelancer/service/views/add_service_view.dart';
import 'package:freelancerApp/features/freelancer/service/views/freelancer_services.dart';
import 'package:freelancerApp/features/home/views/home_view.dart';
import 'package:freelancerApp/features/profile/view/profile_view.dart';
import 'package:freelancerApp/features/root/view/fifth.dart';
import 'package:freelancerApp/features/root/view/fourth.dart';
import 'package:freelancerApp/features/root/view/secound.dart';
import 'package:freelancerApp/features/root/view/third.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../chat/views/all_chats_view.dart';
import '../../orders/views/myorder_view.dart';

class RootController extends GetxController {

  RxInt selectedIndex = 0.obs;

String roleId='';

  
  List page = [
     HomeView(),
     const AllChatsView(),
     const MyOrderView(),
     const ProfileView(),

  ];

  @override
  void onInit() {
    super.onInit();
     final box=GetStorage();
  String roleId =  box.read('roleId')??'1';
  if(roleId=='1'){
    page=[
     HomeView(),
     const AllChatsView(),
     const MyOrderView(),
     const ProfileView(),
    ];
  }else{
    page=[
     HomeView(),
     const AllChatsView(),
    //  const AddServicesView(),
     const OrderRequestView(),
     const ProfileView(),
    ];
  }
  }


  void selectedPage(int index) {
    selectedIndex.value = index;
  }
}
