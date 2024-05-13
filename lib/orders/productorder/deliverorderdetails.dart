import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class DeliveredOrderDetails extends StatefulWidget {
  const DeliveredOrderDetails({Key? key}) : super(key: key);

  @override
  State<DeliveredOrderDetails> createState() => _DeliveredOrderDetailsState();
}

class _DeliveredOrderDetailsState extends State<DeliveredOrderDetails> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(194, 172, 209, 1),
        title: const Text("Delivered Order Details",style: TextStyle(
            color: Colors.white
        ),),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back,size: size.width*0.055,color: Colors.white,),
        ),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height*0.014,
              ),
              Padding(
                padding:  EdgeInsets.only(left: size.width*0.024),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AutoSizeText("Order Id - [Order_Id]",
                      style:GoogleFonts.openSans(
                          color: Colors.black87,
                          fontSize: size.height*0.022,
                          fontWeight: FontWeight.w500
                      ),),
                    AutoSizeText("Date  ",
                      style:GoogleFonts.openSans(
                          color: const Color.fromRGBO(35, 29, 39, 1),
                          fontSize: size.height*0.02,
                          fontWeight: FontWeight.w500
                      ),)
                  ],
                ),
              ),
              SizedBox(
                height: size.height*0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: size.height*0.081,
                    width: size.width*0.19,
                    color: Colors.grey,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: size.width*0.58,
                        child: AutoSizeText(
                            "[Service_Type]:[Clothes_Name]+[Clothes_Type]",
                            style: GoogleFonts.openSans(
                              //fontSize: size.height*0.016,
                                fontWeight: FontWeight.w400,
                                color: Colors.black87
                            ),
                            maxLines: 3),
                      ),


                    ],
                  )
                ],
              ),
              SizedBox(
                height: size.height*0.014,
              ),
              Divider(
                color: Colors.black26,
                thickness: size.height*0.0007,
                endIndent: size.width*0.035,
                indent: size.width*0.035,
              ),
              Padding(
                padding:  EdgeInsets.only(left: size.width*0.024),
                child: AutoSizeText("Customer Info",
                  style:GoogleFonts.openSans(
                      color: Colors.black87,
                      fontSize: size.height*0.023,
                      fontWeight: FontWeight.w600
                  ),),
              ),
              SizedBox(
                height: size.height*0.014,
              ),
              Padding(
                padding:  EdgeInsets.only(left: size.width*0.024),
                child: AutoSizeText("Customer Name",
                  style:GoogleFonts.openSans(
                      color: Colors.black87,
                      fontSize: size.height*0.018,
                      fontWeight: FontWeight.w500
                  ),),

              ),
              Divider(
                color: Colors.black26,
                thickness: size.height*0.0007,
                endIndent: size.width*0.035,
                indent: size.width*0.035,
              ),
              SizedBox(
                height: size.height*0.0085,
              ),
              Padding(
                padding:  EdgeInsets.only(left: size.width*0.024),
                child: AutoSizeText("Order Status",
                  style:GoogleFonts.openSans(
                      color: Colors.black87,
                      fontSize: size.height*0.026,
                      fontWeight: FontWeight.w600
                  ),),
              ),
              SizedBox(
                height: size.height*0.02,
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width*0.024),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      //width: size.width*0.6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.person,size: size.height*0.028,color: Colors.green,),
                          Padding(
                            padding:  EdgeInsets.only(left: size.width*0.024),
                            child: AutoSizeText("Order Received,",
                              style:GoogleFonts.openSans(
                                  color: Colors.green,
                                  fontSize: size.height*0.02,
                                  fontWeight: FontWeight.w500
                              ),),
                          ),
                        ],
                      ),
                    ),
                    AutoSizeText("Date    ",
                      style:GoogleFonts.openSans(
                          color: Colors.green,
                          fontSize: size.height*0.02,
                          fontWeight: FontWeight.w500
                      ),)
                  ],
                ),
              ),
              SizedBox(
                height: size.height*0.02,
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width*0.024),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      //width: size.width*0.6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.person,size: size.height*0.028,color: Colors.green,),
                          Padding(
                            padding:  EdgeInsets.only(left: size.width*0.024),
                            child: AutoSizeText("Order Accepted/Rejected,",
                              style:GoogleFonts.openSans(
                                  color: Colors.green,
                                  fontSize: size.height*0.02,
                                  fontWeight: FontWeight.w500
                              ),),
                          ),
                        ],
                      ),
                    ),
                    AutoSizeText("Date    ",
                      style:GoogleFonts.openSans(
                          color: Colors.green,
                          fontSize: size.height*0.02,
                          fontWeight: FontWeight.w500
                      ),)
                  ],
                ),
              ),
              SizedBox(
                height: size.height*0.02,
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width*0.024),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      //width: size.width*0.6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.person,size: size.height*0.028,color: Colors.green,),
                          Padding(
                            padding:  EdgeInsets.only(left: size.width*0.024),
                            child: AutoSizeText("Order Ready for Pick-UP,",
                              style:GoogleFonts.openSans(
                                  color: Colors.green,
                                  fontSize: size.height*0.02,
                                  fontWeight: FontWeight.w500
                              ),),
                          ),
                        ],
                      ),
                    ),
                    AutoSizeText("Date    ",
                      style:GoogleFonts.openSans(
                          color: Colors.green,
                          fontSize: size.height*0.02,
                          fontWeight: FontWeight.w500
                      ),)
                  ],
                ),
              ),
              SizedBox(
                height: size.height*0.02,
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width*0.024),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      //width: size.width*0.6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.person,size: size.height*0.028,color: Colors.green,),
                          Padding(
                            padding:  EdgeInsets.only(left: size.width*0.024),
                            child: AutoSizeText("Order is Picked UP,",
                              style:GoogleFonts.openSans(
                                  color: Colors.green,
                                  fontSize: size.height*0.02,
                                  fontWeight: FontWeight.w500
                              ),),
                          ),
                        ],
                      ),
                    ),
                    AutoSizeText("Date    ",
                      style:GoogleFonts.openSans(
                          color: Colors.green,
                          fontSize: size.height*0.02,
                          fontWeight: FontWeight.w500
                      ),)
                  ],
                ),
              ),
              SizedBox(
                height: size.height*0.02,
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width*0.024),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      //width: size.width*0.6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.person,size: size.height*0.028,color: Colors.green,),
                          Padding(
                            padding:  EdgeInsets.only(left: size.width*0.024),
                            child: AutoSizeText("Order Deliverd,",
                              style:GoogleFonts.openSans(
                                  color: Colors.green,
                                  fontSize: size.height*0.02,
                                  fontWeight: FontWeight.w500
                              ),),
                          ),
                        ],
                      ),
                    ),
                    AutoSizeText("Date    ",
                      style:GoogleFonts.openSans(
                          color: Colors.green,
                          fontSize: size.height*0.02,
                          fontWeight: FontWeight.w500
                      ),)
                  ],
                ),
              ),

              SizedBox(
                height: size.height*0.02,
              ),
              Divider(
                color: Colors.black26,
                thickness: size.height*0.0005,
                endIndent: size.width*0.035,
                indent: size.width*0.035,
              ),
              Padding(
                padding:  EdgeInsets.only(left: size.width*0.024),
                child: SizedBox(
                  width: size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: size.height*0.02,
                          ),
                          AutoSizeText("Payment Details",style: GoogleFonts.openSans(
                            fontWeight:FontWeight.w600,
                            fontSize: size.height*0.022,
                          )),
                          SizedBox(
                            height: size.height*0.021,
                          ),
                          SizedBox(
                            width: size.width*0.94,
                            child: Card(
                              elevation: 0,
                              shape:OutlineInputBorder(
                                  borderRadius:BorderRadius.all(Radius.circular(size.height*0.005)),
                                  borderSide: BorderSide(
                                      color: Colors.black26,
                                      width: size.height*0.0007
                                  )
                              ),
                              color: const Color.fromRGBO(235, 227, 240, 1),
                              child: Padding(
                                padding:  EdgeInsets.only(left: size.width*0.028,right: size.width*0.028),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: size.height*0.013,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        AutoSizeText("Total Order Value :",
                                          style:GoogleFonts.openSans(
                                              color: Colors.black87,
                                              fontSize: size.height*0.018,
                                              fontWeight: FontWeight.w500
                                          ),),
                                        AutoSizeText("\u{20B9}2000",
                                          style:GoogleFonts.openSans(
                                              color: Colors.black87,
                                              fontSize: size.height*0.018,
                                              fontWeight: FontWeight.w500
                                          ),),
                                      ],
                                    ),
                                    SizedBox(
                                      height: size.height*0.0065,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        AutoSizeText("Service Charge :",
                                          style:GoogleFonts.openSans(
                                              color: Colors.black87,
                                              fontSize: size.height*0.018,
                                              fontWeight: FontWeight.w500
                                          ),),
                                        AutoSizeText("\u{20B9}2000",
                                          style:GoogleFonts.openSans(
                                              color: Colors.black87,
                                              fontSize: size.height*0.018,
                                              fontWeight: FontWeight.w500
                                          ),),
                                      ],
                                    ),
                                    SizedBox(
                                      height: size.height*0.0065,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        AutoSizeText("Delivery Charge :",
                                          style:GoogleFonts.openSans(
                                              color: Colors.black87,
                                              fontSize: size.height*0.018,
                                              fontWeight: FontWeight.w500
                                          ),),
                                        AutoSizeText("\u{20B9}2000",
                                          style:GoogleFonts.openSans(
                                              color: Colors.black87,
                                              fontSize: size.height*0.018,
                                              fontWeight: FontWeight.w500
                                          ),),
                                      ],
                                    ),
                                    SizedBox(
                                      height: size.height*0.0065,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        AutoSizeText("GST :",
                                          style:GoogleFonts.openSans(
                                              color: Colors.black87,
                                              fontSize: size.height*0.018,
                                              fontWeight: FontWeight.w500
                                          ),),
                                        AutoSizeText("\u{20B9}2000",
                                          style:GoogleFonts.openSans(
                                              color: Colors.black87,
                                              fontSize: size.height*0.018,
                                              fontWeight: FontWeight.w500
                                          ),),
                                      ],
                                    ),
                                    SizedBox(
                                      height: size.height*0.0065,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        AutoSizeText("Total Payable Amount:",
                                          style:GoogleFonts.openSans(
                                              color: Colors.black87,
                                              fontSize: size.height*0.018,
                                              fontWeight: FontWeight.w500
                                          ),),
                                        AutoSizeText("\u{20B9}8000",
                                          style:GoogleFonts.openSans(
                                              color: Colors.black87,
                                              fontSize: size.height*0.018,
                                              fontWeight: FontWeight.w600
                                          ),),

                                      ],
                                    ),
                                    SizedBox(
                                      height: size.height*0.004,
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height*0.04,
                          ),
                          // SizedBox(
                          //   width: size.width,
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //     children: [
                          //       GestureDetector(
                          //         onTap: () {
                          //           // Navigator.push(context, PageTransition(
                          //           //     type: PageTransitionType.bottomToTop,
                          //           //     duration: const Duration(milliseconds: 0),
                          //           //     childCurrent: const DeliveredOrderDetails(),
                          //           //     child:  const Feedbacks()));
                          //         },
                          //         child: Container(
                          //           height: size.height*0.047,
                          //           width: size.width*0.4,
                          //           decoration: BoxDecoration(
                          //               color: const Color.fromRGBO(90, 86, 93, 1),
                          //               borderRadius: BorderRadius.all(Radius.circular(size.width*0.025))
                          //           ),
                          //           child:  Center(
                          //             child: AutoSizeText("Add Review",
                          //               style:GoogleFonts.openSans(
                          //                   color: Colors.white,
                          //                   fontSize: size.height*0.018,
                          //                   fontWeight: FontWeight.w600
                          //               ),),
                          //           ),
                          //         ),
                          //       ),
                          //       GestureDetector(
                          //         onTap: () {
                          //
                          //         },
                          //         child: Container(
                          //           height: size.height*0.047,
                          //           width: size.width*0.4,
                          //           decoration: BoxDecoration(
                          //               color: const Color.fromRGBO(86, 59, 105, 1),
                          //               borderRadius: BorderRadius.all(Radius.circular(size.width*0.025))
                          //           ),
                          //           child:  Center(
                          //             child: AutoSizeText("Return/Refund",
                          //               style:GoogleFonts.openSans(
                          //                   color: Colors.white,
                          //                   fontSize: size.height*0.018,
                          //                   fontWeight: FontWeight.w600
                          //               ),),
                          //           ),
                          //         ),
                          //       )
                          //     ],
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: size.height*0.04,
                          // ),
                        ],
                      )

                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
