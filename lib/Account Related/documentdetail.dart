import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';


import '../Api/User Account API.dart';
import '../Authentication/constraints.dart';
import '../Constraints.dart';
import '../utilityfunctions.dart';

class DocumentDetail extends StatefulWidget {
  DocumentDetail({super.key, required this.accountHolderName,required this.accountNumber,required this.bankName,required this.cityName,required this.branchName,required this.ifscCode });

  String accountHolderName;
  String accountNumber;
  String bankName;
  String cityName;
  String branchName;
  String ifscCode;

  @override
  State<DocumentDetail> createState() => _DocumentDetailState();
}

class _DocumentDetailState extends State<DocumentDetail> {
  TextEditingController businessNameController=TextEditingController();
  TextEditingController entryController=TextEditingController();
  TextEditingController panController=TextEditingController();
  TextEditingController adharController=TextEditingController();
  TextEditingController gstNumberController=TextEditingController();

  String panCardImagePath="";
  String adharCardImagePath="";


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
                height: size.height * 0.06,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(CupertinoIcons.arrow_left),
                    ),
                    SizedBox(
                      width: size.width * 0.18,
                    ),
                    AutoSizeText(
                      "Document Details",
                      style: GoogleFonts.openSans(
                          color: Colors.black,
                          fontSize: size.height * 0.024,
                          fontWeight: FontWeight.w600
                      ),
                    ),

                  ],
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
                          fontWeight: FontWeight.w700
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.015,
                    ),
                    AutoSizeText(
                      "A few details about your shop",
                      style: GoogleFonts.openSans(
                          color: Colors.black,
                          fontSize: size.height * 0.017,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.014,
                    ),
                    SizedBox(
                      height: size.height*0.055,
                      child: TextField(
                        controller: businessNameController,
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
                          labelText: 'Name of Business',
                          labelStyle:  GoogleFonts.openSans(

                              fontSize: size.height * 0.018,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.027,
                    ),
                    SizedBox(
                      height: size.height*0.055,
                      child: TextField(
                        controller: entryController,
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
                          labelText: 'Legal Entity Type',

                          labelStyle:  GoogleFonts.openSans(

                              fontSize: size.height * 0.018,
                              fontWeight: FontWeight.w400
                          ),
                        ),

                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.027,
                    ),
                    SizedBox(
                      height: size.height*0.055,
                      child: TextField(
                        controller: gstNumberController,
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
                          labelText: 'GST Number',

                          labelStyle:  GoogleFonts.openSans(

                              fontSize: size.height * 0.018,
                              fontWeight: FontWeight.w400
                          ),
                        ),

                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.027,
                    ),
                    SizedBox(
                      height: size.height*0.055,
                      child: TextField(
                        controller: panController,
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
                          labelText: 'PAN Number',
                          labelStyle:  GoogleFonts.openSans(

                              fontSize: size.height * 0.018,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height*0.027,
                    ),
                    Container(
                      height: size.height*0.15,
                      width: size.width*1,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Colors.grey.shade400)
                      ),

                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(CupertinoIcons.cloud_upload,color: Colors.purple,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                  onPressed: () async {
                                    ImagePicker imagePicker = ImagePicker(
                                    );
                                    XFile? file = await imagePicker.pickImage(

                                        source: ImageSource.gallery).then((value) async {
                                      if(value!=null){
                                        File? image=File(value.path);
                                        int fileSizeInBytes =image.lengthSync();
                                        double fileSizeInKB = fileSizeInBytes / 1024;
                                        double fileSizeInMB = fileSizeInKB / 1024;
                                        if(fileSizeInMB>10)
                                        {
                                          UtilityFunctions().errorToast("Image has large size.");
                                        }
                                        else{
                                          panCardImagePath=value.path;
                                          setState(() {

                                          });
                                          print("Pan size pat : $panCardImagePath");
                                        }
                                        if (kDebugMode) {
                                          print("File size is : $fileSizeInMB");
                                        }
                                      }
                                      else{
                                        UtilityFunctions().errorToast("Please select image.");
                                      }

                                    });

                                  },
                                  child: const AutoSizeText("Click To Upload")),
                              const AutoSizeText("or drag and drop ")
                            ],
                          ),
                          const AutoSizeText("PDF or JPG (max 10MB)")
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.028,
                    ),
                    SizedBox(
                      height: size.height*0.055,
                      child: TextField(
                        controller: adharController,
                        obscureText: false,
                        keyboardType:TextInputType.number ,
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
                          labelText: 'Aadhaar Number',
                          labelStyle:  GoogleFonts.openSans(

                              fontSize: size.height * 0.02,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height*0.02,
                    ),
                    Container(
                      height: size.height*0.15,
                      width: size.width*1,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Colors.grey.shade400)
                      ),

                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(CupertinoIcons.cloud_upload,color: Colors.purple,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(onPressed: () async {
                                ImagePicker imagePicker = ImagePicker(
                                );
                                XFile? file = await imagePicker.pickImage(

                                    source: ImageSource.gallery).then((value) async {
                                  if(value!=null){
                                    File? image=File(value.path);
                                    int fileSizeInBytes =image.lengthSync();
                                    double fileSizeInKB = fileSizeInBytes / 1024;
                                    double fileSizeInMB = fileSizeInKB / 1024;
                                    if(fileSizeInMB>10)
                                    {
                                      UtilityFunctions().errorToast("Image has large size.");
                                    }
                                    else{
                                      adharCardImagePath=value.path;
                                      if (kDebugMode) {
                                        print("Path is :$adharCardImagePath");
                                      }
                                      setState(() {

                                      });
                                    }
                                    if (kDebugMode) {
                                      print("File size is : $adharCardImagePath");
                                    }
                                  }
                                  else{
                                    UtilityFunctions().errorToast("Please select image.");
                                  }

                                });
                              }, child: const AutoSizeText("Click To Upload")),
                              const AutoSizeText("or drag and drop ")
                            ],
                          ),
                          const Text("PDF or JPG (max 10MB)")

                        ],
                      ),
                    ),

                    SizedBox(
                      height: size.height * 0.06,
                    ),
                    SizedBox(
                      height: size.height*0.052,
                      width: size.width*0.95,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(size.height*0.01))),
                            backgroundColor: const Color.fromRGBO(103, 80, 164, 1)),
                        onPressed: () {
                          if(businessNameController.text.isNotEmpty && gstNumberController.text.isNotEmpty && entryController.text.isNotEmpty && panController.text.isNotEmpty && adharController.text.isNotEmpty && panCardImagePath.isNotEmpty && adharCardImagePath.isNotEmpty ){
                            Map<String,dynamic> documentDetails={};
                            documentDetails['userName'] =userModel["nameUser"].toString();
                            documentDetails['accHolderName'] =widget.accountHolderName.toString();
                            documentDetails['accountNum'] = widget.accountNumber.toString();
                            documentDetails['accountConfirmNum'] = widget.accountNumber.toString();
                            documentDetails['bankName'] = widget.bankName.toString();
                            documentDetails['city'] = widget.cityName.toString();
                            documentDetails['branch'] = widget.branchName.toString();
                            documentDetails['ifscCode'] = widget.ifscCode.toString();
                            documentDetails['nameOfBusiness'] = businessNameController.text.toString();
                            documentDetails['legalEntityType'] =entryController.text.toString().toString() ;
                            documentDetails['panNumber'] =panController.text.toString();
                            documentDetails['gstNumber'] =gstNumberController.text.toString();
                            documentDetails['panCardImage'] =panCardImagePath.toString();
                            documentDetails['adharCardImage'] =adharCardImagePath.toString();
                            showDialog(

                              context: context,
                              builder: (context) => AlertDialog(
                                content: SizedBox(
                                    height: size.height*0.05,
                                    width: size.width*0.3,
                                    child: AutoSizeText("Are you sure to submit?",style: GoogleFonts.openSans(
                                        color: Colors.black87,
                                        fontSize: size.height*0.02,
                                        fontWeight: FontWeight.w600
                                    ))

                                ),
                                actions: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        height: size.height*0.044,
                                        width: size.width*0.25,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: buttonColor),
                                            onPressed: () async {
                                              await UserAccount().addBankAccountDetails(documentDetails).then((value) {
                                                if(value.toString()=="Done"){

                                                  showDialog(

                                                    context: context,
                                                    builder: (context) => AlertDialog(
                                                      content: SizedBox(
                                                          height: size.height*0.026,
                                                          width: size.width*0.3,
                                                          child:Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,
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
                                                            child: AutoSizeText("Detailed Saved Successfully.",style: GoogleFonts.openSans(
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
                                                                  backgroundColor: buttonColor),
                                                              onPressed: () {
                                                                Navigator.pop(context);
                                                              },
                                                              child: const Text("OK",style: TextStyle(color: Colors.black),)),
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                }
                                                else{
                                                  UtilityFunctions().errorToast("Failed to save.");
                                                }
                                              });

                                            },
                                            child: const Text("Yes",style: TextStyle(color: Colors.black),)),
                                      ),
                                      SizedBox(
                                        height: size.height*0.044,
                                        width: size.width*0.25,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: buttonColor),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text("No",style: TextStyle(color: Colors.black),)),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            );

                          }
                          else{
                            UtilityFunctions().errorToast("All fields are required.");
                          }


                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AutoSizeText("Submit Details",
                              style: GoogleFonts.openSans(
                                  color: Colors.white,
                                  fontSize: size.height*0.018,
                                  fontWeight: FontWeight.w500
                              ),
                            ),

                          ],
                        ),
                      ),
                    )
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
