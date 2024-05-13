import 'dart:convert';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Api/sellerApis.dart';
import '../StateManagement/PageBloc.dart';
import '../StateManagement/PageState.dart';
import 'SellNow.dart';

class FetchVendorProduct extends StatefulWidget {
  const FetchVendorProduct({Key? key}) : super(key: key);

  @override
  State<FetchVendorProduct> createState() => _FetchVendorProductState();
}

class _FetchVendorProductState extends State<FetchVendorProduct> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Column(
      children: [
        BlocBuilder<AddProductBlo,AddProductState>(builder: (context, state) {
           return StreamBuilder(
             stream:SellerApi().fetchSellerProduct(),
             builder: (context, snapshot) {
               if( snapshot.hasData ){
                 var data=jsonDecode(snapshot.data!.body);

                 return snapshot.data?.statusCode==200
                     ?
                 SellNow(fetchedData: data["data"],)
                     :
                 Center(
                   child: SizedBox(
                     child: AutoSizeText("Server Error.",
                       style: GoogleFonts.openSans(
                           color: Colors.black,
                           fontSize: size.height*0.018,
                           fontWeight: FontWeight.w500
                       ),),
                   ),
                 );
               }
               else{
                 return  const Center(
                   child: CircularProgressIndicator(
                     color: Colors.blue,
                   ),
                 );
               }
             },);
        },)
      ],
    );

  }

}
