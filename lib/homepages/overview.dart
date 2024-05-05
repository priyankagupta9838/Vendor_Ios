import 'dart:convert';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vendor/Constraints.dart';
import '../Api/checkoutapi.dart';
import '../Api/overviewapi.dart';
import '../StateManagement/PageBloc.dart';
import '../StateManagement/PageEvent.dart';
import '../StateManagement/PageState.dart';
import '../orders/myorders.dart';
import 'graphCard.dart';
import 'lineargraph.dart';

class Overview extends StatefulWidget {
  const Overview({super.key});

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  String dropdownvalue = 'Last 30 days';

  var items = [
    'Last 30 days',
    'Last 6 Months',
    'This year',
  ];


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
          left: size.height * 0.01,
          right: size.height * 0.01,
          top: size.height * 0.04),
      child: SizedBox(
        width: size.width * 1,
        height: size.height * 1,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StreamBuilder(
                stream:OverViewApi().overviewData(),
                builder: (context, snapshot) {
                  if( snapshot.hasData ){
                    var overViewData=jsonDecode(snapshot.data!.body);
                    return snapshot.data?.statusCode==200
                        ?
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Card(
                              elevation: 0,
                              color: Colors.purple.shade100,
                              child: SizedBox(
                                height: size.height * 0.1,
                                width: size.width * 0.44,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    AutoSizeText(
                                      "Total Order",
                                      style: GoogleFonts.openSans(
                                          color: Colors.black87,
                                          fontSize: size.height * 0.018,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    AutoSizeText(
                                      overViewData["data"]["total_quotes"].toString(),
                                      style: GoogleFonts.openSans(
                                          color: Colors.black87,
                                          fontSize: size.height * 0.018,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              elevation: 0,
                              color: Colors.purple.shade100,
                              child: SizedBox(
                                height: size.height * 0.1,
                                width: size.width * 0.43,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    AutoSizeText(
                                      "Order in Queue",
                                      style: GoogleFonts.openSans(
                                          color: Colors.black87,
                                          fontSize: size.height * 0.018,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    AutoSizeText(
                                      overViewData["data"]["accepted_product_orders"].toString(),
                                      style: GoogleFonts.openSans(
                                          color: Colors.black87,
                                          fontSize: size.height * 0.018,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),

                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        const GraphCard(),

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
              ),
              Padding(
                padding:  EdgeInsets.only(left: size.height*0.005,top: size.height*0.02,bottom: size.height*0.015),
                child: AutoSizeText(
                  "Ongoing Orders",
                  style: GoogleFonts.openSans(
                      color: Colors.black87,
                      fontSize: size.height * 0.025,
                      fontWeight: FontWeight.w600),
                ),
              ),
              BlocBuilder<ProductOrderBlo,ProductOrderState>(builder: (context, state) {
                return StreamBuilder(
                  stream:CheckoutApi().getOngoingOrders(),
                  builder: (context, snapshot) {
                    if( snapshot.hasData ){
                      var data=jsonDecode(snapshot.data!.body);
                      return snapshot.data?.statusCode==200
                          ?
                      SizedBox(
                        width: size.width * 1,
                        height: (size.height * 0.28*(data["data"].length)~/2)+size.height * 0.28,
                        child: GridView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: data["data"].length,

                          padding: EdgeInsets.all(size.height*0.0002),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisExtent: size.height * 0.29,
                              crossAxisCount: 2,
                              crossAxisSpacing: size.width * 0.025,
                              mainAxisSpacing: size.width * 0.025),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                gotoProductPage=true;
                                Navigator.push(context, PageTransition(
                                    type: PageTransitionType.fade,
                                    duration: const Duration(milliseconds: 100),
                                    childCurrent: const Overview(),
                                    child: const MyOrders()));

                              },
                              child: Card(
                                color: Colors.white,
                                elevation: 2,

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(size.width * 0.045)),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: size.height * 0.21,
                                      decoration: BoxDecoration(
                                          color: Colors.black26,
                                          image:
                                          data["data"][index]["order_details"][0]["product"]["product_images"][0]["image"] !=null && data["data"][index]["order_details"][0]["product"]["product_images"][0]["image"] !=""
                                              ?
                                          DecorationImage(
                                              image: NetworkImage(data["data"][index]["order_details"][0]["product"]["product_images"][0]["image"]),fit: BoxFit.fill)
                                              :
                                          const DecorationImage(
                                              image:AssetImage(
                                                  "assets/images/productplace.png"),

                                              fit: BoxFit.fill
                                          )


                                          ,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(size.width * 0.045),
                                          )),
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: size.height * 0.06,
                                        width: size.width * 1,
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade100,
                                            borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                Radius.circular(size.width * 0.045),
                                                bottomRight: Radius.circular(
                                                    size.width * 0.045))),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: size.width*0.3,
                                              child: Center(
                                                child: AutoSizeText(

                                                  "Order Id",
                                                  maxLines: 1,
                                                  style: GoogleFonts.openSans(
                                                      color: Colors.black87,
                                                      fontSize: size.height * 0.018,
                                                      fontWeight: FontWeight.w600),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: size.width*0.3,
                                              child: Center(
                                                child: AutoSizeText(
                                                  "${data["data"][index]["order_id"]}",
                                                  maxLines: 1,
                                                  style: GoogleFonts.openSans(
                                                      color: Colors.black87,
                                                      fontSize: size.height * 0.018,
                                                      fontWeight: FontWeight.w600),
                                                ),
                                              ),
                                            ),
                                            // const Text("TimlineLeft"),

                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
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
                  },
                );
              },),



            ],
          ),
        ),
      ),
    );
  }
}
