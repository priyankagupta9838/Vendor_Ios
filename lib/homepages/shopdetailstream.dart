import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vendor/homepages/shopdetail.dart';

import '../Api/shopDetailApi.dart';

class ShopDetailStream extends StatefulWidget {
  const ShopDetailStream({super.key});

  @override
  State<ShopDetailStream> createState() => _ShopDetailStreamState();
}

class _ShopDetailStreamState extends State<ShopDetailStream> {
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      body: StreamBuilder(
        stream:ShopDetailApi().getShopDetails(),
        builder: (context, snapshot) {
          if( snapshot.hasData ){
            var data=jsonDecode(snapshot.data!.body);
            return snapshot.data?.statusCode==200
                ?
             ShopDetail(shopDetails: data["data"],)
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
        },),
    );
  }
}
