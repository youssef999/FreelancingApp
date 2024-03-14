import 'package:flutter/material.dart';
import 'package:freelancerApp/core/resources/app_assets.dart';
import 'package:freelancerApp/core/resources/app_colors.dart';
import 'package:freelancerApp/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../core/widgets/custom_app_bar.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final box = GetStorage();

  @override
  void initState() {
    String email = box.read('email') ?? 'x';
    Future.delayed(const Duration(seconds: 3)).then((value) {
      if (email == 'x') {
        Get.toNamed(Routes.HOME);
      } else {
        //  Get.offNamed('/CheckView');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: CustomAppBar('', false, 4),
      body: SizedBox(
        height: 444,
        child: Image.asset(
          AppAssets.logo,
          fit: BoxFit.cover,
        ),
      ),
      // Stack(
      //   children: [
      //     Center(
      //       child: SizedBox(
      //        height:MediaQuery.of(context).size.height,
      //         child:Image.asset('assets/images/ss.png'),
      //       ),
      //     ),
      //     // Center(
      //     //   child: SizedBox(
      //     //       height: 150,
      //     //       child: Image.asset('assets/images/logo.png')),
      //     // ),
      //     //
      //     // Positioned(
      //     //   top:MediaQuery.of(context).size.height/1.6,
      //     //   right:MediaQuery.of(context).size.width/2.8,
      //     //  // left:MediaQuery.of(context).size.width/1.2,
      //     //   child: const Text("Seller App",
      //     //   style:TextStyle(color:Colors.white,
      //     //   fontSize: 31,fontWeight:FontWeight.w800
      //     //   ),
      //     //   ),
      //     // )
      //   ],
      // )
      // Center(
      //   child:Padding(
      //     padding: const EdgeInsets.all(25.0),
      //     child: SizedBox(
      //         height: 260,
      //         child: Image.asset(AppAssets.logo,
      //         fit:BoxFit.cover,
      //         )),
      //   ),
      // ),
    );
  }
}
