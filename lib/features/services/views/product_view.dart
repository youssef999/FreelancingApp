import 'package:flutter/material.dart';
import 'package:freelancerApp/core/resources/app_colors.dart';
import 'package:freelancerApp/core/widgets/custom_app_bar.dart';
import 'package:freelancerApp/features/services/controllers/product_controller.dart';
import 'package:freelancerApp/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductView extends GetView<ProductController> {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(245, 255, 255, 255),
        appBar: CustomAppBar('Service', context, false),
        body: Form(
          child: ListView(
            children: [
              Container(
                height: 300,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 228, 228, 228),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Center(
                  child: Image.network(controller.posts?['image']),
                ),
              ),
              Center(
                child: txtT('name', 'Hind', 30, FontWeight.w900, Colors.black),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    dvid(40),
                    const SizedBox(
                      height: 5,
                    ),
                    txtS('Price', 'Hind', 20, FontWeight.normal, Colors.black),
                    Row(
                      children: [
                        txtS('starts from', 'Hind', 15, FontWeight.normal,
                            Colors.black),
                        SizedBox(
                          width: 10,
                        ),
                        txtT('price', 'Thasadith', 40, FontWeight.w900,
                            Colors.green),
                        txtS('\$', 'Hind', 20, FontWeight.normal, Colors.black)
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    dvid(30),
                    txtS('About This Item', 'Hind', 22, FontWeight.w300,
                        Colors.black45),
                    Text(controller.posts?['description'],
                        textAlign: TextAlign.center,
                        style: GoogleFonts.cairo(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        )),
                    dvid(60),
                    txtS('Freelancer', 'Hind', 20, FontWeight.w900,
                        Colors.black),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 228, 228, 228),
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        child: Row(
                          children: [
                            Container(
                              width: 90,
                              height: 90,
                              margin: const EdgeInsets.only(left: 10),
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: ClipOval(
                                child: Image.network(
                                  controller.posts?['freelancer_image'],
                                  width: 90,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                Text(
                                  controller.posts!['freelancer_name'],
                                  style: GoogleFonts.cairo(
                                      color: Colors.black, fontSize: 18),
                                ),
                                Text(
                                  controller.posts!['freelancer_email'],
                                  style: GoogleFonts.cairo(
                                      color: Colors.black, fontSize: 18),
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.chat,
                                  color: AppColors.primaryDarkColor,
                                ))
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomSheet: animBtn(() {
          Get.toNamed(Routes.CART);
        }, 'اشتري الخدمة', Colors.green));
  }

  txtT(dynamic txt, String style, double size, FontWeight w, Color color) {
    return Container(
      constraints: const BoxConstraints(maxWidth: double.infinity),
      child: Text(
        controller.posts![txt].toString(),
        style: GoogleFonts.cairo(fontSize: size, fontWeight: w, color: color),
      ),
    );
  }

  txtS(String txt, String style, double size, FontWeight w, Color color) {
    return Text(
      txt,
      style: GoogleFonts.cairo(fontSize: size, fontWeight: w, color: color),
    );
  }

  dvid(double num) {
    return SizedBox(
        height: num,
        child: const Divider(
          indent: 40,
          endIndent: 40,
          color: Color.fromARGB(50, 0, 0, 0),
        ));
  }

  animBtn(void Function() function, String txt, Color color) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: function,
          child: Container(
            height: 50,
            margin: const EdgeInsets.only(bottom: 10, top: 10),
            width: 250,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Center(
              child: Text(
                txt,
                style: GoogleFonts.cairo(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        )
      ],
    );
  }
}
