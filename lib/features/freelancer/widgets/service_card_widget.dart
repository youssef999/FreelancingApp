import 'package:flutter/material.dart';
import 'package:freelancerApp/Core/resources/app_colors.dart';
import 'package:freelancerApp/core/widgets/Custom_Text.dart';

// ignore: must_be_immutable
class ServiceCardWidget extends StatelessWidget {
  Map<String,dynamic> data;

 ServiceCardWidget({super.key,required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:BoxDecoration(
         boxShadow: [
                BoxShadow(
                  color: Colors.grey[300]!.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
        borderRadius: BorderRadius.circular(11),
        color: Colors.white
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          SizedBox(
            height: 100,
            child:Image.network(data['image'],
              fit:BoxFit.cover,
            ),
          ),
          const SizedBox(height: 4,),
          Custom_Text(text: data['name'],color:AppColors.textColorDark,fontSize: 15,)
        ]),
      )
    );
  }
}