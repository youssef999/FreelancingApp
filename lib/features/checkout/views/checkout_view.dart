

import 'package:flutter/material.dart';
import 'package:freelancerApp/core/widgets/custom_app_bar.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBar('', context, false),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: [
          SizedBox(height: 10,),
          
        ]),
      ),
    );
  }
}