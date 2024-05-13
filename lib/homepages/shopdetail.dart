
import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import '../Account Related/termsAndCondition.dart';
import '../Api/shopDetailApi.dart';
import '../utilityfunctions.dart';

class ShopDetail extends StatefulWidget {
   ShopDetail({super.key,required this.shopDetails});
  var shopDetails;


  @override
  State<ShopDetail> createState() => _ShopDetailState();
}

const cardColor = Color.fromRGBO(235, 227, 240, 1);
const textColor = Color.fromRGBO(28, 28, 30, 1);
const buttonColor = Color.fromRGBO(174, 144, 194, 1);

class _ShopDetailState extends State<ShopDetail> {
  TextEditingController shopNameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController uniqueDescriptionController = TextEditingController();
  bool termsAndConditions = false;
  bool policyPrivacy = false;
  String shopCoverPhotoPath = "";
  String portfolioImage_1 = "";
  String portfolioImage_2 = "";
  String portfolioImage_3 = "";
  String portfolioImage_4 = "";
  String legalDocument_1 = "";
  String legalDocument_2 = "";
  List <String> portfolioShop=[];
  bool shopName=true;
  bool physicalLocation=true;
  bool uniqueness=true;
 bool shopCoverPhoto=true;
 bool legalDoc_1=true;
 bool legalDoc_2=true;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.shopDetails.isNotEmpty)
      {
        shopNameController.text=widget.shopDetails["shop_name"]!=""?widget.shopDetails["shop_name"]:" ";
        locationController.text=widget.shopDetails["shop_location"]!=""?widget.shopDetails["shop_location"]:"";
         uniqueDescriptionController.text=widget.shopDetails["shop_unique_desc"]!=""?widget.shopDetails["shop_unique_desc"]:"";
         policyPrivacy=true;
         termsAndConditions=true;
         shopCoverPhotoPath=widget.shopDetails["shop_image"]!=""?widget.shopDetails["shop_image"]:"";
        widget.shopDetails["portfolio_images"].length==4
        ?
        ( portfolioImage_1=widget.shopDetails["portfolio_images"][0]["image_url"]!=" "?widget.shopDetails["portfolio_images"][0]["image_url"]:" ",
         portfolioImage_2=widget.shopDetails["portfolio_images"][1]["image_url"] !=" "?widget.shopDetails["portfolio_images"][1]["image_url"]:" ",
         portfolioImage_3=widget.shopDetails["portfolio_images"][2]["image_url"]??"",
         portfolioImage_4=widget.shopDetails["portfolio_images"][3]["image_url"] ??" ")
        :
        widget.shopDetails["portfolio_images"].length==3
        ?
        ( portfolioImage_1=widget.shopDetails["portfolio_images"][0]["image_url"]!=" "?widget.shopDetails["portfolio_images"][0]["image_url"]:" ",
        portfolioImage_2=widget.shopDetails["portfolio_images"][1]["image_url"] !=" "?widget.shopDetails["portfolio_images"][1]["image_url"]:" ",
        portfolioImage_3=widget.shopDetails["portfolio_images"][2]["image_url"]??"",
       )
            :
        widget.shopDetails["portfolio_images"].length==2
        ?
        ( portfolioImage_1=widget.shopDetails["portfolio_images"][0]["image_url"]!=" "?widget.shopDetails["portfolio_images"][0]["image_url"]:" ",
        portfolioImage_2=widget.shopDetails["portfolio_images"][1]["image_url"] !=" "?widget.shopDetails["portfolio_images"][1]["image_url"]:" ",
        )
          :
        widget.shopDetails["portfolio_images"].length==1
        ?
        ( portfolioImage_1=widget.shopDetails["portfolio_images"][0]["image_url"]!=" "?widget.shopDetails["portfolio_images"][0]["image_url"]:" ",
        )
            :
        ( portfolioImage_1="",
        portfolioImage_2="",
        portfolioImage_3="",
        portfolioImage_4="")

        ;
        legalDocument_1=widget.shopDetails["aadhar_image"]??"";
        legalDocument_2=widget.shopDetails["pan_image"]??"";
        shopName=false;
        physicalLocation=false;
        uniqueness=false;


      }
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:
            widget.shopDetails.isNotEmpty
            ?
            Column(
              children: [
                SizedBox(
                  height: size.height * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.all(size.height * 0.01),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            "A few details about your shop",
                            style: GoogleFonts.openSans(
                                color: textColor,
                                fontWeight: FontWeight.w600,
                                fontSize: size.height * 0.02),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          SizedBox(
                            height: size.height * 0.06,
                            child: TextField(
                              controller: shopNameController,
                              decoration: InputDecoration(
                               // enabled: shopName,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    print(".....");
                                    shopName=true;
                                    setState(() {

                                    });
                                  },
                                  icon: Icon(Icons.edit,size:size.height*0.022),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.black38)),
                                border: const OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.black38)),
                                disabledBorder: const OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.black38)),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.black38)),
                                labelText: "shop's Name",
                                labelStyle: GoogleFonts.openSans(
                                    fontSize: size.height * 0.018,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          SizedBox(
                            height: size.height * 0.06,
                            child: TextField(
                              controller: locationController,
                              obscureText: false,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    physicalLocation=true;
                                    setState(() {

                                    });
                                  },
                                  icon: Icon(Icons.edit,size:size.height*0.022),
                                ),
                                contentPadding: EdgeInsets.only(bottom: size.height*0.02),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.black38),
                                ),
                                border: const OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.black38),
                                ),
                                disabledBorder: const OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.black38),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.black38),
                                ),
                                labelText: "shop's Physical Location",
                                prefixIcon:
                                const Icon(Icons.location_on_outlined),
                                prefixIconColor: Colors.grey,
                                labelStyle: GoogleFonts.openSans(
                                    fontSize: size.height * 0.018,
                                    fontWeight: FontWeight.w400),
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          shopCoverPhotoPath.isNotEmpty
                              ?

                          Container(
                            height: size.height * 0.15,
                            width: size.width*1,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(size.height * 0.005)),
                                border: Border.all(
                                    color: Colors.purple.shade200)),
                            child: Stack(
                              children: [
                                SizedBox(
                                    height: size.height *
                                        0.15,
                                    width:
                                    size.width *1,
                                    child:
                                    shopCoverPhotoPath.contains("http")
                              ?
                                    Image.network(shopCoverPhotoPath,fit: BoxFit.cover,)
                                        :
                                    Image.file(File(shopCoverPhotoPath), fit: BoxFit.cover,),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: GestureDetector(
                                      onTap: () {
                                         setState(() {
                                           shopCoverPhotoPath = '';
                                         });
                                      },
                                      child: const Icon(
                                        Icons
                                            .cancel_outlined,
                                        color: Colors
                                            .black,
                                      )),
                                )
                              ],
                            ),
                          )
                              :

                          GestureDetector(
                            onTap: () async {
                              await UtilityFunctions()
                                  .imagePicker()
                                  .then((value) {
                                if (value.isNotEmpty) {
                                  setState(() {
                                    shopCoverPhotoPath = value.toString();
                                  });
                                }
                              });
                            },
                            child: Container(
                              height: size.height * 0.15,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(size.height * 0.005)),
                                  border: Border.all(
                                      color: Colors.purple.shade200)),
                              child: Padding(
                                padding:
                                EdgeInsets.only(left: size.height * 0.02),
                                child: Row(

                                    children: [
                                      shopCoverPhotoPath.isNotEmpty
                                          ?
                                      Icon(
                                        Icons.check_circle_outline_outlined,
                                        color: Colors.green.shade800,
                                      )
                                          :
                                      const Icon(
                                        Icons.file_upload_outlined,
                                        color: Colors.black54,
                                      ),
                                      SizedBox(
                                        width: size.width*0.02,
                                       ),
                                      AutoSizeText(
                                        "Shop Cover Photo",
                                        style: GoogleFonts.openSans(
                                            color: Colors.black54,
                                            fontSize: size.height * 0.02,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        width: size.width*0.39,
                                      ),
                                       Icon(Icons.edit,size:size.height*0.023),


                                    ]),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Container(
                            height: size.height * 0.15,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(size.height * 0.005)),
                                border: Border.all(color: Colors.grey)),
                            child: Padding(
                              padding:
                              EdgeInsets.only(left: size.height * 0.01),
                              child:  TextField(
                                controller: uniqueDescriptionController,
                                decoration:  InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      print(".....");
                                      uniqueness=true;
                                      setState(() {

                                      });
                                    },
                                    icon: Icon(Icons.edit,size:size.height*0.022),
                                  ),
                                  border: InputBorder.none,
                                  hintText: "What makes her product unique?",
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          AutoSizeText(
                            "Add your portfolio Photos",
                            style: GoogleFonts.openSans(
                                color: Colors.black,
                                fontSize: size.height * 0.02,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: size.height * 0.025,
                          ),
                          SizedBox(
                            // height: size.height*0.18,

                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      bottom: size.height * 0.02),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                          height: size.height * 0.15,
                                          width: size.width * 0.44,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                      size.height * 0.005)),
                                              border: Border.all(
                                                  color: Colors.black54)),
                                          child: portfolioImage_1.isNotEmpty
                                              ? Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Stack(
                                                children: [
                                                  SizedBox(
                                                    height: size.height *
                                                        0.15,
                                                    width: size.width *
                                                        0.434,
                                                    child:
                                                    portfolioImage_1.contains("http")
                                                           ?
                                                        Image.network(portfolioImage_1,fit: BoxFit.cover,)
                                                        :
                                                    Image.file(File(portfolioImage_1), fit: BoxFit.cover,),

                                                  ),
                                                  Padding(
                                                    padding:
                                                    EdgeInsets.only(
                                                      left: size.width *
                                                          0.37,
                                                    ),
                                                    child: GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            portfolioImage_1 =
                                                            '';
                                                          });
                                                        },
                                                        child: const Icon(
                                                          Icons
                                                              .cancel_outlined,
                                                          color: Colors
                                                              .black,
                                                        )),
                                                  )
                                                ],
                                              )
                                            ],
                                          )
                                              : GestureDetector(
                                            onTap: () async {
                                              await UtilityFunctions()
                                                  .imagePicker()
                                                  .then((value) {
                                                if (value
                                                    .isNotEmpty) {
                                                  setState(() {
                                                    portfolioImage_1 =
                                                        value
                                                            .toString();
                                                  });
                                                }
                                              });
                                            },
                                                child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                  .spaceEvenly,
                                            children: [
                                                // IconButton(
                                                //   onPressed: () async {
                                                //     await UtilityFunctions()
                                                //         .imagePicker()
                                                //         .then((value) {
                                                //       if (value
                                                //           .isNotEmpty) {
                                                //         setState(() {
                                                //           portfolioImage_1 =
                                                //               value
                                                //                   .toString();
                                                //         });
                                                //       }
                                                //     });
                                                //   },
                                                //   icon: const Icon(
                                                //     Icons
                                                //         .file_upload_outlined,
                                                //     color: Colors.black54,
                                                //   ),
                                                // ),
                                                const Icon(
                                                  Icons
                                                      .file_upload_outlined,
                                                  color: Colors.black54,
                                                ),
                                                AutoSizeText(
                                                  "Upload",
                                                  style:
                                                  GoogleFonts.openSans(
                                                      color: Colors
                                                          .black54,
                                                      fontWeight:
                                                      FontWeight
                                                          .w500,
                                                      fontSize:
                                                      size.height *
                                                          0.02),
                                                ),
                                                SizedBox(
                                                  width: size.width * 0.02,
                                                )
                                            ],
                                          ),
                                              )),
                                      Container(
                                          height: size.height * 0.15,
                                          width: size.width * 0.45,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                      size.height * 0.005)),
                                              border: Border.all(
                                                  color: Colors.black54)),
                                          child: portfolioImage_2.isNotEmpty
                                              ? Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Stack(
                                                children: [
                                                  SizedBox(
                                                    height: size.height *
                                                        0.15,
                                                    width:
                                                    size.width * 0.44,
                                                    child:
                                                    portfolioImage_2.contains("http")
                                                          ?
                                                    Image.network(portfolioImage_2,fit: BoxFit.cover,)
                                                        :
                                                    Image.file(File(portfolioImage_2), fit: BoxFit.cover,),
                                                  ),
                                                  Padding(
                                                    padding:
                                                    EdgeInsets.only(
                                                      left: size.width *
                                                          0.37,
                                                    ),
                                                    child: GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            portfolioImage_2 =
                                                            '';
                                                          });
                                                        },
                                                        child: const Icon(
                                                          Icons
                                                              .cancel_outlined,
                                                          color: Colors
                                                              .black,
                                                        )),
                                                  )
                                                ],
                                              )
                                            ],
                                          )
                                              : GestureDetector(
                                            onTap: () async {
                                              await UtilityFunctions()
                                                  .imagePicker()
                                                  .then((value) {
                                                if (value
                                                    .isNotEmpty) {
                                                  setState(() {
                                                    portfolioImage_2 = value.toString();
                                                  });
                                                }
                                              });

                                            },
                                                child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                  .spaceEvenly,
                                            children: [
                                                IconButton(
                                                  onPressed: () async {

                                                  },
                                                  icon: const Icon(
                                                    Icons
                                                        .file_upload_outlined,
                                                    color: Colors.black54,
                                                  ),
                                                ),
                                                AutoSizeText(
                                                  "Upload",
                                                  style:
                                                  GoogleFonts.openSans(
                                                      color: Colors
                                                          .black54,
                                                      fontWeight:
                                                      FontWeight
                                                          .w500,
                                                      fontSize:
                                                      size.height *
                                                          0.02),
                                                ),
                                                SizedBox(
                                                  width: size.width * 0.02,
                                                )
                                            ],
                                          ),
                                              )),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      bottom: size.height * 0.02),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                          height: size.height * 0.15,
                                          width: size.width * 0.45,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                      size.height * 0.005)),
                                              border: Border.all(
                                                  color: Colors.black54)),
                                          child: portfolioImage_3.isNotEmpty
                                              ? Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Stack(
                                                children: [
                                                  SizedBox(
                                                    height: size.height *
                                                        0.15,
                                                    width: size.width *
                                                        0.443,
                                                    child:
                                                    portfolioImage_3.contains("http")
                                                      ?
                                                    Image.network(portfolioImage_3,fit: BoxFit.cover,)
                                                    :
                                                    Image.file(File(portfolioImage_3), fit: BoxFit.cover,),

                                                  ),
                                                  Padding(
                                                    padding:
                                                    EdgeInsets.only(
                                                      left: size.width *
                                                          0.37,
                                                    ),
                                                    child: GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            portfolioImage_3 =
                                                            '';
                                                          });
                                                        },
                                                        child: const Icon(
                                                          Icons
                                                              .cancel_outlined,
                                                          color: Colors
                                                              .black,
                                                        )),
                                                  )
                                                ],
                                              )
                                            ],
                                          )
                                              : GestureDetector(
                                            onTap: () async {
                                              await UtilityFunctions()
                                                  .imagePicker()
                                                  .then((value) {
                                                if (value
                                                    .isNotEmpty) {
                                                  setState(() {
                                                    portfolioImage_3 =
                                                        value
                                                            .toString();
                                                  });
                                                }
                                              });
                                            },
                                                child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                  .spaceEvenly,
                                            children: [
                                                IconButton(
                                                  onPressed: () async {

                                                  },
                                                  icon: const Icon(
                                                    Icons
                                                        .file_upload_outlined,
                                                    color: Colors.black54,
                                                  ),
                                                ),
                                                AutoSizeText(
                                                  "Upload",
                                                  style:
                                                  GoogleFonts.openSans(
                                                      color: Colors
                                                          .black54,
                                                      fontWeight:
                                                      FontWeight
                                                          .w500,
                                                      fontSize:
                                                      size.height *
                                                          0.02),
                                                ),
                                                SizedBox(
                                                  width: size.width * 0.02,
                                                )
                                            ],
                                          ),
                                              )),
                                      Container(
                                          height: size.height * 0.15,
                                          width: size.width * 0.45,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                      size.height * 0.005)),
                                              border: Border.all(
                                                  color: Colors.black54)),
                                          child: portfolioImage_4.isNotEmpty
                                              ? Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Stack(
                                                children: [
                                                  SizedBox(
                                                    height: size.height *
                                                        0.15,
                                                    width: size.width *
                                                        0.443,
                                                    child:
                                                    portfolioImage_4.contains("http")?
                                                    Image.network(portfolioImage_4,fit: BoxFit.cover,)
                                                        :
                                                    Image.file(File(portfolioImage_4), fit: BoxFit.cover,),
                                                  ),
                                                  Padding(
                                                    padding:
                                                    EdgeInsets.only(
                                                      left: size.width *
                                                          0.37,
                                                    ),
                                                    child: GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            portfolioImage_4 =
                                                            '';
                                                          });
                                                        },
                                                        child: const Icon(
                                                          Icons
                                                              .cancel_outlined,
                                                          color: Colors
                                                              .black,
                                                        )),
                                                  )
                                                ],
                                              ),
                                            ],
                                          )
                                              : GestureDetector(
                                            onTap: () async {
                                              await UtilityFunctions()
                                                  .imagePicker()
                                                  .then((value) {
                                                if (value
                                                    .isNotEmpty) {
                                                  setState(() {
                                                    portfolioImage_4 =
                                                        value
                                                            .toString();
                                                  });
                                                }
                                              });
                                            },
                                                child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                  .spaceEvenly,
                                            children: [
                                                IconButton(
                                                  onPressed: () async {

                                                  },
                                                  icon: const Icon(
                                                    Icons
                                                        .file_upload_outlined,
                                                    color: Colors.black54,
                                                  ),
                                                ),
                                                AutoSizeText(
                                                  "Upload",
                                                  style:
                                                  GoogleFonts.openSans(
                                                      color: Colors
                                                          .black54,
                                                      fontWeight:
                                                      FontWeight
                                                          .w500,
                                                      fontSize:
                                                      size.height *
                                                          0.02),
                                                ),
                                                SizedBox(
                                                  width: size.width * 0.02,
                                                )
                                            ],
                                          ),
                                              )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          AutoSizeText(
                            "Document Verification",
                            style: GoogleFonts.openSans(
                                color: Colors.black,
                                fontSize: size.height * 0.02,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: size.height * 0.015,
                          ),
                          Container(
                            height: size.height * 0.06,
                            width: size.width*1,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(size.height * 0.005)),
                                border:
                                Border.all(color: Colors.purple.shade200)),
                            child: Padding(
                              padding:
                              EdgeInsets.only(left: size.height * 0.012),
                              child: Row(
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    IconButton(
                                        onPressed: () async {
                                         if(legalDoc_1){
                                           await UtilityFunctions()
                                               .imagePicker()
                                               .then((value) {
                                             if (value.isNotEmpty) {
                                               setState(() {
                                                 legalDocument_1 = value.toString();
                                               });
                                             }
                                           });
                                         }
                                        },
                                        icon:
                                        legalDocument_1.isNotEmpty
                                            ?
                                        GestureDetector(
                                          onTap: () {
                                            legalDoc_1=true;
                                            legalDocument_1="";
                                            setState(() {

                                            });
                                          },
                                          child: Icon(Icons.edit,size:size.height*0.022),
                                        )
                                            :
                                        const Icon(
                                          Icons.file_upload_outlined,
                                          color: Colors.black54,
                                        )),
                                    SizedBox(
                                      height: size.height*0.06,
                                      width: size.width*0.8,
                                      child: Padding(
                                        padding: EdgeInsets.only(top: size.height*0.013),
                                        child: AutoSizeText(

                                          "Any other required legal documents",
                                          style: GoogleFonts.openSans(

                                              color:
                                              const Color.fromRGBO(73, 69, 79, 1),
                                              fontSize: size.height * 0.019,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),


                                  ]),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.025,
                          ),
                          Container(
                            height: size.height * 0.06,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(size.height * 0.005)),
                                border:
                                Border.all(color: Colors.purple.shade200)),
                            child: Padding(
                              padding:
                              EdgeInsets.only(left: size.height * 0.01),
                              child: Row(children: [
                                IconButton(
                                    onPressed: () async {
                                      if(legalDoc_2){
                                        await UtilityFunctions()
                                            .imagePicker()
                                            .then((value) {
                                          if (value.isNotEmpty) {
                                            setState(() {
                                              legalDocument_2 = value.toString();
                                            });
                                          }
                                        });

                                      }
                                    },
                                    icon:
                                    legalDocument_2.isNotEmpty
                                        ?
                                    GestureDetector(
                                      onTap: () {
                                        legalDoc_2=true;
                                        legalDocument_2="";
                                        setState(() {

                                        });
                                      },
                                      child: Icon(Icons.edit,size:size.height*0.022),
                                    )
                                        :
                                    const Icon(
                                      Icons.file_upload_outlined,
                                      color: Colors.black54,
                                    )),
                                SizedBox(
                                  height: size.height*0.06,
                                  width: size.width*0.8,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: size.height*0.013),
                                    child: AutoSizeText(

                                      "Any other required legal documents",
                                      style: GoogleFonts.openSans(

                                          color:
                                          const Color.fromRGBO(73, 69, 79, 1),
                                          fontSize: size.height * 0.019,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.045,
                          ),
                          Container(
                            height: size.height * 0.08,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(size.height * 0.005)),
                                border:
                                Border.all(color: Colors.purple.shade200)),
                            child: Padding(
                              padding:
                              EdgeInsets.only(left: size.height * 0.02),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          termsAndConditions =
                                          !termsAndConditions;
                                        });
                                      },
                                      child: Container(
                                        height: size.height * 0.024,
                                        width: size.width * 0.045,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                    size.height * 0.003)),
                                            border: Border.all(
                                                color: Colors.black87,
                                                style: BorderStyle.solid,
                                                width: 1)),
                                        child: termsAndConditions
                                            ? Icon(
                                          Icons.check,
                                          size: size.height * 0.020,
                                          color: Colors.green,
                                        )
                                            : const SizedBox(),
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.032,
                                    ),
                                    SizedBox(
                                      width: size.width * 0.8,
                                      child: Row(
                                        children: [
                                          AutoSizeText(
                                            "Agree App’s",
                                            style: GoogleFonts.openSans(
                                                color: const Color.fromRGBO(
                                                    73, 69, 79, 1),
                                                fontSize: size.height * 0.018,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          GestureDetector(
                                            onTap: (){
                                           Navigator.push(context, MaterialPageRoute(builder: (context) => const TermsAndCondition(),));


                                            },
                                            child: AutoSizeText(
                                              " terms & conditions.",
                                              style: GoogleFonts.openSans(
                                                  color: Colors.blue,
                                                  // color: const Color.fromRGBO(
                                                  //     73, 69, 79, 1),
                                                  fontSize: size.height * 0.018,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ]),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.045,
                          ),
                          Container(
                            height: size.height * 0.08,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(size.height * 0.005)),
                                border:
                                Border.all(color: Colors.purple.shade200)),
                            child: Padding(
                              padding:
                              EdgeInsets.only(left: size.height * 0.02),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          policyPrivacy = !policyPrivacy;
                                        });
                                      },
                                      child: Container(
                                        height: size.height * 0.024,
                                        width: size.width * 0.045,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                    size.height * 0.003)),
                                            border: Border.all(
                                                color: Colors.black87,
                                                style: BorderStyle.solid,
                                                width: 1)),
                                        child: policyPrivacy
                                            ? Icon(
                                          Icons.check,
                                          size: size.height * 0.020,
                                          color: Colors.green,
                                        )
                                            : const SizedBox(),
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.032,
                                    ),
                                    SizedBox(
                                      width: size.width * 0.8,
                                      child: AutoSizeText(
                                        "Agree Shop policies, shipping, returns, and customer service.",
                                        style: GoogleFonts.openSans(
                                            color: const Color.fromRGBO(
                                                73, 69, 79, 1),
                                            fontSize: size.height * 0.018,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    )
                                  ]),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.045,
                          ),
                          SizedBox(
                            height: size.height * 0.052,
                            width: size.width * 0.95,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(size.height * 0.01))),
                                backgroundColor:
                                shopNameController.text.isEmpty ||
                                    locationController.text.isEmpty ||
                                    uniqueDescriptionController
                                        .text.isEmpty ||
                                    shopCoverPhotoPath.isEmpty ||
                                    portfolioImage_1.isEmpty ||
                                    portfolioImage_2.isEmpty ||
                                    portfolioImage_4.isEmpty ||
                                    portfolioImage_4.isEmpty ||
                                    !termsAndConditions ||
                                    !policyPrivacy
                                    ? Colors.grey
                                    : Colors.purple.shade300,
                              ),
                              onPressed: () async {
                                if (shopNameController.text.isNotEmpty &&
                                    locationController.text.isNotEmpty &&
                                    uniqueDescriptionController.text.isNotEmpty &&
                                    shopCoverPhotoPath.isNotEmpty &&
                                    portfolioImage_1.isNotEmpty &&
                                    portfolioImage_2.isNotEmpty &&
                                    portfolioImage_4.isNotEmpty &&
                                    portfolioImage_4.isNotEmpty &&
                                    legalDocument_1.isNotEmpty &&
                                    legalDocument_2.isNotEmpty &&
                                    termsAndConditions &&
                                    policyPrivacy)
                                {
                                  portfolioShop.add(portfolioImage_1);
                                  portfolioShop.add(portfolioImage_2);
                                  portfolioShop.add(portfolioImage_3);
                                  portfolioShop.add(portfolioImage_4);
                                  Map<String,dynamic>userShopData={
                                    "shopName":shopNameController.text,
                                    "shopLocation":locationController.text,
                                    "uniquesness":uniqueDescriptionController.text,
                                    "shopCoverPhoto":shopCoverPhotoPath,
                                    "docOne":legalDocument_1,
                                    "docTwo":legalDocument_2,
                                    "termOne":termsAndConditions.toString(),
                                    "termTwo":policyPrivacy.toString(),
                                    "portfolioShop":portfolioShop,
                                  };

                                //   await  ShopDetailApi().editShopDetails(userShopData,widget.shopDetails[0]["_id"]).then((value){
                                //     if(value=="Done"){
                                //       showDialog(
                                //
                                //           context: context,
                                //           builder: (context) => AlertDialog(
                                //             content: SizedBox(
                                //                 height: size.height*0.026,
                                //                 width: size.width*0.3,
                                //                 child:Row(
                                //                   children: [
                                //                     Icon(Icons.check_circle,size: size.height*0.035,color: Colors.green,),
                                //                     SizedBox(
                                //                       width: size.width*0.022,
                                //                     ),
                                //                     AutoSizeText("Done",style: GoogleFonts.openSans(
                                //                         color: Colors.green,
                                //                         fontSize: size.height*0.02,
                                //                         fontWeight: FontWeight.w600
                                //                     ))
                                //                   ],
                                //                 )
                                //
                                //             ),
                                //             actions: <Widget>[
                                //               SizedBox(
                                //                 height: size.height*0.05,
                                //                 width: size.width,
                                //                 child: Center(
                                //                   child: AutoSizeText("Data added Successfully.",style: GoogleFonts.openSans(
                                //                       color: Colors.green,
                                //                       fontSize: size.height*0.018,
                                //                       fontWeight: FontWeight.w600
                                //                   ),),
                                //                 ),
                                //               ),
                                //               SizedBox(
                                //                 height: size.height*0.02,
                                //               ),
                                //               SizedBox(
                                //                 height: size.height*0.044,
                                //                 width: size.width*1,
                                //                 child: ElevatedButton(
                                //                     style: ElevatedButton.styleFrom(
                                //                         backgroundColor: const Color.fromRGBO(174, 144, 194, 1)),
                                //                     onPressed: () {
                                //
                                //                       Navigator.pop(context);
                                //                       // edit=false;
                                //                       // dataFetched=true;
                                //                       setState(() {
                                //
                                //                       });
                                //                     },
                                //                     child: const Text("OK",style: TextStyle(color: Colors.black),)),
                                //               )
                                //             ],
                                //           ));
                                //     }
                                //     else{
                                //       UtilityFunctions().errorScreen(context, "Failed to add details.");
                                //     }
                                //   });
                                //
                                  } else {

                                  UtilityFunctions().errorToast("Please provide all (*) fields.");


                                }
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AutoSizeText(
                                    "Save Changes",
                                    style: GoogleFonts.openSans(
                                        color: Colors.white,
                                        fontSize: size.height * 0.022,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.045,
                          ),
                        ]),
                  ),
                ),
              ],
            )
                :
            Column(
              children: [
                SizedBox(
                  height: size.height * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.all(size.height * 0.01),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            "A few details about your shop",
                            style: GoogleFonts.openSans(
                                color: textColor,
                                fontWeight: FontWeight.w600,
                                fontSize: size.height * 0.02),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          SizedBox(
                            height: size.height * 0.06,
                            child: TextField(
                              controller: shopNameController,
                              obscureText: false,
                              decoration: InputDecoration(
                                focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.black38)),
                                border: const OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.black38)),
                                disabledBorder: const OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.black38)),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.black38)),
                                labelText: "shop's Name",
                                labelStyle: GoogleFonts.openSans(
                                    fontSize: size.height * 0.018,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          SizedBox(
                            height: size.height * 0.06,
                            child: TextField(
                              controller: locationController,
                              obscureText: false,
                              decoration: InputDecoration(
                                focusedBorder: const OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.black38),
                                ),
                                border: const OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.black38),
                                ),
                                disabledBorder: const OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.black38),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.black38),
                                ),
                                labelText: "shop's Physical Location",
                                prefixIcon:
                                const Icon(Icons.location_on_outlined),
                                prefixIconColor: Colors.grey,
                                labelStyle: GoogleFonts.openSans(
                                    fontSize: size.height * 0.018,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          GestureDetector(
                            onTap: () async {
                              await UtilityFunctions()
                                  .imagePicker()
                                  .then((value) {
                                if (value.isNotEmpty) {
                                  setState(() {
                                    shopCoverPhotoPath = value.toString();
                                  });
                                }
                              });
                            },
                            child: Container(
                              height: size.height * 0.06,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(size.height * 0.005)),
                                  border: Border.all(
                                      color: Colors.purple.shade200)),
                              child: Padding(
                                padding:
                                EdgeInsets.only(left: size.height * 0.02),
                                child: Row(

                                    children: [
                                      shopCoverPhotoPath.isNotEmpty
                                          ?
                                      Icon(
                                        Icons.check_circle_outline_outlined,
                                        color: Colors.green.shade800,
                                      )
                                          :
                                      const Icon(
                                        Icons.file_upload_outlined,
                                        color: Colors.black54,
                                      ),
                                      SizedBox(
                                        width: size.width*0.02,
                                      ),
                                      AutoSizeText(
                                        "Shop Cover Photo",
                                        style: GoogleFonts.openSans(
                                            color: Colors.black54,
                                            fontSize: size.height * 0.02,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ]),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Container(
                            height: size.height * 0.15,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(size.height * 0.005)),
                                border: Border.all(color: Colors.grey)),
                            child: Padding(
                              padding:
                              EdgeInsets.only(left: size.height * 0.01),
                              child:  TextField(
                                controller: uniqueDescriptionController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "What makes her product unique?",
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          AutoSizeText(
                            "Add your portfolio Photos",
                            style: GoogleFonts.openSans(
                                color: Colors.black,
                                fontSize: size.height * 0.02,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: size.height * 0.025,
                          ),
                          SizedBox(
                            // height: size.height*0.18,

                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      bottom: size.height * 0.02),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                          height: size.height * 0.15,
                                          width: size.width * 0.44,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                      size.height * 0.005)),
                                              border: Border.all(
                                                  color: Colors.black54)),
                                          child: portfolioImage_1.isNotEmpty
                                              ? Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Stack(
                                                children: [
                                                  Container(
                                                    height: size.height *
                                                        0.15,
                                                    width: size.width *
                                                        0.434,
                                                    child: Image.file(
                                                      File(
                                                          portfolioImage_1),
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                    EdgeInsets.only(
                                                      left: size.width *
                                                          0.37,
                                                    ),
                                                    child: GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            portfolioImage_1 =
                                                            '';
                                                          });
                                                        },
                                                        child: const Icon(
                                                          Icons
                                                              .cancel_outlined,
                                                          color: Colors
                                                              .black,
                                                        )),
                                                  )
                                                ],
                                              )
                                            ],
                                          )
                                              : Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceEvenly,
                                            children: [
                                              IconButton(
                                                onPressed: () async {
                                                  await UtilityFunctions()
                                                      .imagePicker()
                                                      .then((value) {
                                                    if (value
                                                        .isNotEmpty) {
                                                      setState(() {
                                                        portfolioImage_1 =
                                                            value
                                                                .toString();
                                                      });
                                                    }
                                                  });
                                                },
                                                icon: const Icon(
                                                  Icons
                                                      .file_upload_outlined,
                                                  color: Colors.black54,
                                                ),
                                              ),
                                              AutoSizeText(
                                                "Upload",
                                                style:
                                                GoogleFonts.openSans(
                                                    color: Colors
                                                        .black54,
                                                    fontWeight:
                                                    FontWeight
                                                        .w500,
                                                    fontSize:
                                                    size.height *
                                                        0.02),
                                              ),
                                              SizedBox(
                                                width: size.width * 0.02,
                                              )
                                            ],
                                          )),
                                      Container(
                                          height: size.height * 0.15,
                                          width: size.width * 0.45,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                      size.height * 0.005)),
                                              border: Border.all(
                                                  color: Colors.black54)),
                                          child: portfolioImage_2.isNotEmpty
                                              ? Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Stack(
                                                children: [
                                                  SizedBox(
                                                    height: size.height *
                                                        0.15,
                                                    width:
                                                    size.width * 0.44,
                                                    child: Image.file(
                                                      File(
                                                          portfolioImage_2),
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                    EdgeInsets.only(
                                                      left: size.width *
                                                          0.37,
                                                    ),
                                                    child: GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            portfolioImage_2 =
                                                            '';
                                                          });
                                                        },
                                                        child: const Icon(
                                                          Icons
                                                              .cancel_outlined,
                                                          color: Colors
                                                              .black,
                                                        )),
                                                  )
                                                ],
                                              )
                                            ],
                                          )
                                              : Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceEvenly,
                                            children: [
                                              IconButton(
                                                onPressed: () async {
                                                  await UtilityFunctions()
                                                      .imagePicker()
                                                      .then((value) {
                                                    if (value
                                                        .isNotEmpty) {
                                                      setState(() {
                                                        portfolioImage_2 =
                                                            value
                                                                .toString();
                                                      });
                                                    }
                                                  });
                                                },
                                                icon: const Icon(
                                                  Icons
                                                      .file_upload_outlined,
                                                  color: Colors.black54,
                                                ),
                                              ),
                                              AutoSizeText(
                                                "Upload",
                                                style:
                                                GoogleFonts.openSans(
                                                    color: Colors
                                                        .black54,
                                                    fontWeight:
                                                    FontWeight
                                                        .w500,
                                                    fontSize:
                                                    size.height *
                                                        0.02),
                                              ),
                                              SizedBox(
                                                width: size.width * 0.02,
                                              )
                                            ],
                                          )),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      bottom: size.height * 0.02),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                          height: size.height * 0.15,
                                          width: size.width * 0.45,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                      size.height * 0.005)),
                                              border: Border.all(
                                                  color: Colors.black54)),
                                          child: portfolioImage_3.isNotEmpty
                                              ? Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Stack(
                                                children: [
                                                  SizedBox(
                                                    height: size.height *
                                                        0.15,
                                                    width: size.width *
                                                        0.443,
                                                    child: Image.file(
                                                      File(
                                                          portfolioImage_3),
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                    EdgeInsets.only(
                                                      left: size.width *
                                                          0.37,
                                                    ),
                                                    child: GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            portfolioImage_3 =
                                                            '';
                                                          });
                                                        },
                                                        child: const Icon(
                                                          Icons
                                                              .cancel_outlined,
                                                          color: Colors
                                                              .black,
                                                        )),
                                                  )
                                                ],
                                              )
                                            ],
                                          )
                                              : Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceEvenly,
                                            children: [
                                              IconButton(
                                                onPressed: () async {
                                                  await UtilityFunctions()
                                                      .imagePicker()
                                                      .then((value) {
                                                    if (value
                                                        .isNotEmpty) {
                                                      setState(() {
                                                        portfolioImage_3 =
                                                            value
                                                                .toString();
                                                      });
                                                    }
                                                  });
                                                },
                                                icon: const Icon(
                                                  Icons
                                                      .file_upload_outlined,
                                                  color: Colors.black54,
                                                ),
                                              ),
                                              AutoSizeText(
                                                "Upload",
                                                style:
                                                GoogleFonts.openSans(
                                                    color: Colors
                                                        .black54,
                                                    fontWeight:
                                                    FontWeight
                                                        .w500,
                                                    fontSize:
                                                    size.height *
                                                        0.02),
                                              ),
                                              SizedBox(
                                                width: size.width * 0.02,
                                              )
                                            ],
                                          )),
                                      Container(
                                          height: size.height * 0.15,
                                          width: size.width * 0.45,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                      size.height * 0.005)),
                                              border: Border.all(
                                                  color: Colors.black54)),
                                          child: portfolioImage_4.isNotEmpty
                                              ? Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Stack(
                                                children: [
                                                  SizedBox(
                                                    height: size.height *
                                                        0.15,
                                                    width: size.width *
                                                        0.443,
                                                    child: Image.file(
                                                      File(
                                                          portfolioImage_4),
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                    EdgeInsets.only(
                                                      left: size.width *
                                                          0.37,
                                                    ),
                                                    child: GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            portfolioImage_4 =
                                                            '';
                                                          });
                                                        },
                                                        child: const Icon(
                                                          Icons
                                                              .cancel_outlined,
                                                          color: Colors
                                                              .black,
                                                        )),
                                                  )
                                                ],
                                              ),
                                            ],
                                          )
                                              : Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceEvenly,
                                            children: [
                                              IconButton(
                                                onPressed: () async {
                                                  await UtilityFunctions()
                                                      .imagePicker()
                                                      .then((value) {
                                                    if (value
                                                        .isNotEmpty) {
                                                      setState(() {
                                                        portfolioImage_4 =
                                                            value
                                                                .toString();
                                                      });
                                                    }
                                                  });
                                                },
                                                icon: const Icon(
                                                  Icons
                                                      .file_upload_outlined,
                                                  color: Colors.black54,
                                                ),
                                              ),
                                              AutoSizeText(
                                                "Upload",
                                                style:
                                                GoogleFonts.openSans(
                                                    color: Colors
                                                        .black54,
                                                    fontWeight:
                                                    FontWeight
                                                        .w500,
                                                    fontSize:
                                                    size.height *
                                                        0.02),
                                              ),
                                              SizedBox(
                                                width: size.width * 0.02,
                                              )
                                            ],
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          AutoSizeText(
                            "Document Verification",
                            style: GoogleFonts.openSans(
                                color: Colors.black,
                                fontSize: size.height * 0.02,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Container(
                            height: size.height * 0.06,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(size.height * 0.005)),
                                border:
                                Border.all(color: Colors.purple.shade200)),
                            child: Padding(
                              padding:
                              EdgeInsets.only(left: size.height * 0.02),
                              child: Row(

                                  children: [
                                    IconButton(
                                        onPressed: () async {
                                          await UtilityFunctions()
                                              .imagePicker()
                                              .then((value) {
                                            if (value.isNotEmpty) {
                                              setState(() {
                                                legalDocument_1 = value.toString();
                                              });
                                            }
                                          });
                                        },
                                        icon:
                                        legalDocument_1.isNotEmpty
                                            ?
                                        Icon(
                                          Icons.check_circle_outline_outlined,
                                          color: Colors.green.shade800,
                                        )
                                            :
                                        const Icon(
                                          Icons.file_upload_outlined,
                                          color: Colors.black54,
                                        )),
                                    AutoSizeText(
                                      "Any other required legal documents",
                                      style: GoogleFonts.openSans(
                                          color:
                                          const Color.fromRGBO(73, 69, 79, 1),
                                          fontSize: size.height * 0.02,
                                          fontWeight: FontWeight.w500),
                                    ),

                                  ]),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.025,
                          ),
                          Container(
                            height: size.height * 0.06,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(size.height * 0.005)),
                                border:
                                Border.all(color: Colors.purple.shade200)),
                            child: Padding(
                              padding:
                              EdgeInsets.only(left: size.height * 0.02),
                              child: Row(children: [
                                IconButton(
                                    onPressed: () async {
                                      await UtilityFunctions()
                                          .imagePicker()
                                          .then((value) {
                                        if (value.isNotEmpty) {
                                          setState(() {
                                            legalDocument_2 = value.toString();
                                          });
                                        }
                                      });
                                    },
                                    icon:
                                    legalDocument_2.isNotEmpty
                                        ?
                                    Icon(
                                      Icons.check_circle_outline_outlined,
                                      color: Colors.green.shade800,
                                    )
                                        :
                                    const Icon(
                                      Icons.file_upload_outlined,
                                      color: Colors.black54,
                                    )),
                                AutoSizeText(
                                  "Any other required legal documents",
                                  style: GoogleFonts.openSans(
                                      color:
                                      const Color.fromRGBO(73, 69, 79, 1),
                                      fontSize: size.height * 0.02,
                                      fontWeight: FontWeight.w500),
                                )
                              ]),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.045,
                          ),
                          Container(
                            height: size.height * 0.08,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(size.height * 0.005)),
                                border:
                                Border.all(color: Colors.purple.shade200)),
                            child: Padding(
                              padding:
                              EdgeInsets.only(left: size.height * 0.02),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          termsAndConditions =
                                          !termsAndConditions;
                                        });
                                      },
                                      child: Container(
                                        height: size.height * 0.024,
                                        width: size.width * 0.045,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                    size.height * 0.003)),
                                            border: Border.all(
                                                color: Colors.black87,
                                                style: BorderStyle.solid,
                                                width: 1)),
                                        child: termsAndConditions
                                            ? Icon(
                                          Icons.check,
                                          size: size.height * 0.020,
                                          color: Colors.green,
                                        )
                                            : const SizedBox(),
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.032,
                                    ),
                                    SizedBox(
                                      width: size.width * 0.8,
                                      child: AutoSizeText(
                                        "Agree App’s terms and conditions.",
                                        style: GoogleFonts.openSans(
                                            color: const Color.fromRGBO(
                                                73, 69, 79, 1),
                                            fontSize: size.height * 0.019,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    )
                                  ]),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.045,
                          ),
                          Container(
                            height: size.height * 0.08,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(size.height * 0.005)),
                                border:
                                Border.all(color: Colors.purple.shade200)),
                            child: Padding(
                              padding:
                              EdgeInsets.only(left: size.height * 0.02),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          policyPrivacy = !policyPrivacy;
                                        });
                                      },
                                      child: Container(
                                        height: size.height * 0.024,
                                        width: size.width * 0.045,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                    size.height * 0.003)),
                                            border: Border.all(
                                                color: Colors.black87,
                                                style: BorderStyle.solid,
                                                width: 1)),
                                        child: policyPrivacy
                                            ? Icon(
                                          Icons.check,
                                          size: size.height * 0.020,
                                          color: Colors.green,
                                        )
                                            : const SizedBox(),
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.032,
                                    ),
                                    SizedBox(
                                      width: size.width * 0.8,
                                      child: AutoSizeText(
                                        "Agree Shop policies, shipping, returns, and customer service.",
                                        style: GoogleFonts.openSans(
                                            color: const Color.fromRGBO(
                                                73, 69, 79, 1),
                                            fontSize: size.height * 0.019,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    )
                                  ]),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.045,
                          ),
                          SizedBox(
                            height: size.height * 0.052,
                            width: size.width * 0.95,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(size.height * 0.01))),
                                backgroundColor:
                                shopNameController.text.isEmpty ||
                                    locationController.text.isEmpty ||
                                    uniqueDescriptionController
                                        .text.isEmpty ||
                                    shopCoverPhotoPath.isEmpty ||
                                    portfolioImage_1.isEmpty ||
                                    portfolioImage_2.isEmpty ||
                                    portfolioImage_4.isEmpty ||
                                    portfolioImage_4.isEmpty ||
                                    !termsAndConditions ||
                                    !policyPrivacy
                                    ? Colors.grey
                                    : Colors.purple.shade300,
                              ),
                              onPressed: () async {
                                if (shopNameController.text.isNotEmpty &&
                                    locationController.text.isNotEmpty &&
                                    uniqueDescriptionController.text.isNotEmpty &&
                                    shopCoverPhotoPath.isNotEmpty &&
                                    portfolioImage_1.isNotEmpty &&
                                    portfolioImage_2.isNotEmpty &&
                                    portfolioImage_4.isNotEmpty &&
                                    portfolioImage_4.isNotEmpty &&
                                    legalDocument_1.isNotEmpty &&
                                    legalDocument_2.isNotEmpty &&
                                    termsAndConditions &&
                                    policyPrivacy)
                                {
                                  portfolioShop.add(portfolioImage_1);
                                  portfolioShop.add(portfolioImage_2);
                                  portfolioShop.add(portfolioImage_3);
                                  portfolioShop.add(portfolioImage_4);
                                  Map<String,dynamic>userShopData={
                                    "shopName":shopNameController.text,
                                    "shopLocation":locationController.text,
                                    "uniquesness":uniqueDescriptionController.text,
                                    "shopCoverPhoto":shopCoverPhotoPath,
                                    "docOne":legalDocument_1,
                                    "docTwo":legalDocument_2,
                                    "termOne":termsAndConditions.toString(),
                                    "termTwo":policyPrivacy.toString(),
                                    "portfolioShop":portfolioShop,
                                  };

                                  await  ShopDetailApi().addShopDetails(userShopData).then((value){
                                    if(value=="Done"){
                                      showDialog(

                                          context: context,
                                          builder: (context) => AlertDialog(
                                            content: SizedBox(
                                                height: size.height*0.026,
                                                width: size.width*0.3,
                                                child:Row(
                                                  children: [
                                                    Icon(Icons.check_circle,size: size.height*0.035,color: Colors.green,),
                                                    SizedBox(
                                                      width: size.width*0.022,
                                                    ),
                                                    AutoSizeText("Done",style: GoogleFonts.openSans(
                                                        color: Colors.green,
                                                        fontSize: size.height*0.02,
                                                        fontWeight: FontWeight.w600
                                                    ))
                                                  ],
                                                )

                                            ),
                                            actions: <Widget>[
                                              SizedBox(
                                                height: size.height*0.05,
                                                width: size.width,
                                                child: Center(
                                                  child: AutoSizeText("Data added Successfully.",style: GoogleFonts.openSans(
                                                      color: Colors.green,
                                                      fontSize: size.height*0.018,
                                                      fontWeight: FontWeight.w600
                                                  ),),
                                                ),
                                              ),
                                              SizedBox(
                                                height: size.height*0.02,
                                              ),
                                              SizedBox(
                                                height: size.height*0.044,
                                                width: size.width*1,
                                                child: ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                        backgroundColor: const Color.fromRGBO(174, 144, 194, 1)),
                                                    onPressed: () {

                                                      Navigator.pop(context);
                                                      // edit=false;
                                                      // dataFetched=true;
                                                      setState(() {

                                                      });
                                                    },
                                                    child: const Text("OK",style: TextStyle(color: Colors.black),)),
                                              )
                                            ],
                                          ));
                                    }
                                    else{
                                      UtilityFunctions().errorToast("Failed to add details.");
                                    }
                                  });
                                } else {

                                  UtilityFunctions().errorToast("Please provide all (*) fields.");


                                }
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AutoSizeText(
                                    "Next",
                                    style: GoogleFonts.openSans(
                                        color: Colors.white,
                                        fontSize: size.height * 0.022,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.05,
                                  ),
                                  const Icon(
                                    CupertinoIcons.arrow_right,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.045,
                          ),
                        ]),
                  ),
                ),
              ],
            )
          ),
        ));
  }
}
