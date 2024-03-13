// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:freelancerApp/core/resources/app_colors.dart';


class CustomTextFormField extends StatefulWidget {
  final String hint;
  bool obs;
  bool obx;
  bool? input;
  TextInputType type;
  final Color color;
  int ? max;

  TextEditingController controller;

  CustomTextFormField({
    Key? key,
    required this.hint,
    this.max=2,
    this.obx=false,
    this.type=TextInputType.text,
    this.input,
    required this.obs,
    required this.color,
    required this.controller,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    if (widget.obx == true) {
      return Container(
        height:82,
        padding: const EdgeInsets.only(right: 16,bottom: 3,left:14),
        decoration:BoxDecoration(
            borderRadius: BorderRadius.circular(11),
            color:Colors.white
        ),
        child: TextFormField(
          keyboardType: TextInputType.text,
          obscureText: widget.obs,
          controller: widget.controller,
          style: const TextStyle(
            color: Colors.black,
          ),
          decoration: InputDecoration(
            focusedBorder:  OutlineInputBorder(
              borderSide:  BorderSide(
                color: AppColors.greyColor, // Change border color here
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(14.0),

            ),

            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.blue, // Border color
                width: 2.0, // Border width
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            label: Text(widget.hint,
                style:const TextStyle(color:Colors.grey,
                )),
            //hintText: widget.hint,
            labelStyle: TextStyle(
                color: widget.color,
                fontSize:12
            ),
            hintStyle:  TextStyle(color: Colors.grey[700]),
            fillColor: Colors.white,
            suffixIcon: IconButton(
              icon: Icon(
                widget.obs ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  widget.obs = !widget.obs;
                });
              },
            ),
          ),
        ),
      );
    }

    if (widget.obx == false) {
      if(widget.max!>=2){
        return Container(
          //  height:82,
          decoration:BoxDecoration(
            //  border:Border.all(color:Colors.grey[200]!),
              borderRadius: BorderRadius.circular(19),
              color:Colors.white),
          padding: const EdgeInsets.all(11),
          child: TextFormField(
            obscureText: widget.obs,
            keyboardType: widget.type,
            maxLines: widget.max,
            controller: widget.controller,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 14
            ),
            decoration: InputDecoration(
              focusedBorder:  OutlineInputBorder(
                borderSide:  BorderSide(
                  color:AppColors.greyColor, // Change border color here
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(14.0),
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.blue, // Border color
                  width: 2.0, // Border width
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
              labelStyle: TextStyle(
                  color: widget.color,
                  fontSize:12
              ),
              label: Text(widget.hint,style:const TextStyle(color:Colors.grey)),

              //  hintText: widget.hint,
              //hintStyle: TextStyle(color: Colors.grey),
              fillColor: Colors.white,
            ),
          ),
        );
      }
      else{
        return Container(
          height:82,
          decoration:const BoxDecoration(
              color:Colors.white),
          padding: const EdgeInsets.all(11),
          child: TextFormField(
            obscureText: widget.obs,
            keyboardType: widget.type,
            maxLines: widget.max,
            controller: widget.controller,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 14
            ),
            decoration: InputDecoration(
              focusedBorder:  OutlineInputBorder(
                borderSide:  BorderSide(
                  color:AppColors.greyColor,// Change border color here
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(14.0),
              ),
              border: OutlineInputBorder(

                borderSide: const BorderSide(
                  color: Colors.blue, // Border color
                  width: 2.0, // Border width
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
              labelStyle: TextStyle(
                  color: widget.color,
                  fontSize:12
              ),
              label: Text(widget.hint,style:const TextStyle(color:Colors.grey)),

              //  hintText: widget.hint,
              //hintStyle: TextStyle(color: Colors.grey),
              fillColor: Colors.white,
            ),
          ),
        );
      }

    }

    if (widget.input == true) {
      return Container(
        padding: const EdgeInsets.all(11),
        decoration:BoxDecoration(
            border:Border.all(color:Colors.black45),
            borderRadius: BorderRadius.circular(2),
            color:Colors.white),
        child: TextFormField(
          obscureText: widget.obs,
          keyboardType: TextInputType.number,
          maxLines: widget.max,
          controller: widget.controller,
          style: const TextStyle(
            color: Colors.black,
          ),
          decoration: InputDecoration(
            label: Text(widget.hint,style:const TextStyle(color:Colors.grey)),
            hintStyle:  TextStyle(color: Colors.grey[700]!),
            fillColor: Colors.white,
          ),
        ),
      );
    }

    return Container();
  }
}
