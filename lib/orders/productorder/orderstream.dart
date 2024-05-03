/*
import 'dart:convert';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seller/App%20sections/Order%20Pages/all%20orders.dart';
import '../../Api/checkoutApi.dart';
import 'OrdersMainPage.dart';


class OrderStream extends StatefulWidget {
  const OrderStream({Key? key,}) : super(key: key);


  @override
  State<OrderStream> createState() => _OrderStreamState();
}

class _OrderStreamState extends State<OrderStream> {


  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(194, 172, 209, 1),
        title:  AutoSizeText("My Orders",style: GoogleFonts.roboto(
            color: Colors.white,
          fontSize: size.height*0.025,
          fontWeight: FontWeight.w400
        ),),
        centerTitle: true,
      ),
      body: SizedBox(
          height: size.height,
          width: size.width,
          child:StreamBuilder(
            stream:CheckoutApi().getCheckout(),
            builder: (context, snapshot) {
              if( snapshot.hasData ){
                List<dynamic>pendingOrders=[];
                List<dynamic>rejectedOrders=[];
                List<dynamic>deliveredOrders=[];
                var data=jsonDecode(snapshot.data!.body);
                for(var map in data["data"]){
                  if(map["productDetails"]!=null){
                    for(var product in map["productDetails"])
                    {
                      if(product["status"]=="pending" || product["status"]=="accepted"){
                        pendingOrders.add(map);
                      }
                      else if(product["status"]=="delivered"){
                        deliveredOrders.add(map);
                      }
                      else if(product["status"]=="rejected"){
                        print("Status is :${product["status"]}");
                        rejectedOrders.add(map);
                      }
                    }
                  }
                }
                return snapshot.data?.statusCode==200
                    ?
                SizedBox(
                  height: size.height,
                  width: size.width,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    child: Column(
                      children: [

                        SizedBox(
                          height: size.height,
                          width: size.width,
                          child: OrderMainPage()
                        )
                      ],
                    ),
                  ),
                )
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
            },)







      ),
    );

  }



}

*/
