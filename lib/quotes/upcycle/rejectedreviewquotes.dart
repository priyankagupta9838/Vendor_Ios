import 'dart:core';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:searchfield/searchfield.dart';

import 'messerment.dart';


class RejectedReviewQuotes extends StatefulWidget {
  RejectedReviewQuotes({super.key,required this.service,required this.clothingItem,required this.clothingType,
    required this.styleDescription,required this.selectedAddOn,required this.estimatedPrice,required this.day,
    required this.refImage_1,required this.refImage_2,required this.matImage_1,required this.matImage_2,required this.quote_id,required this.rejectedReason,required this.mesurmentDetail});
  String service;
  String clothingItem;
  String clothingType;
  String styleDescription;
  String selectedAddOn;
  String estimatedPrice;
  var day;
  String refImage_1;
  String refImage_2;
  String matImage_1;
  String matImage_2;
  var quote_id;
  String rejectedReason;
  Map<String ,dynamic> mesurmentDetail;

  @override
  State<RejectedReviewQuotes> createState() => _RejectedReviewQuotesState();
}

class _RejectedReviewQuotesState extends State<RejectedReviewQuotes> {
  SearchController searchController=SearchController();
  TextEditingController clothingItemController=TextEditingController();
  TextEditingController clothingTypeController=TextEditingController();
  TextEditingController styleDescController=TextEditingController();
  TextEditingController neckController=TextEditingController();
  TextEditingController shoulderController=TextEditingController();
  TextEditingController armLengthController=TextEditingController();
  TextEditingController waistController=TextEditingController();
  TextEditingController selectedAddOnController=TextEditingController();
  TextEditingController estimatedPriceController=TextEditingController();
  TextEditingController rejectedController=TextEditingController();

