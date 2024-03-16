

// import 'package:flutter/material.dart';
// import 'package:freelancerApp/features/freelancer/controllers/add_services_controller.dart';
// import 'package:get/get.dart';

// class DropDownWidget extends StatelessWidget {

//   String value;

// Function onChange;

// List<String>items;

//   DropDownWidget({super.key,required this.value,required this.items,required this.onChange});

//   @override
//   Widget build(BuildContext context) {
//     return  Builder(
//       builder: (context) {
//         return GetBuilder<AddServiceController>(
//           builder: (_) {
//             return Container(
//                                   width:MediaQuery.of(context).size.width*0.83,
//                                   decoration:BoxDecoration(
//                                     borderRadius:BorderRadius.circular(13),
//                                     color:Colors.grey[100]!
//                                   ),
//                                   child: DropdownButton<String>(
//                                     value:value,
//                                     onChanged: (String? newValue) {
//                                       if (newValue != null) {
//                                         onChange(newValue);
//                                       }
//                                     },
//                                     items: items.map<DropdownMenuItem<String>>((String value) {
//                                       return DropdownMenuItem<String>(
//                                         value: value,
//                                         child: Padding(
//                                           padding: const EdgeInsets.all(8.0),
//                                           child: Text(value),
//                                         ),
//                                       );
//                                     }).toList(),
//                                   ),
//                                 );
//           }
//         );
//       }
//     );
//   }
// }