
import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vendor/Registration%20Pages/setUpYourAccountDetails_2.dart';
import '../Constraints.dart';
import '../utilityfunctions.dart';

class RegistrationShopDetail extends StatefulWidget {
  const RegistrationShopDetail({super.key});


  @override
  State<RegistrationShopDetail> createState() => _RegistrationShopDetailState();
}

const cardColor = Color.fromRGBO(235, 227, 240, 1);
const textColor = Color.fromRGBO(28, 28, 30, 1);
const buttonColor = Color.fromRGBO(174, 144, 194, 1);

class _RegistrationShopDetailState extends State<RegistrationShopDetail> {
  TextEditingController shopNameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController uniqueDescriptionController = TextEditingController();
  bool termsAndConditions = false;
  bool uniqueClick = false;
  String shopCoverPhotoPath = "";
  String portfolioImage_1 = "";
  String portfolioImage_2 = "";
  String portfolioImage_3 = "";
  String portfolioImage_4 = "";
  String legalDocument_1 = "";
  String legalDocument_2 = "";
  List <String> portfolioShop=[];


@override
  void initState() {
    // TODO: implement initState
  if(userRegisterData.isNotEmpty) {
    shopNameController.text = userRegisterData["shopName"] ?? "";
    locationController.text = userRegisterData["shopLocation"] ?? "";
    uniqueDescriptionController.text = userRegisterData["uniquesness"] ?? "";
    shopCoverPhotoPath = userRegisterData["shopCoverPhoto"] ?? "";


    if (userRegisterData["portfolioShop"] != null &&
        userRegisterData["portfolioShop"].length == 4) {
      portfolioImage_1 = userRegisterData["portfolioShop"][0];
      portfolioImage_2 = userRegisterData["portfolioShop"][1];
      portfolioImage_3 = userRegisterData["portfolioShop"][2];
      portfolioImage_4 = userRegisterData["portfolioShop"][3];
    }

  }

    super.initState();
  }

