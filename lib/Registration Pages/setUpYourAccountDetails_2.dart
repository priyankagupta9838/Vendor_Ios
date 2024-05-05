import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:searchfield/searchfield.dart';
import 'package:vendor/Api/Authentication%20Api.dart';
import 'package:vendor/Api/validationapi.dart';
import 'package:vendor/Registration%20Pages/detailsavedscreen.dart';
import '../Constraints.dart';
import '../utilityfunctions.dart';

class AccountDetails2 extends StatefulWidget {
  const AccountDetails2({
    super.key,
  });

  @override
  State<AccountDetails2> createState() => _AccountDetails2State();
}

class _AccountDetails2State extends State<AccountDetails2> {
  TextEditingController businessNameController = TextEditingController();
  TextEditingController entryController = TextEditingController();
  TextEditingController panController = TextEditingController();
  TextEditingController adharController = TextEditingController();
  TextEditingController gstinController = TextEditingController();
  TextEditingController cinController = TextEditingController();
  TextEditingController establishmentLicence=TextEditingController();

  String panCardImagePath = "";
  String adharCardImagePath = "";
  String gstinImagePath = "";
  String cinImagePath = "";
  String  establishmentLicenseImage = "";

  bool buttonClicked = false;
  bool panValidation = true;
  bool adharValidation = true;
  bool gstinValidation = true;
  bool cinValidation = true;
  final focus = FocusNode();
  List<String> entity = ['Individual', 'Firm', 'Private Limited', 'LLP'];
  @override
  void initState() {
    // TODO: implement initState

    if(userRegisterData.isNotEmpty){
          businessNameController.text=userRegisterData['nameOfBusiness']??"" ;
          entryController.text=userRegisterData['legalEntityType']??"";
          panController.text=userRegisterData['panNumber']??"";
          panCardImagePath=userRegisterData['panCardImage']??"";
          adharController.text= userRegisterData['adharNumber']??"";
          adharCardImagePath=userRegisterData['adharCardImage']??"";
          gstinController.text=userRegisterData['gstin']??"";
          gstinImagePath= userRegisterData['gstinImage']??"";
          cinController.text=userRegisterData['cin']??"";
          cinImagePath=userRegisterData['cinImage']??"";

    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height * 1,
        width: size.width * 1,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.06,
              ),
              Container(
                color: const Color.fromRGBO(247, 244, 249, 1),
                height: size.height * 0.12,
                width: size.width,
                child: Padding(
                  padding: EdgeInsets.only(left: size.width * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            CupertinoIcons.arrow_left,
                            color: Colors.black,
                          )),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      AutoSizeText(
                        "Setup Your shop",
                        style: GoogleFonts.openSans(
                            decoration: TextDecoration.none,
                            color: const Color.fromRGBO(28, 28, 30, 1),
                            fontWeight: FontWeight.w500,
                            fontSize: size.height * 0.025),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: size.height * 0.018,
                  right: size.height * 0.018,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    AutoSizeText(
                      "Document Verification",
                      style: GoogleFonts.openSans(
                          color: Colors.grey,
                          fontSize: size.height * 0.015,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: size.height * 0.015,
                    ),
                    AutoSizeText(
                      "A few details about your shop",
                      style: GoogleFonts.openSans(
                          color: Colors.black,
                          fontSize: size.height * 0.017,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: size.height * 0.014,
                    ),
                    SizedBox(
                      height: size.height * 0.055,
                      child: TextField(
                        controller: businessNameController,
                        obscureText: false,
                        decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black38)),
                          disabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black38)),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black38)),
                          labelText: 'Name of Business',
                          labelStyle: GoogleFonts.openSans(
                              fontSize: size.height * 0.018,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.027,
                    ),
                    SizedBox(
                      height: size.height * 0.054,
                      child: SearchField(
                        suggestionItemDecoration: SuggestionDecoration(),
                        key: const Key('searchfield'),
                        controller: entryController,
                        searchStyle: GoogleFonts.openSans(
                            decoration: TextDecoration.none,
                            color: Colors.black87,
                            fontSize: size.height * 0.02,
                            fontWeight: FontWeight.w500),
                        suggestionStyle: GoogleFonts.openSans(
                            color: Colors.black,
                            fontSize: size.height * 0.02,
                            fontWeight: FontWeight.w500),
                        suggestionsDecoration: SuggestionDecoration(
                            color: Colors.purple.shade50,
                            //shape: BoxShape.rectangle,

                            padding: EdgeInsets.all(size.height * 0.015),
                            // border: Border.all(width: 2, color: Colors.black),
                            borderRadius: BorderRadius.circular(0)),
                        searchInputDecoration: InputDecoration(
                            // fillColor: Colors.black26.withOpacity(0.7),

                            filled: true,
                            focusColor: Colors.purple,
                            hintText: "Legal Entity type",
                            labelText: 'Legal Entity Type',
                            labelStyle: GoogleFonts.openSans(
                                fontSize: size.height * 0.018,
                                fontWeight: FontWeight.w400),
                            hintStyle: GoogleFonts.openSans(
                                color: Colors.grey,
                                fontSize: size.height * 0.02,
                                fontWeight: FontWeight.w500),
                            contentPadding: EdgeInsets.only(
                                top: size.height * 0.01,
                                left: size.height * 0.02),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.black54),
                                borderRadius:
                                    BorderRadius.circular(size.height * 0.006)),
                            disabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.black54),
                                borderRadius:
                                    BorderRadius.circular(size.height * 0.006)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.black54),
                                borderRadius:
                                    BorderRadius.circular(size.height * 0.006)),
                            fillColor: Colors.white,
                            border: InputBorder.none),
                        focusNode: focus,
                        onSuggestionTap: (value) {
                          entryController.text = value.searchKey;
                          setState(() {
                            focus.unfocus();
                            // ABCTY1234D
                          });
                        },
                        enabled: true,
                        itemHeight: 50,
                        maxSuggestionsInViewPort: 3,
                        suggestions:
                            entity.map((e) => SearchFieldListItem(e)).toList(),
                      ),

                    ),
                    SizedBox(
                      height: size.height * 0.027,
                    ),
                    SizedBox(
                      height: size.height * 0.086,
                      child: TextField(
                        controller: panController,
                        obscureText: false,
                        onChanged: (value) {
                          String uppercaseValuePan = value.toUpperCase();
                          panController.text = uppercaseValuePan;
                          String panRegex = r"^[A-Z]{5}[0-9]{4}[A-Z]$";
                          final regExp = RegExp(panRegex);
                          if (!regExp.hasMatch(uppercaseValuePan.toString())) {
                            panValidation = false;
                            setState(() {});
                          } else {
                            ValidationApi()
                                .validatePanNumber(value.toString())
                                .then((value) {
                              if (value == true) {
                                panValidation = true;
                                setState(() {});
                              } else {
                                panValidation = false;
                                setState(() {});
                              }
                            });
                          }
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: size.height*0.0001,left:size.width*0.035),
                          error: AutoSizeText(
                            !panValidation ? "Invalid number" : "",
                            style: GoogleFonts.openSans(
                                fontSize: size.height * 0.01,
                                color: Colors.red,
                                fontWeight: FontWeight.w400),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: panValidation
                                      ? Colors.black
                                      : Colors.red)),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black38)),
                          disabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black38)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: panValidation
                                      ? Colors.black54
                                      : Colors.red)),
                          labelText: 'PAN Number',
                          labelStyle: GoogleFonts.openSans(
                              color:
                                  !panValidation ? Colors.red : Colors.black87,
                              fontSize: size.height * 0.018,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.015,
                    ),
                    Container(
                      height: size.height * 0.15,
                      width: size.width * 1,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Colors.grey.shade400)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          panCardImagePath.isNotEmpty
                              ? Icon(Icons.check_circle,
                                  color: Colors.green,
                                  size: size.height * 0.033)
                              : const Icon(
                                  CupertinoIcons.cloud_upload,
                                  color: Colors.purple,
                                ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                  onPressed: () async {
                                    ImagePicker imagePicker = ImagePicker();
                                    XFile? file = await imagePicker
                                        .pickImage(source: ImageSource.gallery)
                                        .then((value) async {
                                      if (value != null) {
                                        File? image = File(value.path);
                                        int fileSizeInBytes =
                                            image.lengthSync();
                                        double fileSizeInKB =
                                            fileSizeInBytes / 1024;
                                        double fileSizeInMB =
                                            fileSizeInKB / 1024;
                                        if (fileSizeInMB <= 7) {
                                          panCardImagePath = value.path;
                                          setState(() {});
                                          print(
                                              "Pan size pat : $panCardImagePath");
                                        } else {
                                          UtilityFunctions().errorToast("Image has large size.");

                                        }
                                        if (kDebugMode) {
                                          print("File size is : $fileSizeInMB");
                                        }
                                      } else {
                                        UtilityFunctions().errorToast( "Please select image.");
                                      }
                                    });
                                  },
                                  child: const AutoSizeText("Click To Upload")),
                              const AutoSizeText("or drag and drop ")
                            ],
                          ),
                          const AutoSizeText("PDF or JPG (max 7 MB)")
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.028,
                    ),
                    SizedBox(
                      height: size.height * 0.086,
                      child: TextField(
                        controller: adharController,
                        obscureText: false,
                        onChanged: (value) {
                          String panRegex =
                              r'^[2-9]{1}[0-9]{3}[0-9]{4}[0-9]{4}$';
                          //r'^[2-9]{1}[0-9]{3}\s[0-9]{4}\s[0-9]{4}$';
                          final regExp = RegExp(panRegex);
                          if (!regExp.hasMatch(value.toString())) {
                            adharValidation = false;
                            setState(() {});
                          } else {
                            ValidationApi()
                                .validateAadharNumber(value.toString())
                                .then((value) {
                              if (value == true) {
                                adharValidation = true;
                                setState(() {});
                              } else {
                                adharValidation = false;
                                setState(() {});
                              }
                            });
                          }
                        },
                        //2653 8564 4663
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: size.height*0.0001,left:size.width*0.035),
                          error: AutoSizeText(
                            !adharValidation ? "Invalid number" : "",
                            style: GoogleFonts.openSans(
                                fontSize: size.height * 0.01,
                                color: Colors.red,
                                fontWeight: FontWeight.w400),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: adharValidation
                                      ? Colors.black
                                      : Colors.red)),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black38)),
                          disabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black38)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: adharValidation
                                      ? Colors.black38
                                      : Colors.red)),
                          labelText: 'AadhaarNumber',
                          labelStyle: GoogleFonts.openSans(
                              color: !adharValidation
                                  ? Colors.red
                                  : Colors.black87,
                              fontSize: size.height * 0.018,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
                      height: size.height * 0.15,
                      width: size.width * 1,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Colors.grey.shade400)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          adharCardImagePath.isNotEmpty
                              ? Icon(Icons.check_circle,
                                  color: Colors.green,
                                  size: size.height * 0.033)
                              : const Icon(
                                  CupertinoIcons.cloud_upload,
                                  color: Colors.purple,
                                ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                  onPressed: () async {
                                    ImagePicker imagePicker = ImagePicker();
                                    XFile? file = await imagePicker
                                        .pickImage(source: ImageSource.gallery)
                                        .then((value) async {
                                      if (value != null) {
                                        File? image = File(value.path);
                                        int fileSizeInBytes =
                                            image.lengthSync();
                                        double fileSizeInKB =
                                            fileSizeInBytes / 1024;
                                        double fileSizeInMB =
                                            fileSizeInKB / 1024;
                                        if (fileSizeInMB <= 7) {
                                          adharCardImagePath = value.path;
                                          if (kDebugMode) {
                                            print(
                                                "Path is :$adharCardImagePath");
                                          }
                                          setState(() {});
                                        } else {

                                          UtilityFunctions().errorToast(
                                              "Image has large size.");
                                        }
                                        if (kDebugMode) {
                                          print(
                                              "File size is : $adharCardImagePath");
                                        }
                                      } else {
                                        UtilityFunctions().errorToast(
                                             "Please select image.");
                                      }
                                    });
                                  },
                                  child: const AutoSizeText("Click To Upload")),
                              const AutoSizeText("or drag and drop ")
                            ],
                          ),
                          const Text("PDF or JPG (max 7 MB)")
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.028,
                    ),
                    SizedBox(
                      height: size.height * 0.085,
                      child: TextField(
                        controller: gstinController,
                        obscureText: false,
                        onChanged: (value) {
                          String uppercaseValueGst = value.toUpperCase();
                          gstinController.text = uppercaseValueGst;
                          setState(() {

                          });
                          String panRegex =
                              r'^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Za-z]{1}[Z]{1}[0-9A-Za-z]{1}$';
                          final regExp = RegExp(panRegex);
                          if (!regExp.hasMatch(uppercaseValueGst.toString())) {
                             if(gstinController.text.trim().isNotEmpty){
                               gstinValidation = false;
                               setState(() {});
                             }
                             else{
                               gstinValidation = true;
                               setState(() {});
                             }

                          }
                          else {
                            ValidationApi()
                                .validateGstNumber(value.toString())
                                .then((isValid) {
                              setState(() {
                                gstinValidation = isValid;
                              });
                            });
                          }
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: size.height*0.0001,left:size.width*0.035),
                          error: AutoSizeText(
                            !gstinValidation ? "Invalid number" : "",
                            style: GoogleFonts.openSans(
                                fontSize: size.height * 0.01,
                                color: Colors.red,
                                fontWeight: FontWeight.w400),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: gstinValidation
                                      ? Colors.black
                                      : Colors.red)),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black38)),
                          disabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black38)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: gstinValidation
                                      ? Colors.black38
                                      : Colors.red)),
                          labelText: 'GSTIN',
                          labelStyle: GoogleFonts.openSans(
                              color: !gstinValidation
                                  ? Colors.red
                                  : Colors.black87,
                              fontSize: size.height * 0.02,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Container(
                      height: size.height * 0.15,
                      width: size.width * 1,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Colors.grey.shade400)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          gstinImagePath.isNotEmpty
                              ? Icon(Icons.check_circle,
                                  color: Colors.green,
                                  size: size.height * 0.033)
                              : const Icon(
                                  CupertinoIcons.cloud_upload,
                                  color: Colors.purple,
                                ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                  onPressed: () async {
                                    ImagePicker imagePicker = ImagePicker();
                                    XFile? file = await imagePicker
                                        .pickImage(source: ImageSource.gallery)
                                        .then((value) async {
                                      if (value != null) {
                                        File? image = File(value.path);
                                        int fileSizeInBytes =
                                            image.lengthSync();
                                        double fileSizeInKB =
                                            fileSizeInBytes / 1024;
                                        double fileSizeInMB =
                                            fileSizeInKB / 1024;
                                        if (fileSizeInMB <= 7) {
                                          gstinImagePath = value.path;
                                          if (kDebugMode) {}
                                          setState(() {});

                                        } else {
                                          UtilityFunctions().errorToast(
                                              "Image has large size.");
                                        }
                                      } else {
                                        UtilityFunctions().errorToast(
                                             "Please select image.");
                                      }
                                    });
                                  },
                                  child: const AutoSizeText("Click To Upload")),
                              const AutoSizeText("or drag and drop ")
                            ],
                          ),
                          const Text("PDF or JPG (max 7 MB)")
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.028,
                    ),
                    SizedBox(
                      height: size.height * 0.085,
                      child: TextField(
                        controller: cinController,
                        obscureText: false,
                        onChanged: (value) {
                          String uppercaseValueCin = value.toUpperCase();
                          cinController.text = uppercaseValueCin;
                          setState(() {

                          });
                          String panRegex =
                              r'^[LU]{1}[0-9]{5}[A-Z]{2}[0-9]{4}[A-Z]{3}[0-9]{6}$';
                          final regExp = RegExp(panRegex);
                          if (!regExp.hasMatch(uppercaseValueCin.toString())) {
                               if(cinController.text.trim().isNotEmpty){
                                 cinValidation = false;
                                 setState(() {});
                               }
                               else{
                                 cinValidation = true;
                                 setState(() {});
                               }
                          } else {
                            cinValidation = true;
                            setState(() {});
                          }
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: size.height*0.0001,left:size.width*0.035),
                          error: AutoSizeText(
                            !cinValidation ? "Invalid number" : "",
                            style: GoogleFonts.openSans(
                                fontSize: size.height * 0.01,
                                color: Colors.red,
                                fontWeight: FontWeight.w400),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: cinValidation
                                      ? Colors.black
                                      : Colors.red)),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black38)),
                          disabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black38)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: cinValidation
                                      ? Colors.black38
                                      : Colors.red)),
                          labelText: 'CIN Number',
                          labelStyle: GoogleFonts.openSans(
                              fontSize: size.height * 0.02,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Container(
                      height: size.height * 0.15,
                      width: size.width * 1,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Colors.grey.shade400)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          cinImagePath.isNotEmpty
                              ? Icon(Icons.check_circle,
                                  color: Colors.green,
                                  size: size.height * 0.033)
                              : const Icon(
                                  CupertinoIcons.cloud_upload,
                                  color: Colors.purple,
                                ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                  onPressed: () async {
                                    ImagePicker imagePicker = ImagePicker();
                                    XFile? file = await imagePicker
                                        .pickImage(source: ImageSource.gallery)
                                        .then((value) async {
                                      if (value != null) {
                                        File? image = File(value.path);
                                        int fileSizeInBytes =
                                            image.lengthSync();
                                        double fileSizeInKB =
                                            fileSizeInBytes / 1024;
                                        double fileSizeInMB =
                                            fileSizeInKB / 1024;
                                        if (fileSizeInMB <= 7) {
                                          cinImagePath = value.path;
                                          if (kDebugMode) {}
                                          setState(() {});

                                        } else {
                                          UtilityFunctions().errorToast(
                                              "Image has large size.");
                                        }
                                      } else {
                                        UtilityFunctions().errorToast(
                                            "Please select image.");
                                      }
                                    });
                                  },
                                  child: const AutoSizeText("Click To Upload")),
                              const AutoSizeText("or drag and drop ")
                            ],
                          ),
                          const Text("PDF or JPG (max 7 MB)")
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    SizedBox(
                      height: size.height * 0.085,
                      child: TextField(
                        controller: establishmentLicence,
                        obscureText: false,
                        onChanged: (value) {
                          print(establishmentLicence.text);
                          String uppercaseValueEstablish = value.toUpperCase();
                          establishmentLicence.text = uppercaseValueEstablish;
                          print(establishmentLicence.text);
                        },

                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: size.height*0.0001,left:size.width*0.035),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black
                              )),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black38)),
                          disabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black38)),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black38
                                      )),
                          labelText: 'Shop and establishment licence number',
                          labelStyle: GoogleFonts.openSans(
                              fontSize: size.height * 0.02,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    Container(
                      height: size.height * 0.15,
                      width: size.width * 1,
                      decoration: BoxDecoration(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Colors.grey.shade400)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          establishmentLicenseImage.isNotEmpty
                              ? Icon(Icons.check_circle,
                              color: Colors.green,
                              size: size.height * 0.033)
                              : const Icon(
                            CupertinoIcons.cloud_upload,
                            color: Colors.purple,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                  onPressed: () async {
                                    ImagePicker imagePicker = ImagePicker();
                                    XFile? file = await imagePicker
                                        .pickImage(source: ImageSource.gallery)
                                        .then((value) async {
                                      if (value != null) {
                                        File? image = File(value.path);
                                        int fileSizeInBytes =
                                        image.lengthSync();
                                        double fileSizeInKB = fileSizeInBytes / 1024;
                                        double fileSizeInMB = fileSizeInKB / 1024;
                                        if (fileSizeInMB <= 7) {
                                          establishmentLicenseImage = value.path;
                                          setState(() {});
                                          print(
                                              "Embesimemt path : $establishmentLicenseImage");
                                        } else {
                                          UtilityFunctions().errorToast(
                                              "Image has large size.");
                                        }
                                        if (kDebugMode) {
                                          print("File size is : $fileSizeInMB");
                                        }
                                      } else {
                                        UtilityFunctions().errorToast(
                                             "Please select image.");
                                      }
                                    });
                                  },
                                  child: const AutoSizeText("Click To Upload")),
                              const AutoSizeText("or drag and drop ")
                            ],
                          ),
                          const AutoSizeText("PDF or JPG (max 7 MB)")
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
                                  const Color.fromRGBO(103, 80, 164, 1)),
                          onPressed: () {
                          if(!buttonClicked){
                            if (businessNameController.text.trim().isNotEmpty &&
                                entryController.text.trim().isNotEmpty &&
                                panController.text.trim().isNotEmpty &&
                                adharController.text.trim().isNotEmpty &&
                                panCardImagePath.isNotEmpty &&
                                adharCardImagePath.isNotEmpty&&
                                panValidation &&
                                adharValidation &&
                                (gstinController.text.trim().isEmpty || (gstinController.text.trim().isNotEmpty && gstinValidation ))
                                &&
                                (cinController.text.trim().isEmpty || (cinController.text.trim().isNotEmpty && cinValidation ))
                            ) {
                              buttonClicked = true;
                              setState(() {});
                              userRegisterData['nameOfBusiness'] =
                                  businessNameController.text.toString();
                              userRegisterData['legalEntityType'] =
                                  entryController.text.toString().toString();
                              userRegisterData['panNumber'] =
                                  panController.text.toString();
                              userRegisterData['panCardImage'] =
                                  panCardImagePath.toString();
                              userRegisterData['adharNumber'] =
                                  adharController.text.toString();
                              userRegisterData['adharCardImage'] =
                                  adharCardImagePath.toString();
                              userRegisterData['gstin'] =
                                  gstinController.text.toString();
                              userRegisterData['gstinImage'] =
                                  gstinImagePath.toString();
                              userRegisterData['cin'] =
                                  cinController.text.toString();
                              userRegisterData['cinImage'] =
                                  cinImagePath.toString();
                              userRegisterData['shop_n_establishment'] = establishmentLicence.text.toString();
                              userRegisterData['shop_n_establishment_image'] =establishmentLicenseImage.toString();

                              Authentication()
                                  .postVendorDetails()
                                  .then((value) {
                                if (value == "success") {
                                  buttonClicked = false;
                                  userRegisterData.clear();
                                  Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                      child: const DetailsSaved(),
                                      type: PageTransitionType.fade,
                                      duration:
                                      const Duration(milliseconds: 400),
                                      childCurrent: const AccountDetails2(),
                                    ),
                                  );
                                }
                                else {
                                  buttonClicked = false;
                                  UtilityFunctions()
                                      .errorToast(value);

                                  setState(() {});

                                }
                              });
                            }
                            else {
                              buttonClicked = false;
                              UtilityFunctions().errorToast(
                                  "All details must be required.");

                              setState(() {});
                            }
                          }
                          else{
                            UtilityFunctions().errorToast("Please Wait...");
                          }


                           // if(entryController.text=="Individual"){
                           //   if (businessNameController.text.isNotEmpty &&
                           //       entryController.text.isNotEmpty &&
                           //       panController.text.isNotEmpty &&
                           //       adharController.text.isNotEmpty &&
                           //       panCardImagePath.isNotEmpty &&
                           //       adharCardImagePath.isNotEmpty&&
                           //       // gstinController.text.isNotEmpty &&
                           //       // cinImagePath.isNotEmpty &&
                           //       // adharCardImagePath.isNotEmpty &&
                           //       // cinController.text.isNotEmpty &&
                           //       // gstinImagePath.isNotEmpty &&
                           //       panValidation &&
                           //       adharValidation &&
                           //       (gstinController.text.isEmpty || (gstinController.text.isNotEmpty && gstinValidation ))
                           //         &&
                           //       (cinController.text.isEmpty || (cinController.text.isNotEmpty && cinValidation ))
                           //
                           //   ) {
                           //    buttonClicked = true;
                           //     setState(() {});
                           //     userRegisterData['nameOfBusiness'] =
                           //         businessNameController.text.toString();
                           //     userRegisterData['legalEntityType'] =
                           //         entryController.text.toString().toString();
                           //     userRegisterData['panNumber'] =
                           //         panController.text.toString();
                           //     userRegisterData['panCardImage'] =
                           //         panCardImagePath.toString();
                           //     userRegisterData['adharNumber'] =
                           //         adharController.text.toString();
                           //     userRegisterData['adharCardImage'] =
                           //         adharCardImagePath.toString();
                           //     userRegisterData['gstin'] =
                           //         gstinController.text.toString();
                           //     userRegisterData['gstinImage'] =
                           //         gstinImagePath.toString();
                           //     userRegisterData['cin'] =
                           //         cinController.text.toString();
                           //     userRegisterData['cinImage'] =
                           //         cinImagePath.toString();
                           //    userRegisterData['shop_n_establishment'] = establishmentLicence.text.toString();
                           //    userRegisterData['shop_n_establishment_image'] =establishmentLicenseImage.toString();
                           //
                           //     Authentication()
                           //         .postVendorDetails()
                           //         .then((value) {
                           //       if (value == "success") {
                           //         userRegisterData.clear();
                           //         Navigator.pushReplacement(
                           //           context,
                           //           PageTransition(
                           //             child: const DetailsSaved(),
                           //             type: PageTransitionType.fade,
                           //             duration:
                           //             const Duration(milliseconds: 400),
                           //             childCurrent: const AccountDetails2(),
                           //           ),
                           //         );
                           //       } else {
                           //         UtilityFunctions()
                           //             .errorToast(value);
                           //           buttonClicked = false;
                           //           setState(() {});
                           //
                           //       }
                           //     });
                           //    }
                           //     else {
                           //     UtilityFunctions().errorToast(
                           //        "All details must be required.");
                           //     buttonClicked = false;
                           //     setState(() {});
                           //    }
                           //
                           // }
                           // else{
                           //   if (businessNameController.text.isNotEmpty &&
                           //       entryController.text.isNotEmpty &&
                           //       panController.text.isNotEmpty &&
                           //       adharController.text.isNotEmpty &&
                           //       panCardImagePath.isNotEmpty &&
                           //       adharCardImagePath.isNotEmpty &&
                           //       gstinController.text.isNotEmpty &&
                           //       cinImagePath.isNotEmpty &&
                           //       adharCardImagePath.isNotEmpty &&
                           //       cinController.text.isNotEmpty &&
                           //       gstinImagePath.isNotEmpty &&
                           //       panValidation &&
                           //       adharValidation &&
                           //       gstinValidation &&
                           //       cinValidation)
                           //   {
                           //     buttonClicked = true;
                           //     setState(() {});
                           //     userRegisterData['nameOfBusiness'] =
                           //         businessNameController.text.toString();
                           //     userRegisterData['legalEntityType'] =
                           //         entryController.text.toString().toString();
                           //     userRegisterData['panNumber'] =
                           //         panController.text.toString();
                           //     userRegisterData['panCardImage'] =
                           //         panCardImagePath.toString();
                           //     userRegisterData['adharNumber'] =
                           //         adharController.text.toString();
                           //     userRegisterData['adharCardImage'] =
                           //         adharCardImagePath.toString();
                           //     userRegisterData['gstin'] =
                           //         gstinController.text.toString();
                           //     userRegisterData['gstinImage'] =
                           //         gstinImagePath.toString();
                           //     userRegisterData['cin'] =
                           //         cinController.text.toString();
                           //     userRegisterData['cinImage'] =
                           //         cinImagePath.toString();
                           //     userRegisterData['shop_n_establishment'] =
                           //         establishmentLicence.text.toString();
                           //     userRegisterData['shop_n_establishment_image'] =
                           //         establishmentLicenseImage.toString();
                           //     Authentication()
                           //         .postVendorDetails()
                           //         .then((value) {
                           //       if (value == "success") {
                           //         userRegisterData.clear();
                           //         Navigator.pushReplacement(
                           //           context,
                           //           PageTransition(
                           //             child: const DetailsSaved(),
                           //             type: PageTransitionType.fade,
                           //             duration:
                           //             const Duration(milliseconds: 400),
                           //             childCurrent: const AccountDetails2(),
                           //           ),
                           //         );
                           //       } else {
                           //         UtilityFunctions()
                           //             .errorToast(value);
                           //
                           //           buttonClicked = false;
                           //           setState(() {});
                           //
                           //       }
                           //     });
                           //   } else {
                           //     userRegisterData['shop_n_establishment'] =
                           //         establishmentLicence.text.toString();
                           //     userRegisterData['shop_n_establishment_image'] =
                           //         establishmentLicenseImage.toString();
                           //     print(userRegisterData['shop_n_establishment']);
                           //     print(userRegisterData['shop_n_establishment_image']);
                           //     UtilityFunctions().errorToast(
                           //         "All details must be required.");
                           //     buttonClicked = false;
                           //     setState(() {});
                           //   }
                           // }
                          },
                          child: buttonClicked
                              ? Center(
                                  child: SizedBox(
                                    height: size.height * 0.03,
                                    width: size.height * 0.03,
                                    child: const CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              : AutoSizeText("Admin Approval",
                                  style: GoogleFonts.openSans(
                                      color: Colors.white,
                                      fontSize: size.height * 0.018,
                                      fontWeight: FontWeight.w500))),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
