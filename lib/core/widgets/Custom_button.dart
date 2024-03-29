import 'package:flutter/material.dart';

import '../resources/app_colors.dart';


  class CustomButton extends StatelessWidget {

  final String  text;
  final Function  onPressed;

  const CustomButton({super.key, 
    required this.text,
    required this.onPressed,
  });


  @override
  Widget build(BuildContext context) {
    return
      SizedBox(
        width:110,
        height:62,
        child:InkWell(
          child: 
          Container(
            decoration:  BoxDecoration(
              color: AppColors.buttonColor,
                borderRadius: const BorderRadius.all(Radius.circular(22)),
              boxShadow: [
                BoxShadow(
                  color: AppColors.lightColor.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),

            child: Center(
              child:Padding(
                padding: const EdgeInsets.all(4.0),
                child: 
                Text(
                  text,style:const TextStyle(color:Colors.white,fontSize: 17),
                ),
              
              ),
            ),
          ),
          onTap:(){
            onPressed();
          }
        )


        // RaisedButton(
        //
        //   elevation: 10,
        //   onPressed: onPressed(),
        //   color: color1,
        //   // shape: RoundedRectangleBorder(
        //   //     borderRadius: BorderRadius.circular(30)),
        //   child: Padding(
        //     padding: EdgeInsets.all(10),
        //     child: Text(
        //       text,
        //       style: getRegularStyle(color: color2,fontSize:20)
        //     ),
        //   ),
        // ),
      );



    }
}