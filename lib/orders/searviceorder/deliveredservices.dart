import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import 'deliverorderdetails.dart';



class DeliveredServicesPage extends StatefulWidget {
  DeliveredServicesPage({Key? key,required this.deliveredOrders}) : super(key: key);
  List<dynamic>deliveredOrders=[];

  @override
  State<DeliveredServicesPage> createState() => _DeliveredServicesPageState();
}

class _DeliveredServicesPageState extends State<DeliveredServicesPage> {
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText("Delivered Services (${ widget.deliveredOrders.length})",
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.w600,
                    fontSize: size.height * 0.02,
                  )),
              SizedBox(
                height: size.height * 0.01,
              ),
              SizedBox(
                height: size.height * 0.7,
                width: size.width * 0.98,
                child: ListView.builder(
                  itemCount:widget.deliveredOrders.length,
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
                                  "Order Id - ${widget.deliveredOrders[index]["orderId"]} ( ${widget.deliveredOrders[index]["productDetails"].length} items )",
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
                                  "${widget.deliveredOrders[index]["productDetails"][0]["status"]} - (Last Updated Date )",
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
                                  height: size.height * .09*widget.deliveredOrders[index]["productDetails"].length,
                                  width: size.width * 0.94,
                                  child: ListView.builder(
                                    itemCount:widget.deliveredOrders[index]["productDetails"].length,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index2) {
                                      //  print("Index2-$index2---${widget.ongoingOrders[index]["productDetails"][index2]["product"]["productsName"].toString()}");
                                      return
                                        index2!=2
                                            ?
                                        Padding(
                                          padding: EdgeInsets.all(size.height*0.012),
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(context, PageTransition(
                                                  type: PageTransitionType.bottomToTop,
                                                  duration: const Duration(milliseconds: 0),
                                                  childCurrent: DeliveredServicesPage(deliveredOrders: []),
                                                  child: const DeliveredServicesDetails()));

                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceEvenly,
                                              children: [
                                                Container(
                                                  height: size.height *
                                                      0.083,
                                                  width:
                                                  size.width * 0.18,
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: NetworkImage(widget.deliveredOrders[index]["productDetails"][index2]["product"]["productImage"][0]["url"])
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
                                                          "${ widget.deliveredOrders[index]["productDetails"][index2]["product"]["productsName"].toString()} | ${ widget.deliveredOrders[index]["productDetails"][index2]["product"]["type"].toString()} ",
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
                                        )
                                            :
                                        const SizedBox();
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
                                        "Price -\u{20B9} ${widget.deliveredOrders[index]["totalPrice"] }  | Delivery- 10 Days",
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
            ],
          ),
        ),
      ),
    );
  }
}
