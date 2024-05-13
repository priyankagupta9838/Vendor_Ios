
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../../Constraints.dart';
import '../../chat system/openChat.dart';
import '../../utilityfunctions.dart';


class AcceptedOrderDetails extends StatefulWidget {
   AcceptedOrderDetails({Key? key,required this.acceptedOrderDetails,required this.userDetail,required this.userAddress,required this.orderId}) : super(key: key);
   Map<String,dynamic>acceptedOrderDetails;
   Map<String,dynamic>userDetail;
   Map<String,dynamic>userAddress;
   String orderId;
  @override
  State<AcceptedOrderDetails> createState() => _AcceptedOrderDetailsState();
}

class _AcceptedOrderDetailsState extends State<AcceptedOrderDetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("accepted order detail is ${widget.acceptedOrderDetails}");
  }
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(194, 172, 209, 1),
        title: const Text("Accepted Order Details",style: TextStyle(
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
                padding:  EdgeInsets.only(left: size.width*0.024,right: size.width*0.024),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AutoSizeText("Order Id - ${widget.orderId.toString()}",
                      style:GoogleFonts.cabin(
                          color: Colors.black87,
                          fontSize: size.height*0.015,
                          fontWeight: FontWeight.w500
                      ),),
                    AutoSizeText("Date: ${widget.acceptedOrderDetails["updatedAt"].toString().split("T")[0]} ",
                      style:GoogleFonts.cabin(
                          color: const Color.fromRGBO(35, 29, 39, 1),
                          fontSize: size.height*0.015,
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

                    decoration: widget.acceptedOrderDetails["product"]["product_images"].length>0
                        ?
                    BoxDecoration(
                        color: Colors.grey,
                        image: DecorationImage(
                            image: NetworkImage(widget.acceptedOrderDetails["product"]["product_images"][0]["image"]),
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
                        width: size.width*0.58,
                        child: AutoSizeText(
                            "${widget.acceptedOrderDetails["product"]["product_name"].toString()} | ${widget.acceptedOrderDetails["product"]["clothing_type"].toString()}",

                            style: GoogleFonts.cabin(
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
                  style:GoogleFonts.cabin(
                      color: Colors.black87,
                      fontSize: size.height*0.0165,
                      fontWeight: FontWeight.w600
                  ),),
              ),
              SizedBox(
                height: size.height*0.012,
              ),
              Padding(
                padding:  EdgeInsets.only(left: size.width*0.024),
                child: AutoSizeText(widget.userDetail["fullname"].toString(),
                  style:GoogleFonts.cabin(
                      color: Colors.black87,
                      fontSize: size.height*0.016,
                      fontWeight: FontWeight.w500
                  ),),

              ),
              Divider(
                color: Colors.black26,
                thickness: size.height*0.0007,
                endIndent: size.width*0.035,
                indent: size.width*0.035,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: size.width*0.024,right: size.width*0.024),
                    child: AutoSizeText("Delivery Address",
                      style:GoogleFonts.cabin(
                          color: Colors.black87,
                          fontSize: size.height*0.017,
                          fontWeight: FontWeight.w600
                      ),),
                  ),
                  SizedBox(
                    height: size.height*0.005,
                  ),

                  Padding(
                    padding:  EdgeInsets.only(left: size.width*0.024,right: size.width*0.024),
                    child: SizedBox(
                      width: size.width*0.9,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(widget.userAddress["address"].toString(),
                            style:GoogleFonts.cabin(
                                color: Colors.black,
                                fontSize: size.height*0.012,
                                fontWeight: FontWeight.w500
                            ),),
                          AutoSizeText(widget.userAddress["landmark"].toString(),
                            style:GoogleFonts.cabin(
                                color: Colors.black,
                                fontSize: size.height*0.012,
                                fontWeight: FontWeight.w500
                            ),),
                          Row(
                            children: [


                              AutoSizeText(widget.userAddress["city"].toString(),
                                style:GoogleFonts.cabin(
                                    color: Colors.black,
                                    fontSize: size.height*0.012,
                                    fontWeight: FontWeight.w500
                                ),),
                              AutoSizeText(" - ",
                                style:GoogleFonts.cabin(
                                    color: Colors.black,
                                    fontSize: size.height*0.012,
                                    fontWeight: FontWeight.w500
                                ),),
                              AutoSizeText(widget.userAddress["pincode"].toString(),
                                style:GoogleFonts.cabin(
                                    color: Colors.black,
                                    fontSize: size.height*0.012,
                                    fontWeight: FontWeight.w500
                                ),),
                            ],
                          )
                        ],
                      ),
                    ),

                  ),
                ],
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
                  style:GoogleFonts.cabin(
                      color: Colors.black87,
                      fontSize: size.height*0.022,
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
                              style:GoogleFonts.cabin(
                                  color: Colors.green,
                                  fontSize: size.height*0.018,
                                  fontWeight: FontWeight.w500
                              ),),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        AutoSizeText(widget.acceptedOrderDetails["createdAt"].toString().split("T")[0],
                          style:GoogleFonts.cabin(
                              color: Colors.green,
                              fontSize: size.height*0.018,
                              fontWeight: FontWeight.w500
                          ),),
                        SizedBox(
                          width: size.width*0.04,
                        )
                      ],
                    )
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
                            child: AutoSizeText("Order Accepted",
                              style:GoogleFonts.cabin(
                                  color: Colors.green,
                                  fontSize: size.height*0.018,
                                  fontWeight: FontWeight.w500
                              ),),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        AutoSizeText(widget.acceptedOrderDetails["updatedAt"].toString().split("T")[0],
                          style:GoogleFonts.cabin(
                              color: Colors.green,
                              fontSize: size.height*0.018,
                              fontWeight: FontWeight.w500
                          ),),
                        SizedBox(
                          width: size.width*0.04,
                        )
                      ],
                    )
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
                padding:  EdgeInsets.only(left: size.width*0.024,right: size.width*0.024),
                child: SizedBox(
                  width: size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height*0.01,
                      ),
                      AutoSizeText("Payment Details",style: GoogleFonts.cabin(
                        fontWeight:FontWeight.w600,
                        fontSize: size.height*0.02,
                      )),
                      SizedBox(
                        height: size.height*0.02,
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
                                      style:GoogleFonts.cabin(
                                          color: Colors.black87,
                                          fontSize: size.height*0.018,
                                          fontWeight: FontWeight.w500
                                      ),),
                                    AutoSizeText("\u{20B9}${widget.acceptedOrderDetails["total_price"].toStringAsFixed(2).toString()}",
                                      style:GoogleFonts.cabin(
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
                                      style:GoogleFonts.cabin(
                                          color: Colors.black87,
                                          fontSize: size.height*0.018,
                                          fontWeight: FontWeight.w500
                                      ),),
                                    AutoSizeText("\u{20B9}0",
                                      style:GoogleFonts.cabin(
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
                                      style:GoogleFonts.cabin(
                                          color: Colors.black87,
                                          fontSize: size.height*0.018,
                                          fontWeight: FontWeight.w500
                                      ),),
                                    AutoSizeText("\u{20B9}0",
                                      style:GoogleFonts.cabin(
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
                                    AutoSizeText("GST :",style:GoogleFonts.cabin(
                                          color: Colors.black87,
                                          fontSize: size.height*0.018,
                                          fontWeight: FontWeight.w500
                                      ),),
                                    AutoSizeText("\u{20B9}${(widget.acceptedOrderDetails["total_igst"]+widget.acceptedOrderDetails["total_sgst"]+widget.acceptedOrderDetails["total_cgst"]).toStringAsFixed(2).toString()}",

                                      style:GoogleFonts.cabin(
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
                                    AutoSizeText("Total Paid Amount:",
                                      style:GoogleFonts.cabin(
                                          color: Colors.black87,
                                          fontSize: size.height*0.018,
                                          fontWeight: FontWeight.w500
                                      ),),
                                    AutoSizeText("\u{20B9}${(widget.acceptedOrderDetails["total_price"]+widget.acceptedOrderDetails["total_igst"]+widget.acceptedOrderDetails["total_sgst"]+widget.acceptedOrderDetails["total_cgst"]).toStringAsFixed(2).toString()}",
                                      style:GoogleFonts.cabin(
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
                        height: size.height*0.032,
                      ),
                      Padding(
                          padding:  EdgeInsets.only(left: size.width*0.02,),
                          child:  GestureDetector(
                            onTap: () async {
                              print("d...........${widget.userDetail}");
                              await  FirebaseFirestore.instance
                                  .collection("Users").doc(userModel["id"].toString()).get().then((value) {
                                if(value.data()!=null){
                                 print("....${value.data()}");
                                  for(var channels in value.data()?["Channels"]){
                                    if(channels["userId"].toString()=="${widget.userDetail["id"]}"){
                                      Navigator.push(context, PageTransition(
                                          type: PageTransitionType.fade,
                                          duration: const Duration(milliseconds: 50),
                                          childCurrent:AcceptedOrderDetails(acceptedOrderDetails: {}, userDetail: {}, userAddress: {}, orderId: '',),
                                          child:  OpenChat(channel: channels["channel name"].toString(), userName:channels["userName"].toString() , vendorId: channels["userId"].toString(), vendorShopName: channels["vendor shopName"].toString(), vendorShopImage: channels["vendor shopImage"].toString(),)));
                                    }
                                  }
                                }
                                else{
                                  UtilityFunctions().errorToast("This option is not enable from vendor side");
                                }
                              });
                            },
                            child: Container(
                              height: size.height*0.046,
                              width: size.width*0.9,
                              decoration: BoxDecoration(
                                  color: const Color.fromRGBO(174, 144, 194, 1),
                                  borderRadius: BorderRadius.all(Radius.circular(size.width*0.025))
                              ),
                              child:  Center(
                                child: AutoSizeText("Chat with User",
                                  style:GoogleFonts.openSans(
                                      color: Colors.white,
                                      fontSize: size.height*0.017,
                                      fontWeight: FontWeight.w600
                                  ),),
                              ),
                            ),
                          ) ),
                      SizedBox(
                        height: size.height*0.03,
                      ),

                    ],
                  ),
                ),
              ),


              SizedBox(
                height: size.height*0.02,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
