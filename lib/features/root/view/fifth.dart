import 'package:flutter/material.dart';
import 'package:freelancerApp/core/widgets/custom_app_bar.dart';

class FifthScreen extends StatelessWidget {
  const FifthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('Fifth',context,true),
      body: Container(
        child: Text('Fifth'),
      ),
    );
  }
}
