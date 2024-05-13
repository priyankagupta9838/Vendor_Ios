import 'dart:core';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:searchfield/searchfield.dart';
import '../../Api/quotesapi.dart';
import '../../Constraints.dart';
import '../../NotificationSetup/helper_Notification.dart';
import '../../StateManagement/PageBloc.dart';
import '../../StateManagement/PageEvent.dart';
import '../../StateManagement/PageState.dart';
import '../../utilityfunctions.dart';

class RestorationReviewQuotes extends StatefulWidget {
  RestorationReviewQuotes({super.key,required this.service,required this.clothingItem,
    required this.styleDescription,required this.selectedAddOn,required this.estimatedPrice,required this.day,
    required this.refImage_1,required this.refImage_2,required this.quote_id,required this.userDetail,});
  String service;
  String clothingItem;

  String styleDescription;
  String selectedAddOn;
  String estimatedPrice;
  var day;
  String refImage_1;
  String refImage_2;
  var quote_id;
  Map<String ,dynamic> userDetail;

  @override
  State<RestorationReviewQuotes> createState() => _RestorationReviewQuotesState();
}

class _RestorationReviewQuotesState extends State<RestorationReviewQuotes> {
  SearchController searchController=SearchController();
  TextEditingController clothingItemController=TextEditingController();
 // TextEditingController clothingTypeController=TextEditingController();
  TextEditingController styleDescController=TextEditingController();
  TextEditingController selectedAddOnController=TextEditingController();
  TextEditingController estimatedPriceController=TextEditingController();
  TextEditingController rejectedController=TextEditingController();

  int numberOfDay=0;
  List <String>services=[];
  bool reject=false;
  bool accepted=false;
  bool buttonClicked=false;
  bool edit=false;

  @override
  void initState() {
    searchController.text=widget.service.isNotEmpty?widget.service:"";
    clothingItemController.text=widget.clothingItem.isNotEmpty?widget.clothingItem:"";
   // clothingTypeController.text=widget.clothingType.isNotEmpty?widget.clothingType:"";
    styleDescController.text=widget.styleDescription.isNotEmpty?widget.styleDescription:"";
    selectedAddOnController.text=widget.selectedAddOn.isNotEmpty?widget.selectedAddOn:"";
    estimatedPriceController.text=widget.estimatedPrice.isNotEmpty?widget.estimatedPrice:"";
    numberOfDay=int.parse(widget.day)>=0?int.parse(widget.day):0;

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
                      SizedBox(
                        width: size.width*0.8,
                        child: AutoSizeText(
                            "Quote/Order details submitted",
                            maxLines: 1,
                            style: GoogleFonts.cabin(
                                color: Colors.white,
                                fontSize: size.height * 0.022,
                                fontWeight: FontWeight.w600
                            )
                        ),
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
                          "Selected Material type",
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
                              contentPadding: EdgeInsets.only(bottom: size.height*0.02,left: size.width*0.04),
                              labelText: 'Design Ideas',
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
                          height: size.height * 0.00,
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
                              contentPadding: EdgeInsets.only(bottom: size.height*0.02,left: size.width*0.04),
                              labelText: 'Add On',
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
                              contentPadding: EdgeInsets.only(bottom: size.height*0.02,left: size.width*0.04),
                              labelText: 'Price',
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
                        reject
                            ?
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:[
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
                                  maxLines: 4,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(bottom: size.height*0.02,left: size.width*0.04),
                                    hintText: "Write your reason here",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(size.height * 0.01),
                                        ),
                                        borderSide: const BorderSide(width: 1, color: Colors.grey)),
                                  ),
                                ),
                              ),
                              BlocBuilder<QuotesBlo,QuotesState>(
                                builder: (context, state) {
                                  return  GestureDetector(
                                    onTap: () async {
                                      if(rejectedController.text.toString().trim().isNotEmpty){
                                        buttonClicked=true;
                                        setState(() {

                                        });
                                        await QuotesApi().acceptRejectQuotes(widget.quote_id,false,rejectedController.text,numberOfDay.toString()).then((value) async {
                                          if(value=="success"){
                                            await NotificationServices().sendNotification(widget.userDetail["userId"].toString(),"Quotes","Your Quote is rejected by ${userModel["vendor_details"]["shop_name"].toString()}");

                                            buttonClicked=false;
                                            edit=true;

                                            BlocProvider.of<QuotesBlo>(context).add(UpdateQuotesEvent());
                                            setState(() {

                                            });

                                            Navigator.pop(context);
                                            // UtilityFunctions().successScreen(context, "Details Edited successfully");


                                          }
                                          else{
                                            buttonClicked=false;
                                            setState(() {

                                            });
                                            //UtilityFunctions().errorScreen(context,value.toString());
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
                                  );
                                },
                              )


                            ]
                        )

                            :
                        accepted
                            ?
                        BlocBuilder<QuotesBlo,QuotesState>(
                          builder: (context, state) {
                            return  GestureDetector(
                              onTap: () async {

                                buttonClicked=true;
                                setState(() {

                                });
                                await QuotesApi().acceptRejectQuotes(widget.quote_id,true," ",numberOfDay.toString()).then((value) async {
                                  if(value=="success"){
                                    await NotificationServices().sendNotification(widget.userDetail["userId"].toString(),"Quotes","Your Quote is accepted by ${userModel["vendor_details"]["shop_name"].toString()}");
                                    buttonClicked=false;
                                    edit=true;
                                    setState(() {

                                    });

                                    BlocProvider.of<QuotesBlo>(context).add(UpdateQuotesEvent());
                                    Navigator.pop(context);

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
                            );
                          },
                        )
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
                                    color: Colors.deepOrangeAccent,
                                    borderRadius: BorderRadius.circular(
                                      size.height * 0.01,
                                    ),
                                  ),
                                  child:
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(Icons.cancel,
                                        color: Colors.black87,

                                        size: size.height*0.025,
                                      ),

                                      Center(
                                        child:  SizedBox(
                                          width: size.width*0.3,
                                          child: AutoSizeText(
                                            "Reject Quote",
                                            maxLines: 1,
                                            style: GoogleFonts.cabin(
                                                fontSize: size.height * 0.02,
                                                color: Colors.black87
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
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
                                  width: size.width * 0.45,
                                  height: size.height * 0.06,
                                  decoration: BoxDecoration(
                                    color: const Color.fromRGBO(174, 144, 194, 1),
                                    borderRadius: BorderRadius.circular(
                                      size.height * 0.01,
                                    ),
                                  ),
                                  child:
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(Icons.check,
                                        color: Colors.white,
                                        size: size.height*0.025,
                                      ),

                                      Center(
                                        child: SizedBox(
                                          width: size.width*0.3,
                                          child: AutoSizeText(
                                            "Confirm Quote",
                                            maxLines: 1,
                                            style: GoogleFonts.cabin(
                                                fontSize: size.height * 0.02,
                                                color: Colors.white
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                            ),
                          ],
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
