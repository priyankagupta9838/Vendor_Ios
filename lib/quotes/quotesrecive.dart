import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vendor/quotes/restoration/rejectetedquotes.dart';
import 'package:vendor/quotes/restoration/restorationacceptedquotes.dart';
import 'package:vendor/quotes/restoration/reviewQuotes.dart';
import 'package:vendor/quotes/upcycle/rejectedreviewquotes.dart';
import 'package:vendor/quotes/upcycle/reviewQuotes.dart';

import '../Api/quotesapi.dart';
import '../Constraints.dart';
import '../StateManagement/PageBloc.dart';
import '../StateManagement/PageState.dart';
import 'upcycle/accepedreviewquotes.dart';

class QuotesReceived extends StatefulWidget {
  const QuotesReceived({super.key});

  @override
  State<QuotesReceived> createState() => _QuotesReceivedState();
}

class _QuotesReceivedState extends State<QuotesReceived> {
  List<dynamic> waitingQuotes = [];
  List<dynamic> acceptedQuotes = [];
  List<dynamic> rejectedQuotes = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 1,
      width: size.width * 1,
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.06,
              ),
              Container(
                color: const Color.fromRGBO(247, 235, 249, 1),
                height: size.height * 0.07,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // IconButton(
                    //   onPressed: () {
                    //     Navigator.pop(context);
                    //   },
                    //   icon: const Icon(CupertinoIcons.arrow_left),
                    // ),
                    // SizedBox(
                    //   width: size.width * 0.18,
                    // ),
                    AutoSizeText(
                      "Quotes Received",
                      style: GoogleFonts.openSans(
                          color: Colors.black,
                          fontSize: size.height * 0.024,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
           BlocBuilder<QuotesBlo,QuotesState>(builder: (context, state) {
             return StreamBuilder(
            stream: QuotesApi().fetchQuotes(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var data = jsonDecode(snapshot.data!.body);
                acceptedQuotes.clear();
                rejectedQuotes.clear();
                waitingQuotes.clear();
                for (int i = 0; i < data["data"].length; i++) {
                  if (data["data"][i]["vendor_accepted"] == 1) {
                    acceptedQuotes.add(data["data"][i]);
                  } else {
                    if (data["data"][i]["vendor_accepted"] == 0) {
                      rejectedQuotes.add(data["data"][i]);
                    } else {
                      waitingQuotes.add(data["data"][i]);
                    }
                  }
                }


                return snapshot.data?.statusCode == 200
                    ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  data["data"].length>0
                    ?
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height:
                        size.height * 0.172 * waitingQuotes.length,
                        width: size.width * 1,
                        child: ListView.builder(
                          itemCount: waitingQuotes.length,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.all(size.height * 0.000),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  left: size.height * 0.02,
                                  right: size.height * 0.02,
                                  top: size.height * 0.02),
                              child: Container(
                                height: size.height * 0.15,
                                decoration: BoxDecoration(
                                  color: Colors.purple.shade50,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          size.height * 0.01)),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: size.height * 0.015,
                                          left: size.height * 0.015),
                                      child: Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: size.height * 0.07,
                                            width: size.width * 0.15,
                                            decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                BorderRadius.all(
                                                    Radius.circular(
                                                        size.height *
                                                            0.01)),
                                                image:
                                                waitingQuotes[index]["reference_images"][0]["image"]!= null
                                                    ?
                                                DecorationImage(
                                                    image:
                                                    NetworkImage(waitingQuotes[index]["reference_images"][0]["image"].toString()),
                                                    fit: BoxFit.cover)
                                                :
                                                const DecorationImage(
                                                    image:
                                                    AssetImage(
                                                        "assets/images/imagePlaceholder.jpg"),
                                                    fit: BoxFit.cover)),
                                          ),
                                          SizedBox(
                                            width: size.width * 0.04,
                                          ),
                                          Column(
                                            children: [
                                              SizedBox(
                                                width:
                                                size.width * 0.58,
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    AutoSizeText(
                                                        "${waitingQuotes[index]["service_type"]["name"]}:"
                                                "${ userModel["vendor_details"]["service_type"].toString().toUpperCase()=="RESTORATION" ?
                                                '${waitingQuotes[index]["services_by_vendor"]["material_type"]}':  '${waitingQuotes[index]["services_by_vendor"]["clothing_item_type"]}'}",
                                                        style: GoogleFonts
                                                            .openSans(
                                                            fontSize:
                                                            size.height *
                                                                0.017,
                                                            fontWeight:
                                                            FontWeight
                                                                .w600,
                                                            color: Colors
                                                                .black87),
                                                        maxLines: 3),
                                                    AutoSizeText(
                                                        "Price: ${waitingQuotes[index]["total_price"].toStringAsFixed(2).toString()}| Delivery-${waitingQuotes[index]["completion_days"]} days",
                                                        style: GoogleFonts
                                                            .openSans(
                                                            fontSize:
                                                            size.height *
                                                                0.016,
                                                            fontWeight:
                                                            FontWeight
                                                                .w400,
                                                            color: Colors
                                                                .black87),
                                                        maxLines: 3),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: size.height * 0.02,
                                              bottom:
                                              size.height * 0.01),
                                          child: SizedBox(
                                            height: size.height * 0.04,
                                            width: size.width * 0.345,
                                            child: ElevatedButton(
                                              onPressed: (){
                                                userModel["vendor_details"]["service_type"].toString().toUpperCase()=="RESTORATION"
                                                ?
                                                Navigator.push(
                                                    context,
                                                    PageTransition(
                                                        child:
                                                        RestorationReviewQuotes(
                                                          service:
                                                          '${waitingQuotes[index]["service_type"]["name"]}',
                                                          clothingItem:
                                                          '${waitingQuotes[index]["services_by_vendor"]["material_type"]}',
                                                          styleDescription:
                                                          '${waitingQuotes[index]["style_description"]}',
                                                          selectedAddOn:
                                                          '',
                                                          estimatedPrice:
                                                          waitingQuotes[index]["total_price"].toStringAsFixed(2).toString(),
                                                          day: "${waitingQuotes[index]["completion_days"]} ",
                                                          refImage_1:
                                                          '${waitingQuotes[index]["reference_images"][0]["image"]}',
                                                          refImage_2:
                                                          '${waitingQuotes[index]["reference_images"][1]["image"]}',
                                                          quote_id:
                                                          '${waitingQuotes[index]["id"]}',  userDetail: {
                                                          "userId":waitingQuotes[index]["user_id"],

                                                        },
                                                        ),
                                                        childCurrent:
                                                        const QuotesReceived(),
                                                        type:
                                                        PageTransitionType
                                                            .fade))
                                                   :
                                                Navigator.push(
                                                    context,
                                                    PageTransition(
                                                        child:
                                                        ReviewQuotes(
                                                          service:
                                                          '${waitingQuotes[index]["service_type"]["name"]}',
                                                          clothingItem:
                                                          '${waitingQuotes[index]["services_by_vendor"]["clothing_item_type"]}',
                                                          styleDescription:
                                                          '${waitingQuotes[index]["style_description"]}',
                                                          selectedAddOn:
                                                          waitingQuotes[index]["addons"].length>0?waitingQuotes[index]["addons"][0]["services_addon_by_vendor"]["addon_name"]:"Not Selected",
                                                          estimatedPrice:
                                                          waitingQuotes[index]["addons"].length>0?(waitingQuotes[index]["total_price"]+waitingQuotes[index]["addons"][0]["services_addon_by_vendor"]["price"]).toStringAsFixed(2):
                                                          waitingQuotes[index]["total_price"].toStringAsFixed(2).toString(),
                                                          day: "${waitingQuotes[index]["completion_days"]} ",
                                                          refImage_1:
                                                          '${waitingQuotes[index]["reference_images"][0]["image"]}',
                                                          refImage_2:
                                                          '${waitingQuotes[index]["reference_images"][1]["image"]}',
                                                          matImage_1: '${waitingQuotes[index]["material_images"][0]["image"]}',
                                                          matImage_2: '${waitingQuotes[index]["material_images"][1]["image"]}',
                                                          quote_id:
                                                          '${waitingQuotes[index]["id"]}',
                                                          userDetail: waitingQuotes[index]["user"], mesurmentDetail: waitingQuotes[index]["user_measurement"],
                                                        ),
                                                        childCurrent:
                                                        const QuotesReceived(),
                                                        type:
                                                        PageTransitionType
                                                            .fade));
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                  Colors.purple
                                                      .shade100,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius
                                                          .all(
                                                          Radius.circular(
                                                              size.height *
                                                                  0.0045)))),
                                              child: AutoSizeText(
                                                "Review Quotes",
                                                maxLines: 1,
                                                style: GoogleFonts
                                                    .openSans(
                                                    color: Colors
                                                        .black,
                                                    fontSize:
                                                    size.height *
                                                        0.015,
                                                    fontWeight:
                                                    FontWeight
                                                        .w500),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: size.height * 0.02,
                            right: size.height * 0.02,
                            top: size.height * 0.02),
                        child: AutoSizeText(
                          "Past Quotes Received (30 Days)",
                          style: GoogleFonts.openSans(
                              color: Colors.black,
                              fontSize: size.height * 0.02,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height:
                        size.height * 0.12 * rejectedQuotes.length,
                        width: size.width * 1,
                        child: ListView.builder(
                          itemCount: rejectedQuotes.length,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.all(size.height * 0.000),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                print("clicked");


                                userModel["vendor_details"]["service_type"].toString().toUpperCase()=="RESTORATION"
                                ?

                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) =>
                                        RestorationRejectedReviewQuotes(
                                          service:
                                          '${rejectedQuotes[index]["service_type"]["name"]}',
                                          clothingItem: '${rejectedQuotes[index]["services_by_vendor"]["material_type"]}',
                                          clothingType: '',
                                          styleDescription:
                                          '${rejectedQuotes[index]["style_description"]}',
                                          selectedAddOn: '',
                                          estimatedPrice:
                                          rejectedQuotes[index]["total_price"].toStringAsFixed(2).toString(),
                                          day:
                                          "${rejectedQuotes[index]["completion_days"]} ",
                                          refImage_1:
                                          '${rejectedQuotes[index]["reference_images"][0]["image"]}',
                                          refImage_2:
                                          '${rejectedQuotes[index]["reference_images"][1]["image"]}',
                                          quote_id:
                                          '${rejectedQuotes[index]["id"]}',
                                          rejectedReason: '${rejectedQuotes[index]["vendor_rejection_reason"]}',
                                        ),))
                                    :

                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) =>
                                        RejectedReviewQuotes(
                                          service:
                                          '${rejectedQuotes[index]["service_type"]["name"]}',
                                          clothingItem: '${rejectedQuotes[index]["services_by_vendor"]["clothing_item_type"]}',
                                          clothingType: '',
                                          styleDescription:
                                          '${rejectedQuotes[index]["style_description"]}',
                                          selectedAddOn:  rejectedQuotes[index]["addons"].length>0?rejectedQuotes[index]["addons"][0]["services_addon_by_vendor"]["addon_name"]:"Not Selected",

                                          estimatedPrice:
                                          rejectedQuotes[index]["addons"].length>0?(rejectedQuotes[index]["total_price"]+rejectedQuotes[index]["addons"][0]["services_addon_by_vendor"]["price"]).toStringAsFixed(2):
                                          rejectedQuotes[index]["total_price"].toStringAsFixed(2).toString(),

                                          day:
                                          "${rejectedQuotes[index]["completion_days"]} ",
                                          refImage_1:
                                          '${rejectedQuotes[index]["reference_images"][0]["image"]}',
                                          refImage_2:
                                          '${rejectedQuotes[index]["reference_images"][1]["image"]}',
                                          matImage_1:
                                          '${rejectedQuotes[index]["material_images"][0]["image"]}',
                                          matImage_2:
                                          '${rejectedQuotes[index]["material_images"][1]["image"]}',
                                          quote_id:
                                          '${rejectedQuotes[index]["id"]}',
                                          rejectedReason: '${rejectedQuotes[index]["vendor_rejection_reason"]}',
                                            mesurmentDetail: rejectedQuotes[index]["user_measurement"],
                                        ),));
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: size.height * 0.02,
                                    right: size.height * 0.02,
                                    top: size.height * 0.02),
                                child: Container(
                                  height: size.height * 0.1,
                                  decoration: BoxDecoration(
                                    color: Colors.purple.shade50,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            size.height * 0.01)),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: size.height * 0.015,
                                        left: size.height * 0.015),
                                    child: Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: size.height * 0.07,
                                          width: size.width * 0.15,
                                          decoration: BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius:
                                              BorderRadius.all(
                                                  Radius.circular(
                                                      size.height *
                                                          0.01)),
                                              image:  rejectedQuotes[index]["reference_images"][0]["image"]!= null
                                                  ?
                                              DecorationImage(
                                                  image:
                                                  NetworkImage(rejectedQuotes[index]["reference_images"][0]["image"].toString()),
                                                  fit: BoxFit.cover)
                                                  :
                                              const DecorationImage(
                                                  image:
                                                  AssetImage(
                                                      "assets/images/imagePlaceholder.jpg"),
                                                  fit: BoxFit.cover)),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.04,
                                        ),
                                        Column(
                                          children: [
                                            SizedBox(
                                              width: size.width * 0.58,
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  AutoSizeText(
                                                      "You reject the Quote",
                                                      style: GoogleFonts.openSans(
                                                          fontSize:
                                                          size.height *
                                                              0.016,
                                                          fontWeight:
                                                          FontWeight
                                                              .w600,
                                                          color: Colors
                                                              .red),
                                                      maxLines: 1),
                                                  AutoSizeText(
                                                      "${rejectedQuotes[index]["service_type"]["name"]}:"
                                                          "${ userModel["vendor_details"]["service_type"].toString().toUpperCase()=="RESTORATION" ?
                                                      '${rejectedQuotes[index]["services_by_vendor"]["material_type"]}':  '${rejectedQuotes[index]["services_by_vendor"]["clothing_item_type"]}'}",
                                                      style: GoogleFonts.openSans(
                                                          fontSize:
                                                          size.height *
                                                              0.017,
                                                          fontWeight:
                                                          FontWeight
                                                              .w600,
                                                          color: Colors
                                                              .black87),
                                                      maxLines: 1),
                                                  AutoSizeText(
                                                      "Price: ${rejectedQuotes[index]["total_price"].toStringAsFixed(2).toString()}| Delivery-${rejectedQuotes[index]["completion_days"]} days",
                                                      style: GoogleFonts.openSans(
                                                          fontSize:
                                                          size.height *
                                                              0.016,
                                                          fontWeight:
                                                          FontWeight
                                                              .w400,
                                                          color: Colors
                                                              .black87),
                                                      maxLines: 1),
                                                ],
                                              ),
                                            ),
                                          ],
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
                        height:
                        size.height * 0.12 * acceptedQuotes.length,
                        width: size.width * 1,
                        child: ListView.builder(
                          itemCount: acceptedQuotes.length,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.all(size.height * 0.000),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {

                                userModel["vendor_details"]["service_type"].toString().toUpperCase()=="RESTORATION"
                                ?
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) =>
                                        RestorationAcceptedReviewQuotes(
                                          service:
                                          '${acceptedQuotes[index]["service_type"]["name"]}',
                                          clothingItem: '${acceptedQuotes[index]["services_by_vendor"]["material_type"]}',
                                          clothingType: '',
                                          styleDescription:
                                          '${acceptedQuotes[index]["style_description"]}',
                                          selectedAddOn: '',
                                          estimatedPrice:
                                          acceptedQuotes[index]["total_price"].toStringAsFixed(2).toString(),
                                          day:
                                          "${acceptedQuotes[index]["completion_days"]} ",
                                          refImage_1:
                                          '${acceptedQuotes[index]["reference_images"][0]["image"]}',
                                          refImage_2:
                                          '${acceptedQuotes[index]["reference_images"][1]["image"]}',
                                          quote_id:
                                          '${acceptedQuotes[index]["id"]}',

                                        ),))
                                    :


                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) =>
                                        AcceptedReviewQuotes(
                                          service:
                                          '${acceptedQuotes[index]["service_type"]["name"]}',
                                          clothingItem: '${acceptedQuotes[index]["services_by_vendor"]["clothing_item_type"]}',
                                          clothingType: '',
                                          styleDescription:
                                          '${acceptedQuotes[index]["style_description"]}',
                                          selectedAddOn:  acceptedQuotes[index]["addons"].length>0?acceptedQuotes[index]["addons"][0]["services_addon_by_vendor"]["addon_name"]:"Not Selected",

                                          estimatedPrice:
                                          acceptedQuotes[index]["addons"].length>0?(acceptedQuotes[index]["total_price"]+acceptedQuotes[index]["addons"][0]["services_addon_by_vendor"]["price"]).toStringAsFixed(2):
                                          acceptedQuotes[index]["total_price"].toStringAsFixed(2).toString(),
                                          day:
                                          "${acceptedQuotes[index]["completion_days"]} ",
                                          refImage_1:
                                          '${acceptedQuotes[index]["reference_images"][0]["image"]}',
                                          refImage_2:
                                          '${acceptedQuotes[index]["reference_images"][1]["image"]}',
                                          matImage_1:
                                          '${acceptedQuotes[index]["material_images"][0]["image"]}',
                                          matImage_2:
                                          '${acceptedQuotes[index]["material_images"][1]["image"]}',
                                          quote_id:
                                          '${acceptedQuotes[index]["id"]}',
                                            mesurmentDetail: acceptedQuotes[index]["user_measurement"],

                                        ),));
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: size.height * 0.02,
                                    right: size.height * 0.02,
                                    top: size.height * 0.02),
                                child: Container(
                                  height: size.height * 0.1,
                                  decoration: BoxDecoration(
                                    color: Colors.purple.shade50,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            size.height * 0.01)),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: size.height * 0.015,
                                        left: size.height * 0.015),
                                    child: Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: size.height * 0.07,
                                          width: size.width * 0.15,
                                          decoration: BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius:
                                              BorderRadius.all(
                                                  Radius.circular(
                                                      size.height *
                                                          0.01)),
                                              image:
                                              acceptedQuotes[index]["reference_images"][0]["image"]!= null
                                                  ?
                                              DecorationImage(
                                                  image:
                                                  NetworkImage(acceptedQuotes[index]["reference_images"][0]["image"].toString()),
                                                  fit: BoxFit.cover)
                                                  :
                                              const DecorationImage(
                                                  image:
                                                  AssetImage(
                                                      "assets/images/imagePlaceholder.jpg"),
                                                  fit: BoxFit.cover)


                                          ),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.04,
                                        ),
                                        Column(
                                          children: [
                                            SizedBox(
                                              width: size.width * 0.58,
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  AutoSizeText(
                                                      "You accepted the Quote",
                                                      style: GoogleFonts.openSans(
                                                          fontSize:
                                                          size.height *
                                                              0.016,
                                                          fontWeight:
                                                          FontWeight
                                                              .w600,
                                                          color: Colors
                                                              .green
                                                              .shade900),
                                                      maxLines: 1),
                                                  AutoSizeText(

                                                      "${acceptedQuotes[index]["service_type"]["name"]}:"
                                                          "${ userModel["vendor_details"]["service_type"].toString().toUpperCase()=="RESTORATION" ?
                                                      '${acceptedQuotes[index]["services_by_vendor"]["material_type"]}':  '${acceptedQuotes[index]["services_by_vendor"]["clothing_item_type"]}'}",

                                                      style: GoogleFonts.openSans(
                                                          fontSize:
                                                          size.height *
                                                              0.017,
                                                          fontWeight:
                                                          FontWeight
                                                              .w600,
                                                          color: Colors
                                                              .black87),
                                                      maxLines: 1),
                                                  AutoSizeText(
                                                      "Price: ${acceptedQuotes[index]["total_price"].toStringAsFixed(2).toString()}| Delivery-${acceptedQuotes[index]["completion_days"]} days",
                                                      style: GoogleFonts.openSans(
                                                          fontSize:
                                                          size.height *
                                                              0.016,
                                                          fontWeight:
                                                          FontWeight
                                                              .w400,
                                                          color: Colors
                                                              .black87),
                                                      maxLines: 1),
                                                ],
                                              ),
                                            ),
                                          ],
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
                        height: size.height * 0.1,
                      )
                    ],
                  )
                      :
                      SizedBox(
                        height: size.height*0.7,
                        child: Center(child: AutoSizeText("No Quotes Received",style: GoogleFonts.cabin(

                          fontSize: size.height*0.025,
                          fontWeight: FontWeight.w500,

                        ),)),
                      )
                  ],
                )
                    : Center(
                  child: SizedBox(
                    child: AutoSizeText(
                      "Server Error.",
                      style: GoogleFonts.openSans(
                          color: Colors.black,
                          fontSize: size.height * 0.018,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                );
              } else {
                return SizedBox(
                  height: size.height * 0.8,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  ),
                );
              }
            },
          );
             }
            )
            ],
          ),
        ),
      ),
    );
  }
}
