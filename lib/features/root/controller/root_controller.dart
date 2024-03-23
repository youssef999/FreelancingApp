import 'package:freelancerApp/features/freelancer/service/views/add_service_view.dart';
import 'package:freelancerApp/features/freelancer/service/views/freelancer_services.dart';
import 'package:freelancerApp/features/home/views/home_view.dart';
import 'package:freelancerApp/features/root/view/fifth.dart';
import 'package:freelancerApp/features/root/view/fourth.dart';
import 'package:freelancerApp/features/root/view/secound.dart';
import 'package:freelancerApp/features/root/view/third.dart';
import 'package:get/get.dart';

import '../../chat/views/all_chats_view.dart';

class RootController extends GetxController {
  RxInt selectedIndex = 0.obs;
  List page = [
     HomeView(),
     SecondScreen(),
      SecondScreen(),
    // const AddServicesView(),
     const FreelancerServicesView(),
  const AllChatsView(),
    //const ForthScreen(),
   // const FifthScreen()
  ];
  void selectedPage(int index) {
    selectedIndex.value = index;
  }
}
