import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:searchfield/searchfield.dart';
import 'package:vendor/utilityfunctions.dart';
import '../../Account Related/account.dart';
import '../../Api/vendorservicesapi.dart';
import '../../StateManagement/PageBloc.dart';
import '../../StateManagement/PageEvent.dart';
import '../../StateManagement/PageState.dart';




class CreatingAddOn extends StatefulWidget {
  CreatingAddOn({super.key,required this.serviceType});
  List<Map<String,String>>serviceType;
  @override
  State<CreatingAddOn> createState() => _CreatingAddOnState();
}

class _CreatingAddOnState extends State<CreatingAddOn> {

  TextEditingController selectedService =TextEditingController();
  TextEditingController clothingItemName=TextEditingController();
  TextEditingController clothingItemType=TextEditingController();
  TextEditingController setServicePrice=TextEditingController();
  TextEditingController descController=TextEditingController();

  late String serviceTypeId;
  bool buttonClicked=false;
  bool buttonClicked2=false;
  bool enableButton=false;
  List<String>services=[];
  List<String>servicesId=[];
  final focus = FocusNode();
  final focus2 = FocusNode();
  bool prefixIcon=false;
  @override
  void initState() {
    // TODO: implement initState
    for(int i=0;i<widget.serviceType.length;i++){
      services.add("${widget.serviceType[i]["name"]}");
      servicesId.add(widget.serviceType[i]["id"].toString());
    }

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
              height: size.height*0.07,
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
                  AutoSizeText("Addon Details",style: GoogleFonts.openSans(
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
              child: SingleChildScrollView(
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
                              fontSize: size.height * 0.018,
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
                            const Icon(Icons.check),
                            suffixIcon: const Icon(Icons.arrow_drop_down),
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

                            border: InputBorder.none,

                          ),
                          focusNode: focus,
                          onSuggestionTap: (value) async {
                            int pos=services.indexOf(value.searchKey);
                            serviceTypeId=servicesId[pos];
                            setState(() {
                              prefixIcon = true;
                              focus.unfocus();
                            });

                          },
                          enabled: true,
                          itemHeight: 50,
                          maxSuggestionsInViewPort: 4,
                          suggestions:
                          services.map((e) => SearchFieldListItem(e))
                              .toList(),
                        ),

                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      AutoSizeText(
                       "Add On Name"
                        ,
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
                          onChanged: (value){
                            clothingItemName.text=value;
                            setState(() {

                            });
                          },

                          decoration: InputDecoration(
                            suffixIcon: const Icon(Icons.cancel_outlined),
                            contentPadding: EdgeInsets.only(bottom: size.height*0.02,left:size.height*0.02),
                            hintText: "Add On Name",
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
                        height: size.height * 0.02,
                      ),
                      AutoSizeText(
                        "AddOn Description",
                        style: GoogleFonts.openSans(
                          fontSize: size.height * 0.02,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      SizedBox(
                        height: size.height*0.2,
                        width: size.width*0.92,
                        child: TextField(
                          controller: descController,
                          maxLines: 4,
                          onChanged: (value){
                            descController.text=value;
                            setState(() {

                            });
                          },
                          decoration: InputDecoration(
                            hintText: "AddOn Description",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(size.height * 0.01),
                                ),
                                borderSide: const BorderSide(width: 1, color: Colors.grey)),
                          ),
                        ),
                      ),

                      AutoSizeText(
                        "Set AddOn Price",
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
                          onChanged: (value){
                            setServicePrice.text=value;
                            setState(() {

                            });
                          },
                          decoration: InputDecoration(
                            //  labelText: '₹2,5000',
                            hintText: 'Set AddOn Price',
                            contentPadding: EdgeInsets.only(bottom: size.height*0.02,left:size.height*0.02),
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
                        height: size.height * 0.05,
                      ),
                      BlocBuilder<AddOnBlo,AddOnState>(builder: (context, state) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                height: size.height * 0.047,
                                width:  size.width*0.44 ,
                                child:
                                (selectedService.text.trim().toString().isEmpty ||
                                    clothingItemName.text.trim().toString().isEmpty ||
                                    setServicePrice.text.trim().toString().isEmpty ||descController.text.trim().toString().isEmpty
                                )
                                    ?
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(size.height * 0.01))),
                                      backgroundColor: const Color.fromRGBO(29, 27, 32, 0.12)),
                                  onPressed: () {

                                    UtilityFunctions().errorToast( "All fields are required.");
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      FittedBox(
                                        child: AutoSizeText("Submit",
                                          maxLines: 1,
                                          style: GoogleFonts.openSans(
                                              fontSize: size.height * 0.021,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white
                                          ),),
                                      ),
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
                                    if(!enableButton){

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
                                        enableButton=true;
                                        setState(() {

                                        });
                                        if(userResponse){

                                          await VendorServicesApi().addOnServices( serviceTypeId.trim(),clothingItemName.text.trim(),descController.text.trim(),
                                            setServicePrice.text, ).then((value) {
                                            if(value.toString()=="success"){
                                              BlocProvider.of<AddOnBlo>(context).add(UpdateAddOnEvent());
                                              buttonClicked=false;
                                              enableButton=false;
                                              setState(() {

                                              });
                                              //  BlocProvider.of<AddOnBlo>(context).add(UpdateAddOnEvent());
                                              UtilityFunctions().successToast( "Service added successfully.");
                                              Navigator.pop(context);
                                            }
                                            else{
                                              buttonClicked=false;
                                              enableButton=false;
                                              setState(() {

                                              });
                                              UtilityFunctions().errorToast(value);
                                            }
                                          });

                                        }
                                        else{
                                          buttonClicked=false;
                                          enableButton=false;

                                          setState(() {

                                          });
                                        }
                                      });
                                    }
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      buttonClicked
                                          ?
                                      Row(
                                        children: [

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
                                          FittedBox(
                                            child: AutoSizeText("Submit",
                                              maxLines: 1,
                                              style: GoogleFonts.openSans(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white
                                              ),),
                                          ),
                                        ],
                                      ),


                                    ],
                                  ),
                                )
                            ),
                            SizedBox(
                                height: size.height * 0.047,
                                width:  size.width*0.44,
                                child:

                                (selectedService.text.trim().toString().isEmpty ||
                                    clothingItemName.text.trim().toString().isEmpty ||
                                    setServicePrice.text.trim().toString().isEmpty ||descController.text.trim().toString().isEmpty
                                )
                                    ?
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(size.height * 0.01))),
                                      backgroundColor: const Color.fromRGBO(29, 27, 32, 0.12)),
                                  onPressed: () {

                                    UtilityFunctions().errorToast( "All fields are required.");
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FittedBox(
                                        child: AutoSizeText("Save & Add",
                                          maxLines: 1,
                                          style: GoogleFonts.openSans(
                                              fontSize: size.height * 0.021,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white
                                          ),),
                                      ),
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
                                  onPressed: () async {
                                    if(!enableButton){
                                      buttonClicked2=true;
                                      enableButton=true;
                                      setState(() {
                                      });
                                      await VendorServicesApi().addOnServices( serviceTypeId.trim(),clothingItemName.text.trim(),descController.text.trim(),
                                        setServicePrice.text, ).then((value) {
                                        if(value.toString()=="success"){
                                          BlocProvider.of<AddOnBlo>(context).add(UpdateAddOnEvent());
                                          UtilityFunctions().successToast( "Service added successfully.");
                                          buttonClicked2=false;
                                          enableButton=false;
                                          setServicePrice.text="";
                                          clothingItemName.text="";
                                          descController.text="";
                                          selectedService.text="";
                                          setState(() {
                                          });

                                        }
                                        else{
                                          buttonClicked2=false;
                                          enableButton=false;
                                          setState(() {
                                          });
                                          UtilityFunctions().errorToast(value);
                                        }
                                      });
                                    }
                                    else{
                                      buttonClicked2=false;
                                      enableButton=false;

                                      setState(() {

                                      });
                                    }

                                  },
                                  child:
                                  buttonClicked2
                                      ?
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

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
                                      FittedBox(
                                        child: AutoSizeText("Save & Add",
                                          style: GoogleFonts.openSans(
                                              fontSize: size.height * 0.021,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white
                                          ),),
                                      ),
                                    ],
                                  ),
                                )

                            )
                          ],
                        );
                      },),

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
