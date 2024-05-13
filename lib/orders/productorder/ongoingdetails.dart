import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Api/orderapi.dart';
import '../../Constraints.dart';
import '../../NotificationSetup/helper_Notification.dart';
import '../../StateManagement/PageBloc.dart';
import '../../StateManagement/PageEvent.dart';
import '../../StateManagement/PageState.dart';
import '../../utilityfunctions.dart';

class OnGoingOrderDetails extends StatefulWidget {
  OnGoingOrderDetails({Key? key , required this.orderDetails,required this.userDetail,required this.userAddress,required this.orderId}) : super(key: key);
  Map<String,dynamic>orderDetails;
  Map<String,dynamic>userDetail;
  Map<String,dynamic>userAddress;
  String orderId;

  @override
  State<OnGoingOrderDetails> createState() => _OnGoingOrderDetailsState();
}

class _OnGoingOrderDetailsState extends State<OnGoingOrderDetails> {
  TextEditingController rejectedController=TextEditingController();
  bool reject=false;
  bool accepted=false;
  bool buttonClicked=false;
  bool edit=false;

 @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(194, 172, 209, 1),
        title: AutoSizeText("New Order Details",style: GoogleFonts.roboto(
            color: Colors.white,
            fontSize: size.height*0.025,
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
                padding:  EdgeInsets.only(left: size.width*0.024,right: size.width*0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AutoSizeText("Order Id - ${widget.orderId.toString()}",
                      style:GoogleFonts.openSans(
                          color: Colors.black87,
                          fontSize: size.height*0.015,
                          fontWeight: FontWeight.w500
                      ),),
                    AutoSizeText("Date  ${widget.orderDetails["createdAt"].toString().split("T")[0]}",
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
                    decoration: widget.orderDetails["product"]["product_images"].length>0
                        ?
                    BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(widget.orderDetails["product"]["product_images"][0]["image"]),
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
                            "${widget.orderDetails["product"]["product_name"].toString()}|${widget.orderDetails["product"]["clothing_type"].toString()}",
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
                      fontSize: size.height*0.021,
                      fontWeight: FontWeight.w600
                  ),),
              ),
              SizedBox(
                height: size.height*0.014,
              ),
              Padding(
                padding:  EdgeInsets.only(left: size.width*0.024),
                child: AutoSizeText(widget.userDetail["fullname"].toString(),
                  style:GoogleFonts.openSans(
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
                  style:GoogleFonts.openSans(
                      color: Colors.black87,
                      fontSize: size.height*0.02,
                      fontWeight: FontWeight.w700
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AutoSizeText(widget.orderDetails["createdAt"].toString().split("T")[0],
                          style:GoogleFonts.openSans(
                              color: Colors.green,
                              fontSize: size.height*0.02,
                              fontWeight: FontWeight.w500
                          ),),
                        SizedBox(
                          width: size.width*0.04,
                        )
                      ],
                    ),

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
             reject?
               Padding(
                 padding:  EdgeInsets.all(size.height*0.01),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     AutoSizeText("Reason for Reject/cancel",
                       style: GoogleFonts.openSans(
                         fontSize: size.height * 0.02,
                         fontWeight: FontWeight.w600,
                         color: Colors.red.shade800
                       ),),

                     SizedBox(
                       height: size.height*0.1,
                       width: size.width*1,
                       child: TextField(
                         controller: rejectedController,
                         maxLines: 4,
                         decoration: InputDecoration(
                           hintText: "Reason",
                           disabledBorder:OutlineInputBorder(
                               borderRadius: BorderRadius.all(
                                 Radius.circular(size.height * 0.01),
                               ),
                               borderSide: const BorderSide(width: 0, color: Colors.white)
                           ) ,
                           enabledBorder: OutlineInputBorder(
                               borderRadius: BorderRadius.all(
                                 Radius.circular(size.height * 0.01),
                               ),
                               borderSide: const BorderSide(width: 0, color: Colors.white)
                           ),
                           focusedBorder: OutlineInputBorder(
                               borderRadius: BorderRadius.all(
                                 Radius.circular(size.height * 0.01),
                               ),
                               borderSide: const BorderSide(width: 0, color: Colors.white)
                           ),
                           border: OutlineInputBorder(
                               borderRadius: BorderRadius.all(
                                 Radius.circular(size.height * 0.01),
                               ),
                              borderSide: const BorderSide(width: 0, color: Colors.white)
                             ),
                         ),
                       ),
                     ),
                   ],
                 ),
               )
             :
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [

                 Padding(
                   padding:  EdgeInsets.only(left: size.width*0.024,right: size.width*0.024),
                   child: SizedBox(
                     width: size.width*0.9,
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         AutoSizeText("Delivery Address",
                           style:GoogleFonts.openSans(
                               color: Colors.black87,
                               fontSize: size.height*0.022,
                               fontWeight: FontWeight.w500
                           ),),
                         AutoSizeText(widget.userAddress["address"].toString(),
                           style:GoogleFonts.openSans(
                               color: Colors.black,
                               fontSize: size.height*0.012,
                               fontWeight: FontWeight.w500
                           ),),
                         AutoSizeText(widget.userAddress["landmark"].toString(),
                           style:GoogleFonts.openSans(
                               color: Colors.black,
                               fontSize: size.height*0.012,
                               fontWeight: FontWeight.w500
                           ),),
                         Row(
                           children: [


                             AutoSizeText(widget.userAddress["city"].toString(),
                               style:GoogleFonts.openSans(
                                   color: Colors.black,
                                   fontSize: size.height*0.012,
                                   fontWeight: FontWeight.w500
                               ),),
                             AutoSizeText(" - ",
                               style:GoogleFonts.openSans(
                                   color: Colors.black,
                                   fontSize: size.height*0.012,
                                   fontWeight: FontWeight.w500
                               ),),
                             AutoSizeText(widget.userAddress["pincode"].toString(),
                               style:GoogleFonts.openSans(
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
                 SizedBox(
                   height: size.height*0.02,
                 ),
                 Divider(
                   color: Colors.black26,
                   thickness: size.height*0.0005,
                   endIndent: size.width*0.035,
                   indent: size.width*0.035,
                 ),

               ],
             ),
              Padding(
                padding:  EdgeInsets.only(left: size.width*0.024),
                child: Column(
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
                                  AutoSizeText("\u{20B9} ${widget.orderDetails["total_price"].toStringAsFixed(2).toString()}",
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
                                  AutoSizeText("\u{20B9}${(widget.orderDetails["total_igst"]+widget.orderDetails["total_sgst"]+widget.orderDetails["total_cgst"]).toStringAsFixed(2).toString()}",
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
                                  AutoSizeText("Total Paid Amount:",
                                    style:GoogleFonts.openSans(
                                        color: Colors.black87,
                                        fontSize: size.height*0.018,
                                        fontWeight: FontWeight.w500
                                    ),),
                                  AutoSizeText("\u{20B9}${(widget.orderDetails["total_price"]+widget.orderDetails["total_igst"]+widget.orderDetails["total_sgst"]+widget.orderDetails["total_cgst"]).toStringAsFixed(2).toString()}",
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
                    reject
                        ?
                    BlocBuilder<ProductOrderBlo,ProductOrderState>(builder: (context, state) {
                      return  Padding(
                        padding:  EdgeInsets.only(right: size.width*0.024),
                        child: GestureDetector(
                          onTap: () async {
                            if(rejectedController.text.toString().trim().isNotEmpty){
                              buttonClicked=true;
                              setState(() {

                              });
                              await OrdersApi().rejectOrder(widget.orderDetails["order_id"],rejectedController.text).then((value) async {

                                if(value=="success"){
                                  BlocProvider.of<ProductOrderBlo>(context).add(UpdateProductOrderEvent());
                                  await NotificationServices().sendNotification(widget.userDetail["id"].toString(),"Order","Your Order is rejected by ${userModel["vendor_details"]["shop_name"].toString()}");
                                  buttonClicked=false;
                                  edit=true;
                                  setState(() {

                                  });
                                  Navigator.pop(context);


                                }
                                else{
                                  buttonClicked=false;
                                  setState(() {

                                  });
                                }
                              });

                            }
                            else{
                              UtilityFunctions().errorToast("Please write the rejected reason");
                            }
                          },
                          child: Container(
                            width: size.width *1,
                            height: size.height * 0.06,
                            decoration: BoxDecoration(
                              color: Colors.red.shade800,
                              borderRadius: BorderRadius.circular(
                                size.height * 0.01,
                              ),
                            ),
                            child:
                            buttonClicked
                                ?
                            Center(
                              child: SizedBox(
                                height: size.height*0.03,
                                width: size.height*0.03,
                                child: const CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ),
                            )
                                :
                            Center(
                              child: AutoSizeText(edit?
                              "Rejected":"Reject",
                                style: GoogleFonts.openSans(
                                    fontSize: size.height * 0.02,
                                    color: Colors.white
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },)

                        :
                    accepted
                        ?
                    BlocBuilder<ProductOrderBlo,ProductOrderState>(builder: (context, state) {
                      return Padding(
                        padding:  EdgeInsets.only(right: size.width*0.024),
                        child: GestureDetector(
                          onTap: () async {

                            buttonClicked=true;
                            setState(() {

                            });
                            await OrdersApi().acceptOrder(widget.orderDetails["order_id"]).then((value) async {
                              if(value=="success"){
                                BlocProvider.of<ProductOrderBlo>(context).add(UpdateProductOrderEvent());
                                await NotificationServices().sendNotification(widget.userDetail["id"].toString(),"Order","Your Order is Accepted by ${userModel["vendor_details"]["shop_name"].toString()}");
                                await  UtilityFunctions().createChannel(widget.userAddress["user_id"].toString(),widget.userDetail["fullname"].toString(),"","").whenComplete(() {

                                  print("channel created...................................");
                                  buttonClicked=false;
                                  edit=true;
                                  setState(() {

                                  });
                                  Navigator.pop(context);

                                });



                              }
                              else{
                                buttonClicked=false;
                                setState(() {

                                });
                              }
                            });



                          },
                          child: Container(
                            width: size.width *1,
                            height: size.height * 0.06,
                            decoration: BoxDecoration(
                              color: Colors.green.shade800,
                              borderRadius: BorderRadius.circular(
                                size.height * 0.01,
                              ),
                            ),
                            child:
                            buttonClicked
                                ?
                            Center(
                              child: SizedBox(
                                height: size.height*0.03,
                                width: size.height*0.03,
                                child: const CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ),
                            )
                                :
                            Center(
                              child: AutoSizeText(edit?
                              "Accepted":"Accept",
                                style: GoogleFonts.openSans(
                                    fontSize: size.height * 0.02,
                                    color: Colors.white
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },)
                        :
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: (){


                            setState(() {

                              reject=true;
                            });
                          },
                          child: Container(
                              width: size.width * 0.44,
                              height: size.height * 0.06,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade800,
                                borderRadius: BorderRadius.circular(
                                  size.height * 0.01,
                                ),
                              ),
                              child:
                              Center(
                                child:  AutoSizeText(
                                  "Cancel",
                                  style: GoogleFonts.openSans(
                                      fontSize: size.height * 0.02,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              )
                          ),
                        ),
                        SizedBox(
                          width: size.width*0.028,
                        ),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              accepted=true;
                            });

                          },
                          child: Container(
                              width: size.width * 0.44,
                              height: size.height * 0.06,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(174, 144, 194, 1),
                                borderRadius: BorderRadius.circular(
                                  size.height * 0.01,
                                ),
                              ),
                              child:
                              Center(
                                child: AutoSizeText(
                                  "Accept",
                                  style: GoogleFonts.openSans(
                                      fontSize: size.height * 0.02,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              )
                          ),
                        ),
                        SizedBox(
                          width: size.width*0.025,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    SizedBox(
                      height: size.height*0.04,
                    ),

                  ],
                ),
              )

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
