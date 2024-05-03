import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:searchfield/searchfield.dart';
import 'package:vendor/utilityfunctions.dart';

import '../../Account Related/account.dart';
import '../../Api/vendorservicesapi.dart';


class EditService extends StatefulWidget {
  const EditService({super.key});

  @override
  State<EditService> createState() => _EditServiceState();
}

class _EditServiceState extends State<EditService> {

  TextEditingController selectedService =TextEditingController();
  TextEditingController clothingItemName=TextEditingController();
  TextEditingController clothingItemType=TextEditingController();
  TextEditingController setServicePrice=TextEditingController();
  List<String>services=[];
  final focus = FocusNode();
  bool prefixIcon=false;
  bool buttonClicked=false;


  @override
  void initState() {
    // TODO: implement initState
    selectedService.text="Stitching";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height*0.06,
            ),
            Container(
              color: const Color.fromRGBO(247, 244, 249, 1),
              height: size.height*0.065,
              width: size.width,
              child: Row(
                children: [
                  IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon: const Icon(CupertinoIcons.arrow_left,color: Colors.black,) ),
                  SizedBox(width: size.width*0.135,),
                  AutoSizeText("Edit Services Details",style: GoogleFonts.openSans(
                      color: textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: size.height*0.025

                  ),),


                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),

            Expanded(
              child:  SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: EdgeInsets.all(size.height * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        "Service Selected",
                        style: GoogleFonts.openSans(
                          fontSize: size.height * 0.02,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      SizedBox(
                        height: size.height * 0.062,
                        child: SearchField(
                          suggestionItemDecoration: SuggestionDecoration(),
                          key: const Key('searchfield'),

                          controller: selectedService,
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
                              prefixIcon:
                              const Icon(Icons.check)

                              ,
                              filled: true,

                              hintText: "select service",

                              hintStyle: GoogleFonts.openSans(
                                  color: Colors.grey,
                                  fontSize: size.height * 0.02,
                                  fontWeight: FontWeight.w500),
                              contentPadding: EdgeInsets.only(
                                  top: size.height * 0.01,
                                  left: size.height * 0.0001),

                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      size.height * 0.01)
                              ),
                              disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      size.height * 0.01)
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      size.height * 0.01)
                              ),

                              fillColor: Colors.white,

                              border: InputBorder.none
                          ),
                          focusNode: focus,
                          onSuggestionTap: (value) {
                            setState(() {
                              prefixIcon = true;
                              focus.unfocus();
                            });
                          },
                          enabled: true,
                          itemHeight: 50,
                          maxSuggestionsInViewPort: 3,
                          suggestions:
                          services.map((e) => SearchFieldListItem(e))
                              .toList(),
                        ),
                        // TextField(
                        //   controller: selectedService,
                        //   decoration: InputDecoration(
                        //     prefixIcon: const Icon(Icons.check),
                        //     labelText: 'Stitching',
                        //     border: OutlineInputBorder(
                        //         borderRadius: BorderRadius.all(
                        //           Radius.circular(size.height * 0.01),
                        //         ),
                        //         borderSide: const BorderSide(width: 1, color: Colors.grey)),
                        //   ),
                        // ),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      AutoSizeText(
                        "Clothing item Name",
                        style: GoogleFonts.openSans(
                          fontSize: size.height * 0.02,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      SizedBox(
                        height: size.height * 0.062,
                        child: TextField(
                          controller: clothingItemName,
                          decoration: InputDecoration(
                            suffixIcon: const Icon(Icons.cancel_outlined),
                            labelText: '',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(size.height * 0.01),
                                ),
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.grey)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: size.width * 0.025),
                        child: AutoSizeText("E.g.: Blouse, Pants",
                          style: GoogleFonts.openSans(
                            fontSize: size.height * 0.016,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      AutoSizeText(
                        "Clothing item type or style:",
                        style: GoogleFonts.openSans(
                          fontSize: size.height * 0.02,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.016,
                      ),
                      SizedBox(
                        height: size.height * 0.062,
                        child: TextField(
                          controller: clothingItemType,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(size.height * 0.01),
                                ),
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.grey)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: size.width * 0.025),
                        child: AutoSizeText(
                          "E.g.: Short Pants, Long Pants",
                          style: GoogleFonts.openSans(
                            fontSize: size.height * 0.015,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      AutoSizeText(
                        "Set Service Price",
                        style: GoogleFonts.openSans(
                          fontSize: size.height * 0.02,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      SizedBox(
                        height: size.height * 0.062,
                        child: TextField(
                          controller: setServicePrice,
                          decoration: InputDecoration(
                            //  labelText: '₹2,5000',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(size.height * 0.01),
                                ),
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.grey)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                      SizedBox(
                          height: size.height * 0.047,
                          child:
                          (selectedService.text.toString().trim().isEmpty ||
                              clothingItemName.text.toString().trim().isEmpty ||
                              clothingItemType.text.toString().trim().isEmpty ||
                              setServicePrice.text.toString().trim().isEmpty
                          )
                              ?
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(size.height * 0.01))),
                                backgroundColor: const Color.fromRGBO(29, 27, 32, 0.12)),
                            onPressed: () {
                              UtilityFunctions().errorToast("All fields are required.");
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.arrow_forward,color: Colors.white,size: size.width*0.055,),
                                SizedBox(
                                  width: size.width*0.03,
                                ),
                                Text("Submit Details",
                                  style: GoogleFonts.openSans(
                                      fontSize: size.height * 0.021,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white
                                  ),),
                              ],
                            ),
                          )
                              :
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(size.height * 0.01))),
                                backgroundColor:  const Color.fromRGBO(174, 144, 194, 1)),
                            onPressed: ()  {

                              bool userResponse=false;
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.noHeader,
                                animType: AnimType.scale,
                                body:  Padding(
                                  padding: EdgeInsets.all(size.width*0.03),
                                  child: const Center(
                                    child: Text(
                                      'Do you want to submit?',
                                      style: TextStyle(fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                ),
                                btnCancelOnPress: () {

                                },
                                btnCancelText: "No",
                                btnCancelColor: Colors.redAccent,
                                btnCancelIcon: Icons.close, // You can add an icon if you like
                                btnOkOnPress: () {
                                  userResponse=true;
                                  print("..true");
                                  // Action when "Yes" button is pressed
                                },
                                btnOkText: "Yes",
                                btnOkColor: Colors.green,
                                btnOkIcon: Icons.check, // You can add an icon if you like
                                buttonsTextStyle: TextStyle(
                                  fontSize: size.height * 0.02,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ).show().whenComplete(() async {
                                buttonClicked=true;
                                setState(() {

                                });
                                if(userResponse){
                                  await VendorServicesApi().editVendorServices().then((value) {
                                    if(value.toString()=="success"){
                                      buttonClicked=false;
                                      setState(() {

                                      });

                                      UtilityFunctions().successToast("Service added successfully.");
                                        Navigator.pop(context);

                                    }
                                    else{
                                      buttonClicked=false;
                                      setState(() {

                                      });
                                      UtilityFunctions().successToast( value);
                                    }
                                  });
                                }
                                else{
                                  buttonClicked=false;
                                  setState(() {

                                  });
                                }
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                buttonClicked
                                    ?
                                Row(
                                  children: [
                                    SizedBox(
                                      width: size.width * 0.3,
                                    ),
                                    Center(
                                      child: SizedBox(
                                        height: size.height*0.03,
                                        width: size.height*0.03,
                                        child: const CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  ],
                                )
                                    :
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.arrow_forward,color: Colors.white,size: size.width*0.055,),
                                    SizedBox(
                                      width: size.width*0.03,
                                    ),
                                    Text("Submit Details",
                                      style: GoogleFonts.openSans(
                                          fontSize: size.height * 0.021,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white
                                      ),),
                                  ],
                                ),


                              ],
                            ),
                          )
                      ),

                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
