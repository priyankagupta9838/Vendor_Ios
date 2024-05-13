import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RejectedOrderDetails extends StatefulWidget {
   RejectedOrderDetails({Key? key,required this.rejectdetail,required this.userDetail,required this.orderId}) : super(key: key);
   Map<String, dynamic>rejectdetail;
   Map<String,dynamic>userDetail;
   String orderId;
  @override
  State<RejectedOrderDetails> createState() => _RejectedOrderDetailsState();
}

class _RejectedOrderDetailsState extends State<RejectedOrderDetails> {


  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(194, 172, 209, 1),
        title: const Text("Rejected Order Details",style: TextStyle(
            color: Colors.white
        ),),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            print(widget.rejectdetail);
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
                padding:  EdgeInsets.only(left: size.width*0.024,right: size.width*0.024 ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AutoSizeText("Order Id - ${widget.orderId.toString()}",
                      style:GoogleFonts.openSans(
                          color: Colors.black87,
                          fontSize: size.height*0.015,
                          fontWeight: FontWeight.w500
                      ),),
                    AutoSizeText("Date  ${widget.rejectdetail["updatedAt"].toString().split("T")[0]} ",
                      style:GoogleFonts.openSans(
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
                    decoration: widget.rejectdetail["product"]["product_images"].length>0
                        ?
                    BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(widget.rejectdetail["product"]["product_images"][0]["image"]),
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
                            "${widget.rejectdetail["product"]["product_name"]}:${widget.rejectdetail["product"]["display_name"]}",
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
                      fontSize: size.height*0.02,
                      fontWeight: FontWeight.w600
                  ),),
              ),
              SizedBox(
                height: size.height*0.012,
              ),
              Padding(
                padding:  EdgeInsets.only(left: size.width*0.024),
                child: AutoSizeText(widget.userDetail["fullname"].toString(),
                  style:GoogleFonts.openSans(
                      color: Colors.black87,
                      fontSize: size.height*0.017,
                      fontWeight: FontWeight.w500
                  ),),

              ),
              Divider(
                color: Colors.black26,
                thickness: size.height*0.0007,
                endIndent: size.width*0.035,
                indent: size.width*0.035,
              ),
              Padding(
                padding:  EdgeInsets.only(left: size.width*0.024),
                child: AutoSizeText("Driver Info",
                  style:GoogleFonts.openSans(
                      color: Colors.black87,
                      fontSize: size.height*0.02,
                      fontWeight: FontWeight.w600
                  ),),
              ),
              SizedBox(
                height: size.height*0.012,
              ),
              Padding(
                padding:  EdgeInsets.only(left: size.width*0.024),
                child: AutoSizeText("Driver Name",
                  style:GoogleFonts.openSans(
                      color: Colors.black87,
                      fontSize: size.height*0.016,
                      fontWeight: FontWeight.w500
                  ),),

              ),
              Padding(
                padding:  EdgeInsets.only(left: size.width*0.024),
                child: AutoSizeText("Driver contact number",
                  style:GoogleFonts.openSans(
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
              SizedBox(
                height: size.height*0.0085,
              ),
              Padding(
                padding:  EdgeInsets.only(left: size.width*0.024),
                child: AutoSizeText("Order Status",
                  style:GoogleFonts.openSans(
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
                              style:GoogleFonts.openSans(
                                  color: Colors.green,
                                  fontSize: size.height*0.02,
                                  fontWeight: FontWeight.w500
                              ),),
                          ),
                        ],
                      ),
                    ),
                    AutoSizeText("${widget.rejectdetail["createdAt"].toString().split("T")[0]} ",
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
                          Icon(Icons.person,size: size.height*0.028,color: Colors.red,),
                          Padding(
                            padding:  EdgeInsets.only(left: size.width*0.024),
                            child: AutoSizeText("Order Rejected,",
                              style:GoogleFonts.openSans(
                                  color: Colors.red,
                                  fontSize: size.height*0.02,
                                  fontWeight: FontWeight.w500
                              ),),
                          ),
                        ],
                      ),
                    ),
                    AutoSizeText("Date ${widget.rejectdetail["updatedAt"].toString().split("T")[0]}  ",
                      style:GoogleFonts.openSans(
                          color: Colors.red,
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
                      AutoSizeText("Reason For Rejected :",
                        style:GoogleFonts.openSans(
                            color: Colors.red,
                            fontSize: size.height*0.02,
                            fontWeight: FontWeight.w600
                        ),),
                      SizedBox(
                        height: size.height*0.01,
                      ),
                      SizedBox(
                        width: size.width*0.96,
                        child:  AutoSizeText("${widget.rejectdetail["rejection_reason"]}",
                          style:GoogleFonts.openSans(
                              color: const Color.fromRGBO(35, 29, 39, 1),
                              fontSize: size.height*0.016,
                              fontWeight: FontWeight.w400
                          ),),
                      ),


                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: size.height*0.025,
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
                                        AutoSizeText("\u{20B9}${widget.rejectdetail["total_price"].toStringAsFixed(2).toString()}",
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
                                        AutoSizeText("\u{20B9}0",
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
                                        AutoSizeText("\u{20B9}0",
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
                                        AutoSizeText("\u{20B9}${(widget.rejectdetail["total_igst"]+widget.rejectdetail["total_sgst"]+widget.rejectdetail["total_cgst"]).toStringAsFixed(2).toString()}",

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
                                        AutoSizeText("\u{20B9}${(widget.rejectdetail["total_price"]+widget.rejectdetail["total_igst"]+widget.rejectdetail["total_sgst"]+widget.rejectdetail["total_cgst"]).toStringAsFixed(2).toString()}",
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
                            height: size.height*0.032,
                          ),
                          SizedBox(
                            height: size.height*0.04,
                          ),
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
