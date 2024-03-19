

// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freelancerApp/core/widgets/Custom_button.dart';
import 'package:freelancerApp/core/widgets/custom_app_bar.dart';

class OrderServiceView extends StatefulWidget {
  DocumentSnapshot data;

OrderServiceView ({super.key,required this.data});

  @override
  State<OrderServiceView > createState() => _MyWidgetState();
}

class _MyWidgetState extends State<OrderServiceView > {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBar('', context, false),
      body: Padding(
        padding:  const EdgeInsets.all(6.0),
        child: ListView(children: [
          SizedBox(
            height: 200,
            child:Image.network(widget.data['image'],),
          ),
          const SizedBox(height: 11,),
          Text(widget.data['name']),
            const SizedBox(height: 21,),
            CustomButton(text: 'ORDER Now', onPressed: (){

            })
          
        ]),
      ),
    );
  }
}