  @override

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(
                    height: size.height*0.07,
                  ),
                  Container(
                    color: const Color.fromRGBO(247, 244, 249, 1),
                    height: size.height*0.1,
                    width: size.width,
                    child: Padding(
                      padding:  EdgeInsets.only(left: size.width*0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: const Icon(CupertinoIcons.arrow_left,color: Colors.black,) ),
                          SizedBox(height: size.height*0.02,),
                          AutoSizeText("Setup Your shop",style: GoogleFonts.openSans(
                              decoration: TextDecoration.none,
                              color: const Color.fromRGBO(28, 28, 30, 1),
                              fontWeight: FontWeight.w600,
                              fontSize: size.height*0.023

                          ),),


                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(size.height * 0.01),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                                      BorderSide(color: Colors.black)),
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
                              height: size.height * 0.015,
                            ),
                            GooglePlaceAutoCompleteTextField(
                              textEditingController: locationController,
                              googleAPIKey: "AIzaSyD2wofI9yNNThitezD-zqxd37HYar3ZO9U",
                              inputDecoration:InputDecoration(
                                focusedBorder:  const OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.black),
                                ),
                                border:  const OutlineInputBorder(

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
                                contentPadding: EdgeInsets.only(bottom: size.height*0.01),
                                prefixIcon:
                                const Icon(Icons.location_on_outlined),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    locationController.clear();
                                    setState(() {

                                    });
                                  },
                                    child: const Icon(Icons.cancel_outlined)),
                                prefixIconColor: Colors.grey,
                                alignLabelWithHint: true,
                                labelStyle: GoogleFonts.openSans(
                                    fontSize: size.height * 0.018,
                                    fontWeight: FontWeight.w400),
                              ),
                              containerVerticalPadding: 0,
                              containerHorizontalPadding: 0,
                              debounceTime: 800,
                              countries: const ["in", "fr"],
                              isLatLngRequired: true,
                              getPlaceDetailWithLatLng: (Prediction prediction) {
                              },
                              itemClick: (Prediction prediction) {
                                locationController.text = prediction.description!;
                                locationController.selection = TextSelection.fromPosition(
                                    TextPosition(offset: prediction.description!.length));
                              },
                              itemBuilder: (context, index, Prediction prediction) {
                                return Row(
                                  children: [
                                    const Icon(Icons.location_on),
                                    const SizedBox(
                                      width: 7,
                                    ),
                                    Expanded(child: AutoSizeText(prediction.description ?? "",
                                      style: GoogleFonts.openSans(
                                        fontSize: size.height*0.017,
                                      ),
                                    ))
                                  ],
                                );
                              },
                              // if you want to add seperator between list items
                              seperatedBuilder: const Divider(),
                              isCrossBtnShown: false,
                              //containerHorizontalPadding: 10,
                            ),
                            SizedBox(
                              height: size.height * 0.015,
                            ),
                            GestureDetector(
                              onTap: () async {
                                await UtilityFunctions()
                                    .imagePicker()
                                    .then((value) async {
                                  if (value.isNotEmpty) {

                                    File imageFile = File(value.toString());
                                   // int fileSize = await imageFile.length();
                                    int fileSizeInBytes =
                                    imageFile.lengthSync();
                                    double fileSizeInKB =
                                        fileSizeInBytes / 1024;
                                    double fileSizeInMB =
                                        fileSizeInKB / 1024;
                                    if (fileSizeInMB <= 7) {
                                      setState(() {
                                        shopCoverPhotoPath = value.toString();
                                      });

                                    } else {

                                      UtilityFunctions().errorToast("Please select the image less than or equal to 7 mb ");
                                      print("FileSize....... $fileSizeInMB");
                                    }

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
                                  border: Border.all(color:
                                 ! uniqueClick
                                      ?
                                  Colors.black54
                                  :
                                  Colors.black
                                  )),
                              child: Padding(
                                padding:
                                EdgeInsets.only(left: size.height * 0.01),
                                child:TextField(
                                  controller: uniqueDescriptionController,
                                  maxLines: 20,
                                  onTapOutside: (event) {
                                    uniqueClick=false;
                                    setState(() {

                                    });
                                  },
                                  onTap: () {
                                    uniqueClick=true;
                                    setState(() {

                                    });
                                  },
                                  decoration: const InputDecoration(
                                    focusedBorder:InputBorder.none,
                                    focusColor: Colors.black,
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
                                                :
                                            GestureDetector(
                                              onTap: () async {
                                                await UtilityFunctions()
                                                    .imagePicker()
                                                    .then((value) async {
                                                  if (value.isNotEmpty) {

                                                    File imageFile = File(value.toString());
                                                   // int fileSize = await imageFile.length();
                                                    int fileSizeInBytes =
                                                    imageFile.lengthSync();
                                                    double fileSizeInKB =
                                                        fileSizeInBytes / 1024;
                                                    double fileSizeInMB =
                                                        fileSizeInKB / 1024;
                                                    if (fileSizeInMB <= 7) {
                                                      setState(() {
                                                        portfolioImage_1 = value.toString();
                                                      });

                                                    } else {

                                                      UtilityFunctions().errorToast("Please select the image less than or equal to 7 mb ");
                                                      print("FileSize....... $fileSizeInMB");
                                                    }

                                                  }
                                                });
                                              },
                                                  child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                    .spaceEvenly,
                                              children: [
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
                                                :
                                            GestureDetector(
                                              onTap: () async {
                                                await UtilityFunctions()
                                                    .imagePicker()
                                                    .then((value) async {
                                                  if (value
                                                      .isNotEmpty) {

                                                    File imageFile = File(value.toString());
                                                    //int fileSize = await imageFile.length();
                                                    int fileSizeInBytes =
                                                    imageFile.lengthSync();
                                                    double fileSizeInKB =
                                                        fileSizeInBytes / 1024;
                                                    double fileSizeInMB =
                                                        fileSizeInKB / 1024;
                                                    if (fileSizeInMB <= 7) {
                                                      setState(() {
                                                        portfolioImage_2 =
                                                            value
                                                                .toString();
                                                      });

                                                    } else {

                                                      UtilityFunctions().errorToast("Please select the image less than or equal to 7 mb ");
                                                      print("FileSize....... $fileSizeInMB");
                                                    }

                                                  }
                                                });
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceEvenly,
                                                children: [

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
                                            )
                                        ),
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
                                                :
                                            GestureDetector(
                                              onTap: () async {
                                                await UtilityFunctions()
                                                    .imagePicker()
                                                    .then((value) async {
                                                  if (value
                                                      .isNotEmpty) {


                                                    File imageFile = File(value.toString());
                                                    //int fileSize = await imageFile.length();
                                                    int fileSizeInBytes =
                                                    imageFile.lengthSync();
                                                    double fileSizeInKB =
                                                        fileSizeInBytes / 1024;
                                                    double fileSizeInMB =
                                                        fileSizeInKB / 1024;
                                                    if (fileSizeInMB <= 7) {
                                                      setState(() {
                                                        portfolioImage_3 =
                                                            value
                                                                .toString();
                                                      });
                                                    } else {

                                                      UtilityFunctions().errorToast("Please select the image less than or equal to 7 mb ");
                                                      print("FileSize....... $fileSizeInMB");
                                                    }


                                                  }
                                                });
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceEvenly,
                                                children: [
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
                                                :
                                            GestureDetector(
                                              onTap: () async {
                                                await UtilityFunctions()
                                                    .imagePicker()
                                                    .then((value) async {
                                                  if (value
                                                      .isNotEmpty) {
                                                    File imageFile = File(value.toString());
                                                   // int fileSize = await imageFile.length();
                                                    int fileSizeInBytes =
                                                    imageFile.lengthSync();
                                                    double fileSizeInKB =
                                                        fileSizeInBytes / 1024;
                                                    double fileSizeInMB =
                                                        fileSizeInKB / 1024;
                                                    if (fileSizeInMB <= 7) {
                                                      setState(() {
                                                        portfolioImage_4 =
                                                            value
                                                                .toString();
                                                      });

                                                    } else {

                                                      UtilityFunctions().errorToast("Please select the image less than or equal to 7 mb ");
                                                      print("FileSize....... $fileSizeInMB");
                                                    }

                                                  }
                                                });
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceEvenly,
                                                children: [
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
                                      ],
                                    ),
                                  ),
                                ],
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
                                      portfolioImage_4.isEmpty
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
                                      portfolioImage_4.isNotEmpty
                                  )
                                  {
                                    portfolioShop.add(portfolioImage_1);
                                    portfolioShop.add(portfolioImage_2);
                                    portfolioShop.add(portfolioImage_3);
                                    portfolioShop.add(portfolioImage_4);
                                    userRegisterData["shopName"]=shopNameController.text;
                                    userRegisterData["shopLocation"]=locationController.text;
                                    userRegisterData["uniquesness"]=uniqueDescriptionController.text;
                                    userRegisterData["shopCoverPhoto"]=shopCoverPhotoPath;
                                     // userRegisterData["termOne"]=termsAndConditions.toString();
                                     userRegisterData["portfolioShop"]=portfolioShop;
                                     print("userRegistration dat is ");
                                      print(userRegisterData);
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        child:  const AccountDetails2 (),
                                        type: PageTransitionType.fade,
                                        duration: const Duration(milliseconds: 400),
                                        childCurrent:   const RegistrationShopDetail(),
                                      ),
                                    );
                                  } else {
                                    UtilityFunctions().errorToast("Please provide all (*) fields.");

                                  }
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AutoSizeText(
                                      "Continue",
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
