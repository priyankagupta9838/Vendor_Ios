import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vendor/orders/productorder/rejectedorder.dart';

import 'acceptedorders.dart';
import 'deliverorder.dart';
import 'ongoingorderpage.dart';


class ProductOrder extends StatefulWidget {
  const ProductOrder({super.key});

  @override
  State<ProductOrder> createState() => _ProductOrderState();
}

class _ProductOrderState extends State<ProductOrder> {


  var currIndex=0;
  PageController pageController=PageController();
  List<String>statusOptions=[
    "New",
    "Accepted",
    "Rejected",
    "Delivered"
  ];
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return    SizedBox(
      height: size.height,
      width: size.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: size.height*0.01,
            ),
            SizedBox(
              height: size.height*0.047,
              width: size.width,
              child: ListView.builder(
                itemCount: 4,
                padding: EdgeInsets.only(right:size.width*0.01,left:size.width*0.0035),
                scrollDirection: Axis.horizontal,
                itemBuilder:(context, index) {
                  return Padding(
                    padding:  EdgeInsets.only(left: size.width*0.0223),
                    child: GestureDetector(
                      onTap: () {
                        currIndex=index;
                        pageController.animateToPage(index,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.linear);
                        setState(() {

                        });
                      },
                      child: Container(
                        height: size.height*0.047,
                        width: statusOptions[index].length<4
                        ?size.width*0.22
                        :
                        size.width*0.3,
                        decoration: BoxDecoration(
                          color: currIndex==index
                              ?
                          const Color.fromRGBO(236, 230, 240, 1)
                              :
                          const Color.fromRGBO(254, 247, 255,1),
                          borderRadius:BorderRadius.all( Radius.circular(size.width*0.02)),
                          border: Border.all(
                              color: Colors.black,
                              width: 1
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment:
                          currIndex==index
                              ?
                          MainAxisAlignment.spaceEvenly
                              :
                          MainAxisAlignment.center,
                          children: [
                            currIndex==index
                                ?
                            Icon(Icons.check,color: Colors.black,size: size.height*0.025,)
                                :
                            const SizedBox(),

                            AutoSizeText(statusOptions[index],
                              style: GoogleFonts.roboto(
                                  color: const Color.fromRGBO(29, 25, 43, 1),
                                  fontSize: size.height*0.02,
                                  fontWeight: FontWeight.w500
                              ),)
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),

            ),
            SizedBox(
              height: size.height*0.015,
            ),
            SizedBox(
              height: size.height*0.77,
              width: size.width*1,
              child: PageView(
                  controller:pageController,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (value) {
                    currIndex=value;
                    setState(() {

                    });
                  },
                  allowImplicitScrolling: true,
                  children:   [
                    const OngoingOrders(),
                    AcceptedOrders(),
                    RejectedOrders(),
                    DeliveredOrderPage()

                  ]
              ),
            )
          ],
        ),
      ),
    );







    //   SizedBox(
    //   height: size.height,
    //   width: size.width,
    //   child:StreamBuilder(
    //     stream:OrdersApi().allOrders(),
    //     builder: (context, snapshot) {
    //       if( snapshot.hasData ){
    //         var data=jsonDecode(snapshot.data!.body);
    //
    //         return snapshot.data?.statusCode==200
    //             ?
    //         SingleChildScrollView(
    //           scrollDirection: Axis.vertical,
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: [
    //               Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //
    //                   Padding(
    //                     padding: EdgeInsets.only(top: size.width * 0.04,
    //                         bottom: size.height * 0.01),
    //                     child: AutoSizeText("New Orders", style: GoogleFonts
    //                         .openSans(
    //                       fontWeight: FontWeight.w700,
    //                       fontSize: size.height * 0.018,)),
    //                   ),
    //                   SizedBox(
    //                     width: size.width * 0.94,
    //                     child: Card(
    //                       elevation: 0,
    //                       shape: OutlineInputBorder(
    //                           borderRadius: BorderRadius.all(
    //                               Radius.circular(size.height * 0.005)),
    //                           borderSide: BorderSide(
    //                               color: const Color.fromRGBO(
    //                                   247, 235, 249, 1),
    //                               width: size.height * 0.0007
    //                           )
    //                       ),
    //                       color: const Color.fromRGBO(251, 240, 252, 1),
    //                       child: Padding(
    //                         padding: EdgeInsets.only(left: size.width * 0.03,
    //                             top: size.height * 0.01),
    //                         child: Column(
    //                           crossAxisAlignment: CrossAxisAlignment.start,
    //                           children: [
    //                             AutoSizeText(
    //                               "Order Id - [ Order_Id ] (2 items )",
    //                               style: GoogleFonts.openSans(
    //                                   fontSize: size.height * 0.022,
    //                                   fontWeight: FontWeight.w500,
    //                                   color: const Color.fromRGBO(0, 0, 0, 1)
    //                               ),),
    //                             SizedBox(
    //                               height: size.height * 0.01,
    //                             ),
    //                             AutoSizeText(
    //                               "Order Id - [ Order_Id ] (2 items )",
    //                               style: GoogleFonts.openSans(
    //                                   fontSize: size.height * 0.018,
    //                                   fontWeight: FontWeight.w500,
    //                                   color: Colors.green
    //                               ),),
    //                             SizedBox(
    //                               height: size.height * 0.008,
    //                             ),
    //                             Divider(
    //                               height: size.height * 0.01,
    //                               color: Colors.black26,
    //                               thickness: size.height * 0.001,
    //                               endIndent: size.width * 0.035,
    //                             ),
    //                             SizedBox(
    //                               height: size.height * 0.1 * 2,
    //                               width: size.width * 0.94,
    //                               child: ListView.builder(
    //                                 itemCount:2,
    //                                 physics: const NeverScrollableScrollPhysics(),
    //                                 padding: EdgeInsets.all(
    //                                     size.height * 0.000),
    //                                 itemBuilder: (context, index) {
    //                                   return Padding(
    //                                     padding: const EdgeInsets.all(8.0),
    //                                     child: InkWell(
    //                                       onTap: () {
    //
    //                                       },
    //                                       child: Row(
    //                                         mainAxisAlignment: MainAxisAlignment
    //                                             .spaceEvenly,
    //                                         children: [
    //                                           Container(
    //                                             height: size.height * 0.085,
    //                                             width: size.width * 0.21,
    //                                             decoration: BoxDecoration(
    //                                                 color: Colors.grey,
    //                                                 borderRadius: BorderRadius
    //                                                     .all(
    //                                                     Radius.circular(size
    //                                                         .height * 0.01)),
    //                                                 image: const DecorationImage(
    //                                                     image: AssetImage(
    //                                                         "assets/images/imagePlaceholder.jpg"),
    //
    //                                                     fit: BoxFit.cover
    //                                                 )
    //                                             ),
    //                                           ),
    //                                           Column(
    //                                             children: [
    //                                               SizedBox(
    //                                                 width: size.width * 0.58,
    //                                                 child: AutoSizeText(
    //                                                     "[Service_Type]:[Clothes_Name]+[Clothes_Type]",
    //                                                     style: GoogleFonts
    //                                                         .openSans(
    //                                                       //fontSize: size.height*0.016,
    //                                                         fontWeight: FontWeight
    //                                                             .w400,
    //                                                         color: Colors
    //                                                             .black87
    //                                                     ),
    //                                                     maxLines: 3),
    //                                               ),
    //
    //
    //                                             ],
    //                                           )
    //                                         ],
    //                                       ),
    //                                     ),
    //                                   );
    //                                 },),
    //                             ),
    //                             SizedBox(
    //                               height: size.height * 0.012,
    //                             ),
    //                             Divider(
    //                               height: size.height * 0.01,
    //                               color: Colors.black26,
    //                               thickness: size.height * 0.0012,
    //                               endIndent: size.width * 0.035,
    //                             ),
    //                             SizedBox(
    //                               child: Padding(
    //                                 padding: EdgeInsets.all(
    //                                     size.height * 0.02),
    //                                 child: AutoSizeText(
    //                                     "Price - 20000  | Delivery- 10 Days",
    //                                     style: GoogleFonts.openSans(
    //                                         fontSize: size.height * 0.019,
    //                                         fontWeight: FontWeight.w500,
    //                                         color: Colors.black87
    //                                     ),
    //                                     maxLines: 3),
    //                               ),
    //                             )
    //
    //                           ],
    //                         ),
    //                       ),
    //                     ),
    //                   )
    //                 ],
    //               ),
    //               SizedBox(
    //                 height: size.height*0.02,
    //               ),
    //               Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //
    //                   Padding(
    //                     padding: EdgeInsets.only(top: size.width * 0.04,
    //                         bottom: size.height * 0.01),
    //                     child:  AutoSizeText("Accepted Orders",style: GoogleFonts.openSans(
    //                       fontWeight:FontWeight.w700,
    //                       fontSize: size.height*0.018,)),
    //                   ),
    //                   SizedBox(
    //                     width: size.width * 0.94,
    //                     child: Card(
    //                       elevation: 0,
    //                       shape: OutlineInputBorder(
    //                           borderRadius: BorderRadius.all(
    //                               Radius.circular(size.height * 0.005)),
    //                           borderSide: BorderSide(
    //                               color: const Color.fromRGBO(
    //                                   247, 235, 249, 1),
    //                               width: size.height * 0.0007
    //                           )
    //                       ),
    //                       color: const Color.fromRGBO(251, 240, 252, 1),
    //                       child: Padding(
    //                         padding: EdgeInsets.only(left: size.width * 0.03,
    //                             top: size.height * 0.01),
    //                         child: Column(
    //                           crossAxisAlignment: CrossAxisAlignment.start,
    //                           children: [
    //                             AutoSizeText(
    //                               "Order Id - [ Order_Id ] (2 items )",
    //                               style: GoogleFonts.openSans(
    //                                   fontSize: size.height * 0.022,
    //                                   fontWeight: FontWeight.w500,
    //                                   color: const Color.fromRGBO(0, 0, 0, 1)
    //                               ),),
    //                             SizedBox(
    //                               height: size.height * 0.01,
    //                             ),
    //                             AutoSizeText(
    //                               "Order Id - [ Order_Id ] (2 items )",
    //                               style: GoogleFonts.openSans(
    //                                   fontSize: size.height * 0.018,
    //                                   fontWeight: FontWeight.w500,
    //                                   color: Colors.green
    //                               ),),
    //                             SizedBox(
    //                               height: size.height * 0.008,
    //                             ),
    //                             Divider(
    //                               height: size.height * 0.01,
    //                               color: Colors.black26,
    //                               thickness: size.height * 0.001,
    //                               endIndent: size.width * 0.035,
    //                             ),
    //                             SizedBox(
    //                               height: size.height * 0.1 *  2,
    //                               width: size.width * 0.94,
    //                               child: ListView.builder(
    //                                 itemCount: 2,
    //                                 physics: const NeverScrollableScrollPhysics(),
    //                                 padding: EdgeInsets.all(
    //                                     size.height * 0.000),
    //                                 itemBuilder: (context, index) {
    //                                   return Padding(
    //                                     padding: const EdgeInsets.all(8.0),
    //                                     child: InkWell(
    //                                       onTap: () {
    //
    //                                       },
    //                                       child: Row(
    //                                         mainAxisAlignment: MainAxisAlignment
    //                                             .spaceEvenly,
    //                                         children: [
    //                                           Container(
    //                                             height: size.height * 0.085,
    //                                             width: size.width * 0.21,
    //                                             decoration: BoxDecoration(
    //                                                 color: Colors.grey,
    //                                                 borderRadius: BorderRadius
    //                                                     .all(
    //                                                     Radius.circular(size
    //                                                         .height * 0.01)),
    //                                                 image: const DecorationImage(
    //                                                     image: AssetImage(
    //                                                         "assets/images/imagePlaceholder.jpg"),
    //
    //                                                     fit: BoxFit.cover
    //                                                 )
    //                                             ),
    //                                           ),
    //                                           Column(
    //                                             children: [
    //                                               SizedBox(
    //                                                 width: size.width * 0.58,
    //                                                 child: AutoSizeText(
    //                                                     "[Service_Type]:[Clothes_Name]+[Clothes_Type]",
    //                                                     style: GoogleFonts
    //                                                         .openSans(
    //                                                       //fontSize: size.height*0.016,
    //                                                         fontWeight: FontWeight
    //                                                             .w400,
    //                                                         color: Colors
    //                                                             .black87
    //                                                     ),
    //                                                     maxLines: 3),
    //                                               ),
    //
    //
    //                                             ],
    //                                           )
    //                                         ],
    //                                       ),
    //                                     ),
    //                                   );
    //                                 },),
    //                             ),
    //                             SizedBox(
    //                               height: size.height * 0.012,
    //                             ),
    //                             Divider(
    //                               height: size.height * 0.01,
    //                               color: Colors.black26,
    //                               thickness: size.height * 0.0012,
    //                               endIndent: size.width * 0.035,
    //                             ),
    //                             SizedBox(
    //                               child: Padding(
    //                                 padding: EdgeInsets.all(
    //                                     size.height * 0.02),
    //                                 child: AutoSizeText(
    //                                     "Price - 20000  | Delivery- 10 Days",
    //                                     style: GoogleFonts.openSans(
    //                                         fontSize: size.height * 0.019,
    //                                         fontWeight: FontWeight.w500,
    //                                         color: Colors.black87
    //                                     ),
    //                                     maxLines: 3),
    //                               ),
    //                             )
    //
    //                           ],
    //                         ),
    //                       ),
    //                     ),
    //                   )
    //                 ],
    //               ),
    //               SizedBox(
    //                 height: size.height*0.02,
    //               ),
    //               Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //
    //                   Padding(
    //                     padding: EdgeInsets.only(top: size.width * 0.04,
    //                         bottom: size.height * 0.01),
    //                     child:   AutoSizeText("Rejected Orders",style: GoogleFonts.openSans(
    //                       fontWeight:FontWeight.w700,
    //                       fontSize: size.height*0.018,)),
    //                   ),
    //                   SizedBox(
    //                     width: size.width * 0.94,
    //                     child: Card(
    //                       elevation: 0,
    //                       shape: OutlineInputBorder(
    //                           borderRadius: BorderRadius.all(
    //                               Radius.circular(size.height * 0.005)),
    //                           borderSide: BorderSide(
    //                               color: const Color.fromRGBO(
    //                                   247, 235, 249, 1),
    //                               width: size.height * 0.0007
    //                           )
    //                       ),
    //                       color: const Color.fromRGBO(251, 240, 252, 1),
    //                       child: Padding(
    //                         padding: EdgeInsets.only(left: size.width * 0.03,
    //                             top: size.height * 0.01),
    //                         child: Column(
    //                           crossAxisAlignment: CrossAxisAlignment.start,
    //                           children: [
    //                             AutoSizeText(
    //                               "Order Id - [ Order_Id ] (2 items )",
    //                               style: GoogleFonts.openSans(
    //                                   fontSize: size.height * 0.022,
    //                                   fontWeight: FontWeight.w500,
    //                                   color: const Color.fromRGBO(0, 0, 0, 1)
    //                               ),),
    //                             SizedBox(
    //                               height: size.height * 0.01,
    //                             ),
    //                             AutoSizeText(
    //                               "Order Id - [ Order_Id ] (2 items )",
    //                               style: GoogleFonts.openSans(
    //                                   fontSize: size.height * 0.018,
    //                                   fontWeight: FontWeight.w500,
    //                                   color: Colors.green
    //                               ),),
    //                             SizedBox(
    //                               height: size.height * 0.008,
    //                             ),
    //                             Divider(
    //                               height: size.height * 0.01,
    //                               color: Colors.black26,
    //                               thickness: size.height * 0.001,
    //                               endIndent: size.width * 0.035,
    //                             ),
    //                             SizedBox(
    //                               height: size.height * 0.1 *  2,
    //                               width: size.width * 0.94,
    //                               child: ListView.builder(
    //                                 itemCount: 2,
    //                                 physics: const NeverScrollableScrollPhysics(),
    //                                 padding: EdgeInsets.all(
    //                                     size.height * 0.000),
    //                                 itemBuilder: (context, index) {
    //                                   return Padding(
    //                                     padding: const EdgeInsets.all(8.0),
    //                                     child: InkWell(
    //                                       onTap: () {
    //
    //                                       },
    //                                       child: Row(
    //                                         mainAxisAlignment: MainAxisAlignment
    //                                             .spaceEvenly,
    //                                         children: [
    //                                           Container(
    //                                             height: size.height * 0.085,
    //                                             width: size.width * 0.21,
    //                                             decoration: BoxDecoration(
    //                                                 color: Colors.grey,
    //                                                 borderRadius: BorderRadius
    //                                                     .all(
    //                                                     Radius.circular(size
    //                                                         .height * 0.01)),
    //                                                 image: const DecorationImage(
    //                                                     image: AssetImage(
    //                                                         "assets/images/imagePlaceholder.jpg"),
    //
    //                                                     fit: BoxFit.cover
    //                                                 )
    //                                             ),
    //                                           ),
    //                                           Column(
    //                                             children: [
    //                                               SizedBox(
    //                                                 width: size.width * 0.58,
    //                                                 child: AutoSizeText(
    //                                                     "[Service_Type]:[Clothes_Name]+[Clothes_Type]",
    //                                                     style: GoogleFonts
    //                                                         .openSans(
    //                                                       //fontSize: size.height*0.016,
    //                                                         fontWeight: FontWeight
    //                                                             .w400,
    //                                                         color: Colors
    //                                                             .black87
    //                                                     ),
    //                                                     maxLines: 3),
    //                                               ),
    //
    //
    //                                             ],
    //                                           )
    //                                         ],
    //                                       ),
    //                                     ),
    //                                   );
    //                                 },),
    //                             ),
    //                             SizedBox(
    //                               height: size.height * 0.012,
    //                             ),
    //                             Divider(
    //                               height: size.height * 0.01,
    //                               color: Colors.black26,
    //                               thickness: size.height * 0.0012,
    //                               endIndent: size.width * 0.035,
    //                             ),
    //                             SizedBox(
    //                               child: Padding(
    //                                 padding: EdgeInsets.all(
    //                                     size.height * 0.02),
    //                                 child: AutoSizeText(
    //                                     "Price - 20000  | Delivery- 10 Days",
    //                                     style: GoogleFonts.openSans(
    //                                         fontSize: size.height * 0.019,
    //                                         fontWeight: FontWeight.w500,
    //                                         color: Colors.black87
    //                                     ),
    //                                     maxLines: 3),
    //                               ),
    //                             )
    //
    //                           ],
    //                         ),
    //                       ),
    //                     ),
    //                   )
    //                 ],
    //               ),
    //               SizedBox(
    //                 height: size.height*0.02,
    //               ),
    //               SizedBox(
    //                 height: size.height*0.45,
    //                 width: size.width*0.92,
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     SizedBox(
    //                       height: size.height*0.025,
    //                     ),
    //                     AutoSizeText("Issues Orders",style: GoogleFonts.openSans(
    //                       fontWeight:FontWeight.w600,
    //                       fontSize: size.height*0.02,)),
    //                     SizedBox(
    //                       width: size.width*0.94,
    //                       child: Card(
    //                         elevation: 0,
    //                         shape:OutlineInputBorder(
    //                             borderRadius:BorderRadius.all(Radius.circular(size.height*0.005)),
    //                             borderSide: BorderSide(
    //                                 color: const Color.fromRGBO(247, 235, 249, 1),
    //                                 width: size.height*0.0007
    //                             )
    //                         ),
    //                         color: const Color.fromRGBO(251, 240, 252, 1),
    //                         child: Padding(
    //                           padding:  EdgeInsets.only(left: size.width*0.03,top: size.height*0.01),
    //                           child: Column(
    //                             crossAxisAlignment: CrossAxisAlignment.start,
    //                             children: [
    //                               AutoSizeText(
    //                                 "Order Id - [ Order_Id ] (2 items )",
    //                                 style: GoogleFonts.openSans(
    //                                     fontSize: size.height*0.022,
    //                                     fontWeight: FontWeight.w500,
    //                                     color: const Color.fromRGBO(0, 0, 0,1)
    //                                 ),),
    //                               SizedBox(
    //                                 height: size.height*0.01,
    //                               ),
    //                               AutoSizeText(
    //                                 "Order Id - [ Order_Id ] (2 items )",
    //                                 style: GoogleFonts.openSans(
    //                                     fontSize: size.height*0.018,
    //                                     fontWeight: FontWeight.w500,
    //                                     color: Colors.green
    //                                 ),),
    //                               SizedBox(
    //                                 height: size.height*0.008,
    //                               ),
    //                               Divider(
    //                                 height:size.height*0.01,
    //                                 color: Colors.black26,
    //                                 thickness: size.height*0.001,
    //                                 endIndent: size.width*0.035,
    //                               ),
    //                               SizedBox(
    //                                 height: size.height*0.1*2,
    //                                 width: size.width*0.94,
    //                                 child: ListView.builder(
    //                                   itemCount: 2,
    //                                   physics: const NeverScrollableScrollPhysics(),
    //                                   padding:  EdgeInsets.all(size.height*0.000),
    //                                   itemBuilder: (context, index) {
    //                                     return Padding(
    //                                       padding: const EdgeInsets.all(8.0),
    //                                       child: InkWell(
    //                                         onTap: () {
    //
    //                                         },
    //                                         child: Row(
    //                                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                                           children: [
    //                                             Container(
    //                                               height: size.height*0.085,
    //                                               width: size.width*0.21,
    //                                               decoration: BoxDecoration(
    //                                                   color: Colors.grey,
    //                                                   borderRadius: BorderRadius.all(Radius.circular(size.height*0.01)),
    //                                                   image: const DecorationImage(
    //                                                       image: AssetImage("assets/images/imagePlaceholder.jpg"),
    //
    //                                                       fit: BoxFit.cover
    //                                                   )
    //                                               ),
    //                                             ),
    //                                             Column(
    //                                               children: [
    //                                                 SizedBox(
    //                                                   width: size.width*0.58,
    //                                                   child: AutoSizeText(
    //                                                       "[Service_Type]:[Clothes_Name]+[Clothes_Type]",
    //                                                       style: GoogleFonts.openSans(
    //                                                         //fontSize: size.height*0.016,
    //                                                           fontWeight: FontWeight.w400,
    //                                                           color: Colors.black87
    //                                                       ),
    //                                                       maxLines: 3),
    //                                                 ),
    //
    //
    //                                               ],
    //                                             )
    //                                           ],
    //                                         ),
    //                                       ),
    //                                     );
    //                                   },),
    //                               ),
    //                               SizedBox(
    //                                 height: size.height*0.012,
    //                               ),
    //                               Divider(
    //                                 height:size.height*0.01,
    //                                 color: Colors.black26,
    //                                 thickness: size.height*0.0012,
    //                                 endIndent: size.width*0.035,
    //                               ),
    //                               SizedBox(
    //                                 child: Padding(
    //                                   padding:  EdgeInsets.all(size.height*0.02),
    //                                   child: AutoSizeText(
    //                                       "Price - 20000  | Delivery- 10 Days",
    //                                       style: GoogleFonts.openSans(
    //                                           fontSize: size.height*0.019,
    //                                           fontWeight: FontWeight.w500,
    //                                           color: Colors.black87
    //                                       ),
    //                                       maxLines: 3),
    //                                 ),
    //                               )
    //
    //                             ],
    //                           ),
    //                         ),
    //                       ),
    //                     )
    //                   ],
    //                 ),
    //               ),
    //               SizedBox(
    //                 height: size.height*0.02,
    //               ),
    //               Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //
    //                   Padding(
    //                     padding: EdgeInsets.only(top: size.width * 0.04,
    //                         bottom: size.height * 0.01),
    //                     child: AutoSizeText("Delivered Orders",style: GoogleFonts.openSans(
    //                       fontWeight:FontWeight.w600,
    //                       fontSize: size.height*0.02,)),
    //                   ),
    //                   SizedBox(
    //                     width: size.width * 0.94,
    //                     child: Card(
    //                       elevation: 0,
    //                       shape: OutlineInputBorder(
    //                           borderRadius: BorderRadius.all(
    //                               Radius.circular(size.height * 0.005)),
    //                           borderSide: BorderSide(
    //                               color: const Color.fromRGBO(
    //                                   247, 235, 249, 1),
    //                               width: size.height * 0.0007
    //                           )
    //                       ),
    //                       color: const Color.fromRGBO(251, 240, 252, 1),
    //                       child: Padding(
    //                         padding: EdgeInsets.only(left: size.width * 0.03,
    //                             top: size.height * 0.01),
    //                         child: Column(
    //                           crossAxisAlignment: CrossAxisAlignment.start,
    //                           children: [
    //                             AutoSizeText(
    //                               "Order Id - [ Order_Id ] (2 items )",
    //                               style: GoogleFonts.openSans(
    //                                   fontSize: size.height * 0.022,
    //                                   fontWeight: FontWeight.w500,
    //                                   color: const Color.fromRGBO(0, 0, 0, 1)
    //                               ),),
    //                             SizedBox(
    //                               height: size.height * 0.01,
    //                             ),
    //                             AutoSizeText(
    //                               "Order Id - [ Order_Id ] (2 items )",
    //                               style: GoogleFonts.openSans(
    //                                   fontSize: size.height * 0.018,
    //                                   fontWeight: FontWeight.w500,
    //                                   color: Colors.green
    //                               ),),
    //                             SizedBox(
    //                               height: size.height * 0.008,
    //                             ),
    //                             Divider(
    //                               height: size.height * 0.01,
    //                               color: Colors.black26,
    //                               thickness: size.height * 0.001,
    //                               endIndent: size.width * 0.035,
    //                             ),
    //                             SizedBox(
    //                               height: size.height * 0.1 * 2,
    //                               width: size.width * 0.94,
    //                               child: ListView.builder(
    //                                 itemCount: 2,
    //                                 physics: const NeverScrollableScrollPhysics(),
    //                                 padding: EdgeInsets.all(
    //                                     size.height * 0.000),
    //                                 itemBuilder: (context, index) {
    //                                   return Padding(
    //                                     padding: const EdgeInsets.all(8.0),
    //                                     child: InkWell(
    //                                       onTap: () {
    //
    //                                       },
    //                                       child: Row(
    //                                         mainAxisAlignment: MainAxisAlignment
    //                                             .spaceEvenly,
    //                                         children: [
    //                                           Container(
    //                                             height: size.height * 0.085,
    //                                             width: size.width * 0.21,
    //                                             decoration: BoxDecoration(
    //                                                 color: Colors.grey,
    //                                                 borderRadius: BorderRadius
    //                                                     .all(
    //                                                     Radius.circular(size
    //                                                         .height * 0.01)),
    //                                                 image: const DecorationImage(
    //                                                     image: AssetImage(
    //                                                         "assets/images/imagePlaceholder.jpg"),
    //
    //                                                     fit: BoxFit.cover
    //                                                 )
    //                                             ),
    //                                           ),
    //                                           Column(
    //                                             children: [
    //                                               SizedBox(
    //                                                 width: size.width * 0.58,
    //                                                 child: AutoSizeText(
    //                                                     "[Service_Type]:[Clothes_Name]+[Clothes_Type]",
    //                                                     style: GoogleFonts
    //                                                         .openSans(
    //                                                       //fontSize: size.height*0.016,
    //                                                         fontWeight: FontWeight
    //                                                             .w400,
    //                                                         color: Colors
    //                                                             .black87
    //                                                     ),
    //                                                     maxLines: 3),
    //                                               ),
    //
    //
    //                                             ],
    //                                           )
    //                                         ],
    //                                       ),
    //                                     ),
    //                                   );
    //                                 },),
    //                             ),
    //                             SizedBox(
    //                               height: size.height * 0.012,
    //                             ),
    //                             Divider(
    //                               height: size.height * 0.01,
    //                               color: Colors.black26,
    //                               thickness: size.height * 0.0012,
    //                               endIndent: size.width * 0.035,
    //                             ),
    //                             SizedBox(
    //                               child: Padding(
    //                                 padding: EdgeInsets.all(
    //                                     size.height * 0.02),
    //                                 child: AutoSizeText(
    //                                     "Price - 20000  | Delivery- 10 Days",
    //                                     style: GoogleFonts.openSans(
    //                                         fontSize: size.height * 0.019,
    //                                         fontWeight: FontWeight.w500,
    //                                         color: Colors.black87
    //                                     ),
    //                                     maxLines: 3),
    //                               ),
    //                             )
    //
    //                           ],
    //                         ),
    //                       ),
    //                     ),
    //                   )
    //                 ],
    //               )
    //             ],
    //           ),
    //         )
    //             :
    //         Center(
    //           child: SizedBox(
    //             child: AutoSizeText("Server Error.",
    //               style: GoogleFonts.openSans(
    //                   color: Colors.black,
    //                   fontSize: size.height*0.018,
    //                   fontWeight: FontWeight.w500
    //               ),),
    //           ),
    //         );
    //       }
    //       else{
    //         return  const Center(
    //           child: CircularProgressIndicator(
    //             color: Colors.blue,
    //           ),
    //         );
    //       }
    //     },),
    // );
  }
}
