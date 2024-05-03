// import 'dart:convert';
// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:vendor/Product%20pages/Services%20Pages/vendorServices.dart';
//
// import '../../Api/sellerApis.dart';
//
//
//
// class FetchVendorServices extends StatefulWidget {
//   const FetchVendorServices({Key? key}) : super(key: key);
//
//   @override
//   State<FetchVendorServices> createState() => _FetchVendorServicesState();
// }
//
// class _FetchVendorServicesState extends State<FetchVendorServices> {
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//   }
//   @override
//   Widget build(BuildContext context) {
//     Size size =MediaQuery.of(context).size;
//     return Scaffold(
//       body: StreamBuilder(
//         stream:SellerApi().fetchSellerProduct(),
//         builder: (context, snapshot) {
//           if( snapshot.hasData ){
//             var data=jsonDecode(snapshot.data!.body);
//
//             return snapshot.data?.statusCode==200
//                 ?
//             VendorServices()
//                 :
//             Center(
//               child: SizedBox(
//                 child: AutoSizeText("Server Error.",
//                   style: GoogleFonts.openSans(
//                       color: Colors.black,
//                       fontSize: size.height*0.018,
//                       fontWeight: FontWeight.w500
//                   ),),
//               ),
//             );
//           }
//           else{
//             return  const Center(
//               child: CircularProgressIndicator(
//                 color: Colors.blue,
//               ),
//             );
//           }
//         },),
//     );
//
//   }
//
// }
