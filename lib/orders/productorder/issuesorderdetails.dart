import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IssuesOrderDetails extends StatefulWidget {
  const IssuesOrderDetails({Key? key}) : super(key: key);

  @override
  State<IssuesOrderDetails> createState() => _IssuesOrderDetailsState();
}

class _IssuesOrderDetailsState extends State<IssuesOrderDetails> {
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
                      fontSize: size.height*0.0165,
                      fontWeight: FontWeight.w700
                  ),),
              ),
              SizedBox(
                height: size.height*0.012,
              ),
              Padding(
                padding:  EdgeInsets.only(left: size.width*0.024),
                child: AutoSizeText("Customer Name",
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
              Padding(
                padding:  EdgeInsets.only(left: size.width*0.024,right:  size.width*0.024),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AutoSizeText("Accepted Date",
                      style:GoogleFonts.openSans(
                          color: Colors.black87,
                          fontSize: size.height*0.0165,
                          fontWeight: FontWeight.w700
                      ),),
                    AutoSizeText("Date",
                      style:GoogleFonts.openSans(
                          color: Colors.black87,
                          fontSize: size.height*0.014,
                          fontWeight: FontWeight.w700
                      ),),
                  ],
                ),
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
                    child: AutoSizeText("Shop Address",
                      style:GoogleFonts.openSans(
                          color: Colors.black87,
                          fontSize: size.height*0.0165,
                          fontWeight: FontWeight.w700
                      ),),
                  ),
                  SizedBox(
                    height: size.height*0.005,
                  ),

                  Padding(
                    padding:  EdgeInsets.only(left: size.width*0.024,right: size.width*0.024),
                    child: SizedBox(
                      width: size.width*0.9,
                      child: AutoSizeText("101 k-phase ,Ganga nagar meerut",
                        style:GoogleFonts.openSans(
                            color: Colors.black,
                            fontSize: size.height*0.012,
                            fontWeight: FontWeight.w500
                        ),),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: size.width*0.024),
                    child: AutoSizeText("PickUp Date and Time",
                      style:GoogleFonts.openSans(
                          color: Colors.black87,
                          fontSize: size.height*0.0165,
                          fontWeight: FontWeight.w700
                      ),),
                  ),
                  SizedBox(
                    height: size.height*0.005,
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: size.width*0.024,right: size.width*0.024),
                    child: SizedBox(
                      width: size.width*0.9,
                      child: AutoSizeText("101 k-phase ,Ganganagar meerut",
                        style:GoogleFonts.openSans(
                            color: Colors.black,
                            fontSize: size.height*0.012,
                            fontWeight: FontWeight.w500
                        ),),
                    ),

                  ),
                ],
              ),
              SizedBox(
                height: size.height*0.005,
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
                                  fontSize: size.height*0.018,
                                  fontWeight: FontWeight.w500
                              ),),
                          ),
                        ],
                      ),
                    ),
                    AutoSizeText("Date    ",
                      style:GoogleFonts.openSans(
                          color: Colors.green,
                          fontSize: size.height*0.018,
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
                            child: AutoSizeText("Order Accepted",
                              style:GoogleFonts.openSans(
                                  color: Colors.green,
                                  fontSize: size.height*0.018,
                                  fontWeight: FontWeight.w500
                              ),),
                          ),
                        ],
                      ),
                    ),
                    AutoSizeText("Date    ",
                      style:GoogleFonts.openSans(
                          color: Colors.green,
                          fontSize: size.height*0.018,
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
                            child: AutoSizeText("Order is PickedUp",
                              style:GoogleFonts.openSans(
                                  color: Colors.green,
                                  fontSize: size.height*0.018,
                                  fontWeight: FontWeight.w500
                              ),),
                          ),
                        ],
                      ),
                    ),
                    AutoSizeText("Date    ",
                      style:GoogleFonts.openSans(
                          color: Colors.green,
                          fontSize: size.height*0.018,
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
                            child: AutoSizeText("Order Delivered",
                              style:GoogleFonts.openSans(
                                  color: Colors.green,
                                  fontSize: size.height*0.018,
                                  fontWeight: FontWeight.w500
                              ),),
                          ),
                        ],
                      ),
                    ),
                    AutoSizeText("Date    ",
                      style:GoogleFonts.openSans(
                          color: Colors.green,
                          fontSize: size.height*0.018,
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
                padding:  EdgeInsets.only(left: size.width*0.024,right: size.width*0.024),
                child: SizedBox(
                  width: size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height*0.01,
                      ),
                      AutoSizeText("Payment Details",style: GoogleFonts.openSans(
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
                        height: size.height*0.032,
                      ),
                      Container(
                        width: size.width *1,
                        height: size.height * 0.06,
                        decoration: BoxDecoration(
                          color: Colors.green.shade800,
                          borderRadius: BorderRadius.circular(
                            size.height * 0.01,
                          ),
                        ),
                        child:
                        Center(
                          child: AutoSizeText(
                            "Accepted",
                            style: GoogleFonts.openSans(
                                fontSize: size.height * 0.02,
                                color: Colors.white
                            ),
                          ),
                        ),
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
