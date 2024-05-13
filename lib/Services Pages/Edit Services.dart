// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:vendor/utilityfunctions.dart';
//
// import '../Account Related/account.dart';
//
// class EditService extends StatefulWidget {
//   const EditService({super.key});
//
//   @override
//   State<EditService> createState() => _EditServiceState();
// }
//
// class _EditServiceState extends State<EditService> {
//
//   TextEditingController selectedService =TextEditingController();
//   TextEditingController clothingItemName=TextEditingController();
//   TextEditingController clothingItemType=TextEditingController();
//   TextEditingController setServicePrice=TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: SizedBox(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: size.height*0.06,
//             ),
//             Container(
//               color: const Color.fromRGBO(247, 244, 249, 1),
//               height: size.height*0.065,
//               width: size.width,
//               child: Row(
//                 children: [
//                   IconButton(
//                       onPressed: (){
//                         Navigator.pop(context);
//                       },
//                       icon: const Icon(CupertinoIcons.arrow_left,color: Colors.black,) ),
//                   SizedBox(width: size.width*0.135,),
//                   AutoSizeText("Add Services Details",style: GoogleFonts.openSans(
//                       color: textColor,
//                       fontWeight: FontWeight.w500,
//                       fontSize: size.height*0.025
//
//                   ),),
//
//
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: size.height * 0.01,
//             ),
//
//             Expanded(
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.vertical,
//                 child: Padding(
//                   padding: EdgeInsets.all(size.height * 0.02),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       AutoSizeText(
//                         "Service Selected",
//                         style: GoogleFonts.openSans(
//                           fontSize: size.height * 0.02,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       SizedBox(
//                         height: size.height * 0.015,
//                       ),
//                       SizedBox(
//                         height: size.height*0.062,
//                         child: TextField(
//                           controller: selectedService,
//                           decoration: InputDecoration(
//                             prefixIcon: const Icon(Icons.check),
//                             labelText: 'Stitching',
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.all(
//                                   Radius.circular(size.height * 0.01),
//                                 ),
//                                 borderSide: const BorderSide(width: 1, color: Colors.grey)),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: size.height * 0.03,
//                       ),
//                       AutoSizeText(
//                         "Clothing item Name",
//                         style: GoogleFonts.openSans(
//                           fontSize: size.height * 0.02,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       SizedBox(
//                         height: size.height * 0.015,
//                       ),
//                       SizedBox(
//                         height: size.height*0.062,
//                         child: TextField(
//                           controller: clothingItemType,
//                           decoration: InputDecoration(
//                             suffixIcon: Icon(Icons.cancel_outlined),
//                             labelText: '',
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.all(
//                                   Radius.circular(size.height * 0.01),
//                                 ),
//                                 borderSide: BorderSide(width: 1, color: Colors.grey)),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: size.height * 0.01,
//                       ),
//                       Padding(
//                         padding:  EdgeInsets.only(left: size.width*0.025),
//                         child: AutoSizeText("E.g.: Blouse, Pants",
//                           style: GoogleFonts.openSans(
//                             fontSize: size.height * 0.016,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: size.height * 0.03,
//                       ),
//                       AutoSizeText(
//                         "Clothing item type or style:",
//                         style: GoogleFonts.openSans(
//                           fontSize: size.height * 0.02,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       SizedBox(
//                         height: size.height * 0.016,
//                       ),
//                       SizedBox(
//                         height: size.height*0.062,
//                         child: TextField(
//                           controller: clothingItemType,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.all(
//                                   Radius.circular(size.height * 0.01),
//                                 ),
//                                 borderSide: BorderSide(width: 1, color: Colors.grey)),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: size.height * 0.01,
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(left: size.width*0.025),
//                         child: AutoSizeText("E.g.: Short Pants, Long Pants",
//                           style: GoogleFonts.openSans(
//                             fontSize: size.height * 0.015,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: size.height * 0.03,
//                       ),
//                       AutoSizeText(
//                         "Set Service Price",
//                         style: GoogleFonts.openSans(
//                           fontSize: size.height * 0.02,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       SizedBox(
//                         height: size.height * 0.02,
//                       ),
//                       SizedBox(
//                         height: size.height*0.062,
//                         child: TextField(
//                           controller: setServicePrice,
//                           decoration: InputDecoration(
//                             //  labelText: '₹2,5000',
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.all(
//                                   Radius.circular(size.height * 0.01),
//                                 ),
//                                 borderSide: const BorderSide(width: 1, color: Colors.grey)),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: size.height * 0.04,
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           if(selectedService.text.isNotEmpty && clothingItemName.text.isNotEmpty && clothingItemType.text.isNotEmpty && setServicePrice.text.isNotEmpty){
//
//                           }
//                           else{
//                             UtilityFunctions().errorScreen(context,"All fields are required." );
//                           }
//                         },
//                         child: Container(
//                           height: size.height*0.058,
//                           width: size.width,
//                           decoration: BoxDecoration(
//                               color: const Color.fromRGBO(174, 144, 194, 1),
//                               borderRadius: BorderRadius.circular(size.height*0.01)
//                           ),
//
//                           child:
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(Icons.arrow_forward,color: Colors.white,size: size.width*0.055,),
//                               SizedBox(
//                                 width: size.width*0.03,
//                               ),
//                               Text("Submit Details",
//                                 style: GoogleFonts.openSans(
//                                     fontSize: size.height * 0.021,
//                                     fontWeight: FontWeight.w600,
//                                     color: Colors.white
//                                 ),),
//                             ],
//                           ),
//
//
//                         ),
//                       )
//
//                     ],
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
