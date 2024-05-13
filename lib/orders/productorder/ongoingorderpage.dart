import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Api/checkoutapi.dart';
import '../../StateManagement/PageBloc.dart';
import '../../StateManagement/PageState.dart';
import 'ongoingdetails.dart';

class OngoingOrders extends StatefulWidget {
  const OngoingOrders({Key? key,}) : super(key: key);


  @override
  State<OngoingOrders> createState() => _OngoingOrdersState();
}

class _OngoingOrdersState extends State<OngoingOrders> {
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
            padding:  EdgeInsets.only(left: size.width*0.015,right: size.width*0.015),
            child: BlocBuilder<ProductOrderBlo,ProductOrderState>(builder: (context, state) {
              return StreamBuilder(
              stream:CheckoutApi().getOngoingOrders(),
               builder: (context, snapshot) {
              if( snapshot.hasData ){
                var data=jsonDecode(snapshot.data!.body);
                print("$data");
                return snapshot.data?.statusCode==200
                    ?
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText("New Orders (${data["data"].length })",
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600,
                          fontSize: size.height * 0.02,
                        )),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    SizedBox(
                      height: size.height * 0.6,
                      width: size.width * 0.98,
                      child: ListView.builder(
                        itemCount:data["data"].length,
                        padding: EdgeInsets.only(top: size.height*0.01,left: size.width*0.01,right: size.width*0.01),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:  EdgeInsets.only(bottom: size.height*0.012),
                            child: SizedBox(
                              width: size.width * 0.98,
                              child: Card(
                                elevation: 0,
                                shape: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            size.height * 0.005)),
                                    borderSide: BorderSide(
                                        color: Colors.black26,
                                        width: size.height * 0.0007)),
                                color:
                                const Color.fromRGBO(251, 249, 252, 1),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: size.width * 0.03,
                                      top: size.height * 0.01),
                                  child: Column(

                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      AutoSizeText(
                                        "Order Id - ${data["data"][index]["order_id"]} (${data["data"][index]["order_details"].length} items )",
                                        style: GoogleFonts.openSans(
                                            fontSize: size.height * 0.018,
                                            fontWeight: FontWeight.w500,
                                            color: const Color.fromRGBO(
                                                0, 0, 0, 1)),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.01,
                                      ),



                                      AutoSizeText(
                                        data["data"][index]["createdAt"].toString().split("T")[0],
                                        style: GoogleFonts.openSans(
                                            fontSize: size.height * 0.018,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.green),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.008,
                                      ),
                                      Divider(
                                        height: size.height * 0.01,
                                        color: Colors.black26,
                                        thickness: size.height * 0.001,
                                        endIndent: size.width * 0.035,
                                      ),
                                      SizedBox(
                                        height: size.height * .09*data["data"][index]["order_details"].length,
                                        width: size.width * 0.94,
                                        child: ListView.builder(
                                          padding: EdgeInsets.all(size.height*0.0001),
                                          itemCount:data["data"][index]["order_details"].length,
                                          physics: const NeverScrollableScrollPhysics(),
                                          scrollDirection: Axis.vertical,
                                          itemBuilder: (context, index2) {
                                            return
                                              GestureDetector(
                                                onTap: (){
                                                  Navigator.push(context, MaterialPageRoute(builder: (context) =>  OnGoingOrderDetails(orderDetails:data["data"][index]["order_details"][index2],userDetail: data["data"][index]["user"], userAddress: data["data"][index]["user_address"], orderId: data["data"][index]["order_id"].toString(),)),);


                                                },
                                                child: Padding(
                                                  padding: EdgeInsets.all(size.height*0.012),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                    children: [
                                                      Container(
                                                        height: size.height*0.081,
                                                        width: size.width*0.19,
                                                        decoration: data["data"][index]["order_details"][index2]["product"]["product_images"].length>0
                                                            ?
                                                        BoxDecoration(
                                                            image: DecorationImage(
                                                                image: NetworkImage(data["data"][index]["order_details"][index2]["product"]["product_images"][0]["image"]),
                                                                fit: BoxFit.cover
                                                            )
                                                        )
                                                            :
                                                        const BoxDecoration(
                                                            image: DecorationImage(
                                                                image: AssetImage("assets/images/imagePlaceholder.jpg"),
                                                                fit: BoxFit.cover
                                                            )
                                                        ),
                                                      ),
                                                      Column(
                                                        children: [
                                                          SizedBox(
                                                            width:
                                                            size.width *
                                                                0.58,
                                                            child: AutoSizeText(
                                                                "${data["data"][index]["order_details"][index2]["product"]["product_name"].toString()} | ${ data["data"][index]["order_details"][index2]["product"]["clothing_type"].toString()} ",
                                                                style: GoogleFonts
                                                                    .openSans(
                                                                  //fontSize: size.height*0.016,
                                                                    fontWeight: FontWeight
                                                                        .w400,
                                                                    color:
                                                                    Colors.black87),
                                                                maxLines: 3),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );

                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.012,
                                      ),
                                      Divider(
                                        height: size.height * 0.01,
                                        color: Colors.black26,
                                        thickness: size.height * 0.0012,
                                        endIndent: size.width * 0.035,
                                      ),
                                      SizedBox(
                                        child: Padding(
                                          padding: EdgeInsets.all(
                                              size.height * 0.02),
                                          child: AutoSizeText(
                                              "Price -\u{20B9} ${data["data"][index]["total_amount"].toStringAsFixed(2).toString()}  ",
                                              style: GoogleFonts.openSans(
                                                  fontSize:
                                                  size.height * 0.019,
                                                  fontWeight:
                                                  FontWeight.w500,
                                                  color: Colors.black87),
                                              maxLines: 3),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: size.height*0.1,
                    )
                  ],
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
            },
          );
        },),
        ),
      ),
    );
  }
}
