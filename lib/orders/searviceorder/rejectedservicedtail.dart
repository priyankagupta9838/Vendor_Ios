import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Constraints.dart';

class RejectedServiceDetails extends StatefulWidget {
  RejectedServiceDetails({Key? key , required this.orderDetails,required this.orderId}) : super(key: key);
  Map<String,dynamic>orderDetails;
  String orderId;

  @override
  State<RejectedServiceDetails> createState() => _RejectedServiceDetailsState();
}

class _RejectedServiceDetailsState extends State<RejectedServiceDetails> {
  TextEditingController rejectedController=TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("hghfghfh   ${widget.orderDetails}");
  }
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(194, 172, 209, 1),
        title: AutoSizeText("Rejected Service Order Details",style: GoogleFonts.cabin(
            color: Colors.white,
            fontSize: size.height*0.023,
            fontWeight: FontWeight.w400
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
                padding:  EdgeInsets.only(left: size.width*0.024,right:size.width*0.024 ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AutoSizeText("Order Id - ${widget.orderId.toString()}",
                      style:GoogleFonts.openSans(
                          color: Colors.black87,
                          fontSize: size.height*0.015,
                          fontWeight: FontWeight.w500
                      ),),
                    AutoSizeText("Date-${widget.orderDetails["createdAt"].toString().split("T")[0]}",
                      style:GoogleFonts.openSans(
                          color: const Color.fromRGBO(35, 29, 39, 1),
                          fontSize: size.height*0.015,
                          fontWeight: FontWeight.w500
                      ),)
                  ],
                ),
              ),
              SizedBox(
                height: size.height*0.015,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: size.height*0.081,
                    width: size.width*0.19,

                    decoration: widget.orderDetails["order_details"][0]["quote"]["reference_images"][0]["image"]!=null
                        ?
                    BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(widget.orderDetails["order_details"][0]["quote"]["reference_images"][0]["image"]),
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
                            userModel["vendor_details"]["service_type"].toString().toUpperCase()=="RESTORATION"
                                ?
                            "${widget.orderDetails["order_details"][0]["quote"]["service_type"]["name"] }| ${widget.orderDetails["order_details"][0]["quote"]["services_by_vendor"]["material_type"] }"

                                :
                            "${widget.orderDetails["order_details"][0]["quote"]["service_type"]["name"] }| ${widget.orderDetails["order_details"][0]["quote"]["services_by_vendor"]["clothing_item_type"] }",

                            style: GoogleFonts.openSans(
                              //fontSize: size.height*0.016,
                                fontWeight: FontWeight.w400,
                                color: Colors.black87
                            ),
                            maxLines: 2),
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
                child: AutoSizeText("Customer Name",
                  style:GoogleFonts.cabin(
                      color: Colors.black87,
                      fontSize: size.height*0.021,
                      fontWeight: FontWeight.w600
                  ),),
              ),
              SizedBox(
                height: size.height*0.014,
              ),
              Padding(
                padding:  EdgeInsets.only(left: size.width*0.024),
                child: AutoSizeText(
                  widget.orderDetails["user"]["fullname"].toString(),
                  style:GoogleFonts.cabin(
                      color: Colors.black87,
                      fontSize: size.height*0.017,
                      fontWeight: FontWeight.w400
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
                  style:GoogleFonts.cabin(
                      color: Colors.black87,
                      fontSize: size.height*0.026,
                      fontWeight: FontWeight.w600
                  ),),
              ),
              SizedBox(
                height: size.height*0.02,
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width*0.024,right: size.width*0.024),
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
                                  fontSize: size.height*0.02,
                                  fontWeight: FontWeight.w500
                              ),),
                          ),
                        ],
                      ),
                    ),
                    AutoSizeText(widget.orderDetails["createdAt"].toString().split("T")[0],
                      style:GoogleFonts.cabin(
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
                padding: EdgeInsets.only(left: size.width*0.024,right: size.width*0.024),
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
                              style:GoogleFonts.cabin(
                                  color: Colors.red,
                                  fontSize: size.height*0.02,
                                  fontWeight: FontWeight.w500
                              ),),
                          ),
                        ],
                      ),
                    ),
                    AutoSizeText(widget.orderDetails["updatedAt"].toString().split("T")[0],
                      style:GoogleFonts.cabin(
                          color: Colors.red,
                          fontSize: size.height*0.02,
                          fontWeight: FontWeight.w500
                      ),)
                  ],
                ),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height*0.025,
                      ),
                      AutoSizeText("Payment Details",style: GoogleFonts.cabin(
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
                                      style:GoogleFonts.cabin(
                                          color: Colors.black87,
                                          fontSize: size.height*0.018,
                                          fontWeight: FontWeight.w500
                                      ),),
                                    AutoSizeText("\u{20B9} ${widget.orderDetails["total_product_amount"].toStringAsFixed(2).toString()}",
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
                                    AutoSizeText("\u{20B9}${widget.orderDetails["order_details"][0]["quote"]["addons"].length>0?widget.orderDetails["order_details"][0]["quote"]["addons"][0]["services_addon_by_vendor"]["price"].toStringAsFixed(2):0}",
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
                                      style:GoogleFonts.openSans(
                                          color: Colors.black87,
                                          fontSize: size.height*0.018,
                                          fontWeight: FontWeight.w500
                                      ),),
                                    AutoSizeText("\u{20B9}${widget.orderDetails["total_shipping"].toStringAsFixed(2).toString()}",
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
                                    AutoSizeText("GST :",
                                      style:GoogleFonts.openSans(
                                          color: Colors.black87,
                                          fontSize: size.height*0.018,
                                          fontWeight: FontWeight.w500
                                      ),),
                                    AutoSizeText("\u{20B9}${(widget.orderDetails["total_igst"]+widget.orderDetails["total_sgst"]+widget.orderDetails["total_cgst"]).toStringAsFixed(2).toString()}",
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
                                      style:GoogleFonts.openSans(
                                          color: Colors.black87,
                                          fontSize: size.height*0.018,
                                          fontWeight: FontWeight.w500
                                      ),),
                                    AutoSizeText("\u{20B9}${(widget.orderDetails["total_amount"]+(widget.orderDetails["order_details"][0]["quote"]["addons"].length>0?widget.orderDetails["order_details"][0]["quote"]["addons"][0]["services_addon_by_vendor"]["price"]:0)).toStringAsFixed(2).toString()}",
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


                                SizedBox(
                                  height: size.height*0.04,
                                ),


                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height*0.04,
                      ),


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


  // _selectTime(BuildContext context) async {
  //   final TimeOfDay? timeOfDay = await showTimePicker(
  //
  //     context: context,
  //     initialTime: selectedTime,
  //     initialEntryMode: TimePickerEntryMode.inputOnly,
  //   );
  //   if (timeOfDay != null && timeOfDay != selectedTime) {
  //     setState(() {
  //       selectedTime = timeOfDay;
  //       String timer =
  //           "${timeOfDay.hour} : ${timeOfDay.minute} ${timeOfDay.period.toString().split(".")[1]}";
  //       timeInputController = TextEditingController(text: timer);
  //     });
  //   }
  // }
}
