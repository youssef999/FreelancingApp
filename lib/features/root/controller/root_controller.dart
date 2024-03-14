import 'package:freelancerApp/features/home/views/home_view.dart';
import 'package:freelancerApp/features/root/view/fifth.dart';
import 'package:freelancerApp/features/root/view/fourth.dart';
import 'package:freelancerApp/features/root/view/secound.dart';
import 'package:freelancerApp/features/root/view/third.dart';
import 'package:get/get.dart';

class RootController extends GetxController {
  RxInt selectedIndex = 0.obs;
  List page = [
     HomeView(),
    const SecondScreen(),
    const ThirdScreen(),
    const ForthScreen(),
    const FifthScreen()
  ];
  void selectedPage(int index) {
    selectedIndex.value = index;
  }
}