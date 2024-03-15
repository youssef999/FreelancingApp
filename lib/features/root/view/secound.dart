import 'package:flutter/material.dart';
import 'package:freelancerApp/core/widgets/custom_app_bar.dart';
import 'package:freelancerApp/features/root/controller/root_controller.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class SecondScreen extends GetView<RootController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: CustomAppBar('Second',context,true),
      body: Container(child: Text('Secound'),),
    );
  }
}
