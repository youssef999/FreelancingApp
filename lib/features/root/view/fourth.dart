import 'package:flutter/material.dart';
import 'package:freelancerApp/core/widgets/custom_app_bar.dart';

class ForthScreen extends StatelessWidget {
  const ForthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
appBar: CustomAppBar('Forth',context),
      body: Text('Forth'),
    );
  }
}
