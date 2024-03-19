

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDropDown extends StatelessWidget {

  String value;
  dynamic function;
  List<String>items;
   CustomDropDown({super.key,required this.value,
   required this.items,
   required this.function});

  @override
  Widget build(BuildContext context) {
    return  
    
    Container(
                              width:MediaQuery.of(context).size.width*0.83,
                              decoration:BoxDecoration(
                                borderRadius:BorderRadius.circular(13),
                                color:Colors.grey[100]!
                              ),
                              child:
                               DropdownButton<String>(
                                value:value,
                                onChanged: (String? newValue) {
                                  if (newValue != null) {
                                    function(newValue);
                                   // controller.changeCatValue(newValue);
                                  }
                                },
                                items: items.map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(value),
                                    ),
                                  );
                                }).toList(),
                              ),
                            );
  }
}