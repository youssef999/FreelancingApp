// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:freelancerApp/core/resources/app_colors.dart';


class CustomTextFormField extends StatefulWidget {
  final String hint;
  bool obs;
  bool obx;
  bool? input;
  IconData icon;
  TextInputType type;
  String validateMessage;
  final Color color;
  int ? max;

  TextEditingController controller;

  CustomTextFormField({
    Key? key,
    required this.hint,
    this.max=2,
    this.obx=false,
  this.validateMessage='',
  this.icon=Icons.person,
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
      return  TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: widget.controller,
                      onSaved: (value) {
                       widget.controller.text = value!;
                      },
                      validator: (value) {
                        if (value!.length > 100) {
                          return widget.validateMessage;
                        }
                        if (value.length < 4) {
                          return widget.validateMessage;
                        }
                        return null;
                      },
                      obscureText: widget.obs,
                      decoration: InputDecoration(
                          fillColor: AppColors.whiteColor,
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: AppColors.whiteColor),
                              borderRadius: BorderRadius.circular(20)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: AppColors.whiteColor),
                              borderRadius: BorderRadius.circular(20)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: AppColors.whiteColor),
                              borderRadius: BorderRadius.circular(20)),
                          prefixIcon: Icon(
                            Icons.admin_panel_settings_sharp,
                            color: AppColors.darkColor,
                          ),
                           suffixIcon: IconButton(
              icon: Icon(
                widget.obs ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: () {
                setState(() {
                  widget.obs = !widget.obs;
                });
              }),
                          hintText: 'Password',
                          hintStyle: const TextStyle(color: Colors.black),
                          labelStyle: const TextStyle(color: Colors.black),
                          labelText: 'Password',
                          focusColor: AppColors.whiteColor),
                    );
      
    
    }

    if (widget.obx == false) {
      if(widget.max!>=2){
        return    TextFormField(
                      controller: widget.controller,
                      onSaved: (value) {
                        widget.controller.text= value!;
                      },
                      validator: (value) {
                        if (value!.length > 100) {
                          return widget.validateMessage;
                          //return 'Email Cant Be Larger Than 100 Letter';
                        }
                        if (value.length < 4) {
                          return widget.validateMessage;
                         // return 'Email Cant Be Smaller Than 4 Letter';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          fillColor: AppColors.whiteColor,
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: AppColors.whiteColor),
                              borderRadius: BorderRadius.circular(20)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: AppColors.whiteColor),
                              borderRadius: BorderRadius.circular(20)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: AppColors.whiteColor),
                              borderRadius: BorderRadius.circular(20)),
                          prefixIcon: Icon(
                           widget.icon,
                            color: AppColors.darkColor,
                          ),
                          hintText: widget.hint,
                          hintStyle: const TextStyle(color: Colors.black),
                          labelStyle: const TextStyle(color: Colors.black),
                          labelText: widget.hint),
                      cursorColor: AppColors.darkColor,
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
                  color: AppColors.primary, // Change border color here
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
