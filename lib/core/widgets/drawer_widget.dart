// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freelancerApp/core/resources/app_colors.dart';
import 'package:freelancerApp/core/widgets/custom_image_widget.dart';
import 'package:freelancerApp/features/freelancer/orders/views/order_view.dart';
import 'package:freelancerApp/features/freelancer/views/add_service_view.dart';
import 'package:freelancerApp/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDrawer extends StatefulWidget {
   const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {

  String? roleId;
      @override
  void initState() {  var box = GetStorage();
         roleId = box.read('roleId');
             data();
    super.initState();
  } 
 
  Future<QuerySnapshot<Map<String, dynamic>>> getUserDataByEmail(
      String email) async {
        print(roleId);
    final userRef = FirebaseFirestore.instance.collection(roleId == '1' ? 'users':'freelancers');
    return await userRef.where('email', isEqualTo: email).get();
  }

  Map<String, dynamic>? userData;

  void data() async {
    final User? currentUser = FirebaseAuth.instance.currentUser;
    final String? email = currentUser?.email;

    if (email != null) {
      final snapshot = await getUserDataByEmail(email);
      if (snapshot.docs.isNotEmpty) {
        setState(() {
          userData = snapshot.docs.first.data();
        });
      }
    }
  }




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        width: MediaQuery.of(context).size.width / 1.34,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topRight: Radius.circular(
            24 * 2,
          ),
        )),
        backgroundColor: AppColors.secondaryLightColor,
        child: ListView(
          children: [
            _userImgWidget(context),
            _userTextwidget(context),
            const Divider(
              color: AppColors.whiteColor,
              endIndent: 5,
              indent: 5,
            ),
            _drawerWidget(context),
          ],
        ),
      ),
    );
  }

  _userImgWidget(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(
          top: 24 * 1,
          bottom: 24,
        ),
        height: 12 * 8.3,
        width: 10 * 11.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10 * 1.5),
          color: AppColors.primaryBGLightColor,
          border: Border.all(color: AppColors.primaryBGLightColor, width: 5),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: FadeInImage(
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
            image:  NetworkImage(
              userData?['image'] ?? '',
            ),
            placeholder: const AssetImage(
              'assets/images/user.png',
            ),
            imageErrorBuilder: (context, error, stackTrace) {
              return Image.asset(
                'assets/images/user.png',
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
              );
            },
          ),
        ),
      ),
    );
  }

  _userTextwidget(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Text(
            userData?['name'] ?? 'Username',
            textAlign: TextAlign.start,
            style: GoogleFonts.cairo(
              fontSize: 17,
              color: AppColors.whiteColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            userData?['email'] ?? 'email@gmail.com',
            textAlign: TextAlign.start,
            style: GoogleFonts.cairo(
              fontSize: 17,
              color: AppColors.whiteColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  _drawerWidget(BuildContext context) {
    final box=GetStorage();
    var roleId=box.read('roleId');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _drawerTileWidget(
          icon: 'assets/icon/kyc_verification.svg',
          title: 'المستخدمين',
          onTap: () {
            Get.to(const OrdersView());
          },
        ),
        (roleId==0)?
        _drawerTileWidget(
          icon: 'assets/icon/transactions_log.svg',
          title: 'اضف خدمة جديدة',
          onTap: () {
            Get.to(const AddServicesView());
          },
        ):const SizedBox(),

        _drawerTileWidget(
          icon: 'assets/icon/change_password.svg',
          title: 'اعدادات',
          onTap: () {},
        ),
        _drawerTileWidget(
          icon: 'assets/icon/help_center.svg',
          title: 'مساعدة',
          onTap: () {},
        ),
        _drawerTileWidget(
          icon: 'assets/icon/privacy_policy.svg',
          title: 'سياسة الخصوصية',
          onTap: () {},
        ),
        const Divider(
          color: AppColors.whiteColor,
          endIndent: 50,
          indent: 50,
        ),
        _drawerTileWidget(
          icon: 'assets/icon/about_us.svg',
          title: 'اعرف عنا',
          onTap: () {},
        ),
        _drawerTileWidget(
          icon: 'assets/icon/sign_out.svg',
          title: 'تسجيل الخروج',
          color: Colors.red,
          onTap: () {
            Get.toNamed(Routes.LOGIN);
          },
        )
      ],
    );
  }

  _drawerTileWidget(
      {required VoidCallback onTap,
      required String title,
      required String icon,
      Color? color}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15 * 1,
          vertical: 50 * 0.2,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              height: 12 * 2.5,
              width: 10 * 3.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10 * 0.7),
                color: AppColors.whiteColor.withOpacity(0.2),
              ),
              child: Container(
                padding: const EdgeInsets.all(10 * 0.2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10 * 0.7,
                    ),
                    color: AppColors.primaryBGLightColor),
                child: CustomImageWidget(
                  path: icon,
                  height: 12 * 2,
                  width: 10 * 2.2,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Text(
                title,
                textAlign: TextAlign.start,
                style: GoogleFonts.cairo(
                  fontSize: 15,
                  color: color ?? AppColors.whiteColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