  int numberOfDay=0;
  List <String>services=[];
//Stitching','Alteration','Embellishment Only
  @override
  void initState() {

    searchController.text=widget.service !=""?widget.service:"";
    clothingItemController.text=widget.clothingItem!=""?widget.clothingItem:"";
    clothingTypeController.text=widget.clothingType!=""?widget.clothingType:"";
    styleDescController.text=widget.styleDescription!=""?widget.styleDescription:"";
    // neckController.text=widget.neck!=""?widget.neck:"";
    // shoulderController.text=widget.shoulder!=""?widget.shoulder:"";
    // armLengthController.text=widget.armelength!=""?widget.armelength:"";
    // waistController.text=widget.waist!=""?widget.waist:"";
    selectedAddOnController.text=widget.selectedAddOn!=""?widget.selectedAddOn:"";
    estimatedPriceController.text=widget.estimatedPrice!=""?widget.estimatedPrice:"";
    numberOfDay=int.parse(widget.day)>=0?int.parse(widget.day):0;
    rejectedController.text=widget.rejectedReason??"";




    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height*1,
        width: size.width*1,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.06,
              ),
              Container(
                height: size.height * 0.065,
                width: size.width,
                alignment: Alignment.center,
                color: const Color.fromRGBO(174, 144, 194, 1),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);

                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          )),
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      AutoSizeText("Quote/Order details submitted",
                          style: GoogleFonts.aBeeZee(
                              color: Colors.white,
                              fontSize: size.height * 0.022,
                              fontWeight: FontWeight.w600
                          )
                      ),
                    ]),
              ),
              Padding(
                padding: EdgeInsets.all(size.height * 0.02,),
                child: SizedBox(
                  height: size.height*0.84,
                  width: size.width,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          "Service Selected",
                          style: GoogleFonts.openSans(
                            fontSize: size.height * 0.02,
                            fontWeight: FontWeight.w600,
                          ),

                        ),//Service Selected
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        SizedBox(
                          height: size.height*0.06,
                          child: SearchField(
                            suggestionItemDecoration: SuggestionDecoration(),
                            key: const Key('searchfield'),

                            controller: searchController,
                            readOnly: true,
                            searchStyle: GoogleFonts.openSans(
                                decoration: TextDecoration.none,
                                color: Colors.black87,
                                fontSize: size.height * 0.02,
                                fontWeight: FontWeight.w500),
                            suggestionStyle: GoogleFonts.openSans(


                                color: Colors.black,
                                fontSize: size.height * 0.018,
                                fontWeight: FontWeight.w500),
                            searchInputDecoration: InputDecoration(

                                filled: true,

                                hintText: "select service",

                                hintStyle: GoogleFonts.openSans(
                                    color: Colors.grey,
                                    fontSize: size.height * 0.02,
                                    fontWeight: FontWeight.w500),
                                contentPadding: EdgeInsets.only(
                                    top: size.height * 0.01,
                                    left: size.height * 0.02),

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
                            onSuggestionTap: (value) {
                              setState(() {

                              });
                            },
                            enabled: true,
                            itemHeight: 50,
                            maxSuggestionsInViewPort: 3,
                            suggestions:
                            services.map((e) => SearchFieldListItem(e))
                                .toList(),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        AutoSizeText(
                          "Selected Clothing item",
                          style: GoogleFonts.openSans(
                            fontSize: size.height * 0.02,
                            fontWeight: FontWeight.w600,
                          ),
                        ), //Selected Clothing item
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        SizedBox(
                          height: size.height*0.06,
                          child: TextField(
                            controller: clothingItemController,
                            readOnly: true,
                            decoration: InputDecoration(
                              labelText: 'Blouse',
                              contentPadding: EdgeInsets.only(bottom: size.height*0.02,left: size.width*0.04),
                              labelStyle: const TextStyle(color: Colors.black87),

                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(width: 1, color: Colors.black87),

                                  borderRadius: BorderRadius.circular(

                                      size.height * 0.01)
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    size.height * 0.01),
                                borderSide: const BorderSide(width: 1, color: Colors.black87),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(

                                    size.height * 0.01),
                                borderSide: const BorderSide(width: 1, color: Colors.black87),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(size.height * 0.01),
                                ),

                                borderSide: const BorderSide(width: 1, color: Colors.black87),),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        AutoSizeText(
                          "Style Description",
                          style: TextStyle(
                            fontSize: size.height * 0.02,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        SizedBox(
                          height: size.height*0.2,
                          width: size.width*0.92,
                          child: TextField(
                            controller: styleDescController,
                            readOnly: true,
                            maxLines: 4,
                            decoration: InputDecoration(
                              labelText: 'Design Ideas',
                              contentPadding: EdgeInsets.only(bottom: size.height*0.02,left: size.width*0.04),
                              labelStyle: const TextStyle(color: Colors.black87),

                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(width: 1, color: Colors.black87),

                                  borderRadius: BorderRadius.circular(

                                      size.height * 0.01)
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    size.height * 0.01),
                                borderSide: const BorderSide(width: 1, color: Colors.black87),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(

                                    size.height * 0.01),
                                borderSide: const BorderSide(width: 1, color: Colors.black87),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(size.height * 0.01),
                                ),

                                borderSide: const BorderSide(width: 1, color: Colors.black87),),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        AutoSizeText(
                          "Upload Reference Photos",
                          style: TextStyle(
                            fontSize: size.height * 0.02,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: size.width * 0.45,
                              height: size.height * 0.2,
                              child:
                              widget.refImage_1!=""
                                  ?
                              Image.network(widget.refImage_1)
                                  :

                              Image.asset("assets/images/imagePlaceholder.jpg"),
                            ),
                            SizedBox(
                              width: size.width*0.012,
                            ),

                            SizedBox(
                              width: size.width * 0.45,
                              height: size.height * 0.2,
                              child:
                              widget.refImage_2!=""
                                  ?
                              Image.network(widget.refImage_1)
                                  :

                              Image.asset("assets/images/imagePlaceholder.jpg"),

                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        AutoSizeText(
                          "Upload Material Photos",
                          style: GoogleFonts.openSans(
                            fontSize: size.height * 0.02,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: size.width * 0.45,
                              height: size.height * 0.2,
                              child:
                              widget.matImage_1!=""
                                  ?
                              Image.network(widget.refImage_1)
                                  :

                              Image.asset("assets/images/imagePlaceholder.jpg"),

                            ),
                            SizedBox(
                              width: size.width*0.012,
                            ),
                            SizedBox(
                              width: size.width * 0.45,
                              height: size.height * 0.2,
                              child:
                              widget.matImage_2!=""
                                  ?
                              Image.network(widget.refImage_1)
                                  :

                              Image.asset("assets/images/imagePlaceholder.jpg"),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),


                        SizedBox(
                          height: size.height*0.06,
                          child: TextField(
                            readOnly: true,
                            decoration: InputDecoration(
                              hintText: "Measurements Details",
                              hintStyle:   GoogleFonts.openSans(
                                  fontSize: size.height * 0.02,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black
                              ),
                              suffixIcon: TextButton(onPressed: (){
                                Navigator.push(context, PageTransition(
                                    childCurrent: RejectedReviewQuotes(
                                      service: '', clothingItem: '', clothingType: '',
                                      styleDescription: '',
                                      selectedAddOn:'', estimatedPrice: '', day: null, refImage_1: '', refImage_2: '', matImage_1: '', matImage_2: '', quote_id: null, mesurmentDetail: {}, rejectedReason: '',),
                                    child:  LowerBodyMeasurement(measurement: widget.mesurmentDetail,), type: PageTransitionType.fade));

                              }, child: const AutoSizeText("View Measurement"),),
                              labelStyle: const TextStyle(color: Colors.black87),
                              contentPadding: EdgeInsets.only(bottom: size.height*0.02,left: size.width*0.04),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(width: 1, color: Colors.black87),

                                  borderRadius: BorderRadius.circular(

                                      size.height * 0.01)
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    size.height * 0.01),
                                borderSide: const BorderSide(width: 1, color: Colors.black87),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(

                                    size.height * 0.01),
                                borderSide: const BorderSide(width: 1, color: Colors.black87),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(size.height * 0.01),
                                ),

                                borderSide: const BorderSide(width: 1, color: Colors.black87),),
                            ),
                          ),
                        ),


                        // AutoSizeText(
                        //   "Measurements Details",
                        //   style: GoogleFonts.openSans(
                        //     fontSize: size.height * 0.02,
                        //     fontWeight: FontWeight.w600,
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: size.height * 0.02,
                        // ),
                        // SizedBox(
                        //   height: size.height*0.06,
                        //   child: TextField(
                        //     controller: neckController,
                        //     readOnly: true,
                        //     decoration: InputDecoration(
                        //       labelText: 'Neck',
                        //       contentPadding: EdgeInsets.only(bottom: size.height*0.02,left: size.width*0.04),
                        //       labelStyle: const TextStyle(color: Colors.black87),
                        //
                        //       focusedBorder: OutlineInputBorder(
                        //           borderSide: const BorderSide(width: 1, color: Colors.black87),
                        //
                        //           borderRadius: BorderRadius.circular(
                        //
                        //               size.height * 0.01)
                        //       ),
                        //       disabledBorder: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(
                        //             size.height * 0.01),
                        //         borderSide: const BorderSide(width: 1, color: Colors.black87),
                        //       ),
                        //       enabledBorder: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(
                        //
                        //             size.height * 0.01),
                        //         borderSide: const BorderSide(width: 1, color: Colors.black87),
                        //       ),
                        //       border: OutlineInputBorder(
                        //         borderRadius: BorderRadius.all(
                        //           Radius.circular(size.height * 0.01),
                        //         ),
                        //
                        //         borderSide: const BorderSide(width: 1, color: Colors.black87),),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: size.height * 0.01,
                        // ),
                        // SizedBox(
                        //   height: size.height*0.06,
                        //   child: TextField(
                        //     controller: shoulderController,
                        //     readOnly: true,
                        //     decoration: InputDecoration(
                        //       labelText: 'Shoulder',
                        //       contentPadding: EdgeInsets.only(bottom: size.height*0.02,left: size.width*0.04),
                        //       labelStyle: const TextStyle(color: Colors.black87),
                        //
                        //       focusedBorder: OutlineInputBorder(
                        //           borderSide: const BorderSide(width: 1, color: Colors.black87),
                        //
                        //           borderRadius: BorderRadius.circular(
                        //
                        //               size.height * 0.01)
                        //       ),
                        //       disabledBorder: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(
                        //             size.height * 0.01),
                        //         borderSide: const BorderSide(width: 1, color: Colors.black87),
                        //       ),
                        //       enabledBorder: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(
                        //
                        //             size.height * 0.01),
                        //         borderSide: const BorderSide(width: 1, color: Colors.black87),
                        //       ),
                        //       border: OutlineInputBorder(
                        //         borderRadius: BorderRadius.all(
                        //           Radius.circular(size.height * 0.01),
                        //         ),
                        //
                        //         borderSide: const BorderSide(width: 1, color: Colors.black87),),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: size.height * 0.01,
                        // ),
                        // SizedBox(
                        //   height: size.height*0.06,
                        //   child: TextField(
                        //     controller: armLengthController,
                        //     readOnly: true,
                        //     decoration: InputDecoration(
                        //       labelText: 'Arm Length',
                        //       contentPadding: EdgeInsets.only(bottom: size.height*0.02,left: size.width*0.04),
                        //       labelStyle: const TextStyle(color: Colors.black87),
                        //
                        //       focusedBorder: OutlineInputBorder(
                        //           borderSide: const BorderSide(width: 1, color: Colors.black87),
                        //
                        //           borderRadius: BorderRadius.circular(
                        //
                        //               size.height * 0.01)
                        //       ),
                        //       disabledBorder: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(
                        //             size.height * 0.01),
                        //         borderSide: const BorderSide(width: 1, color: Colors.black87),
                        //       ),
                        //       enabledBorder: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(
                        //
                        //             size.height * 0.01),
                        //         borderSide: const BorderSide(width: 1, color: Colors.black87),
                        //       ),
                        //       border: OutlineInputBorder(
                        //         borderRadius: BorderRadius.all(
                        //           Radius.circular(size.height * 0.01),
                        //         ),
                        //
                        //         borderSide: const BorderSide(width: 1, color: Colors.black87),),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: size.height * 0.01,
                        // ),
                        // SizedBox(
                        //   height: size.height*0.06,
                        //   child: TextField(
                        //     controller: waistController,
                        //     readOnly: true,
                        //     decoration: InputDecoration(
                        //       labelText: 'Waist',
                        //       contentPadding: EdgeInsets.only(bottom: size.height*0.02,left: size.width*0.04),
                        //       labelStyle: const TextStyle(color: Colors.black87),
                        //
                        //       focusedBorder: OutlineInputBorder(
                        //           borderSide: const BorderSide(width: 1, color: Colors.black87),
                        //
                        //           borderRadius: BorderRadius.circular(
                        //
                        //               size.height * 0.01)
                        //       ),
                        //       disabledBorder: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(
                        //             size.height * 0.01),
                        //         borderSide: const BorderSide(width: 1, color: Colors.black87),
                        //       ),
                        //       enabledBorder: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(
                        //
                        //             size.height * 0.01),
                        //         borderSide: const BorderSide(width: 1, color: Colors.black87),
                        //       ),
                        //       border: OutlineInputBorder(
                        //         borderRadius: BorderRadius.all(
                        //           Radius.circular(size.height * 0.01),
                        //         ),
                        //
                        //         borderSide: const BorderSide(width: 1, color: Colors.black87),),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        AutoSizeText(
                          "Selected Add-on",
                          style: GoogleFonts.openSans(
                            fontSize: size.height * 0.02,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        SizedBox(
                          height: size.height*0.06,
                          child: TextField(
                            controller: selectedAddOnController,
                            readOnly: true,
                            decoration: InputDecoration(
                              labelText: 'Add On',
                              contentPadding: EdgeInsets.only(bottom: size.height*0.02,left: size.width*0.04),
                              labelStyle: const TextStyle(color: Colors.black87),

                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(width: 1, color: Colors.black87),

                                  borderRadius: BorderRadius.circular(

                                      size.height * 0.01)
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    size.height * 0.01),
                                borderSide: const BorderSide(width: 1, color: Colors.black87),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(

                                    size.height * 0.01),
                                borderSide: const BorderSide(width: 1, color: Colors.black87),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(size.height * 0.01),
                                ),

                                borderSide: const BorderSide(width: 1, color: Colors.black87),),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        AutoSizeText(
                          "Estimated Price",
                          style: GoogleFonts.openSans(
                            fontSize: size.height * 0.02,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        SizedBox(
                          height: size.height*0.06,
                          child: TextField(
                            controller: estimatedPriceController,
                            readOnly: true,
                            decoration: InputDecoration(
                              labelText: 'Price',
                              contentPadding: EdgeInsets.only(bottom: size.height*0.02,left: size.width*0.04),
                              labelStyle: const TextStyle(color: Colors.black87),

                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(width: 1, color: Colors.black87),

                                  borderRadius: BorderRadius.circular(

                                      size.height * 0.01)
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    size.height * 0.01),
                                borderSide: const BorderSide(width: 1, color: Colors.black87),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(

                                    size.height * 0.01),
                                borderSide: const BorderSide(width: 1, color: Colors.black87),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(size.height * 0.01),
                                ),

                                borderSide: const BorderSide(width: 1, color: Colors.black87),),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        AutoSizeText(
                          "Time to complete the job",
                          style: GoogleFonts.openSans(
                            fontSize: size.height * 0.025,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Container(
                            height: size.height*0.06,
                            width: size.width*1,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(size.height*0.01)),
                                border: Border.all(color: Colors.black87)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(onPressed: (){

                                  if(numberOfDay==0){

                                    setState(() {
                                      numberOfDay=0;
                                    });
                                  }
                                  else{
                                    setState(() {
                                      numberOfDay--;
                                    });
                                  }

                                }, icon: const Icon(CupertinoIcons.minus,color: Colors.black87,)),
                                AutoSizeText("$numberOfDay Days", style: GoogleFonts.openSans(
                                  fontSize: size.height * 0.02,
                                  fontWeight: FontWeight.w600,
                                ),),
                                IconButton(onPressed: (){
                                  setState(() {
                                    numberOfDay++;
                                  });
                                }, icon: const Icon(CupertinoIcons.add,color: Colors.black87,)),


                              ],
                            )
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),

                        AutoSizeText("Rejected Reason",
                          style: GoogleFonts.openSans(
                            fontSize: size.height * 0.025,
                            fontWeight: FontWeight.w600,
                          ),),
                        SizedBox(
                          height: size.height * 0.015,
                        ),
                        SizedBox(
                          height: size.height*0.2,
                          width: size.width*0.92,
                          child: TextField(
                            controller: rejectedController,
                            readOnly: true,
                            maxLines: 4,
                            decoration: InputDecoration(
                              hintText: "Write your reason here",
                              hintStyle: const TextStyle(color: Colors.black87),
                              contentPadding: EdgeInsets.only(bottom: size.height*0.02,left: size.width*0.04),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(width: 1, color: Colors.black87),

                                  borderRadius: BorderRadius.circular(

                                      size.height * 0.01)
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    size.height * 0.01),
                                borderSide: const BorderSide(width: 1, color: Colors.black87),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(

                                    size.height * 0.01),
                                borderSide: const BorderSide(width: 1, color: Colors.black87),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(size.height * 0.01),
                                ),

                                borderSide: const BorderSide(width: 1, color: Colors.black87),),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Container(
                          width: size.width *1,
                          height: size.height * 0.06,
                          decoration: BoxDecoration(
                            color: Colors.red.shade800,
                            borderRadius: BorderRadius.circular(
                              size.height * 0.01,
                            ),
                          ),
                          child:
                          Center(
                            child: AutoSizeText(
                            "Rejected",
                              style: GoogleFonts.openSans(
                                  fontSize: size.height * 0.02,
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ),



                        SizedBox(
                          height: size.height * 0.02,
                        ),

                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
