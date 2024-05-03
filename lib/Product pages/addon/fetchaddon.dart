import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../../Api/vendorservicesapi.dart';
import '../../Constraints.dart';
import '../../StateManagement/PageBloc.dart';
import '../../StateManagement/PageEvent.dart';
import '../../StateManagement/PageState.dart';
import '../../utilityfunctions.dart';


class FetchAddOnServices extends StatefulWidget {
  FetchAddOnServices({super.key,required this.serviceType});
  List<Map<String,String>>serviceType;
  @override
  State<FetchAddOnServices> createState() => _FetchAddOnServicesState();
}

class _FetchAddOnServicesState extends State<FetchAddOnServices> {
  @override
  void initState() {
    // TODO: implement initState


    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Column(
      children: [
        SafeArea(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: widget.serviceType.length,
            physics: const NeverScrollableScrollPhysics(), itemBuilder: (

              context, index) {

            //   var servicetypeId=widget.serviceType[index]["id"];
            return   BlocBuilder<AddOnBlo,AddOnState>(builder: (context, state) {
              return StreamBuilder(
                stream: VendorServicesApi().fetchAddOnServices(widget.serviceType[index]["id"].toString()) ,
                builder: (context, snapshot) {
                  if( snapshot.hasData ){
                    var data=jsonDecode(snapshot.data!.body);
                    return snapshot.data?.statusCode==200 && data["data"].length>0
                        ?

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText("${widget.serviceType[index]["name"]}",style: GoogleFonts.openSans(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: size.height*0.015
                        ),),
                        SizedBox(
                          height: size.height*0.01,
                        ),
                        SizedBox(
                          height: size.height*0.079*data["data"].length,
                          width: size.width*1,
                          child:

                          ListView.builder(
                            itemCount: data["data"].length,

                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.all(size.height*0.0),
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return  Padding(
                                padding:  EdgeInsets.only(left: size.height*0.001,right: size.height*0.001,
                                    bottom: size.height*0.01
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      height: size.height*0.07,
                                      width: size.width*1,
                                      color: const Color.fromRGBO(254, 247, 255, 0.5),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            height: size.height*0.07,
                                            width: size.width*0.2,
                                            decoration: BoxDecoration(
                                              color: Colors.grey,
                                                borderRadius: BorderRadius.all(Radius.circular(size.height*0.02)),
                                                border: Border.all(color: Colors.black12),
                                                image: const DecorationImage(
                                                    image: AssetImage("assets/logo/download.png"),

                                                    fit: BoxFit.fill
                                                )
                                            ),
                                          ),
                                          SizedBox(
                                            width: size.width*0.02,
                                          ),
                                          SizedBox(
                                            height: size.height*0.07,
                                            width: size.width*0.57,
                                            child:  Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                AutoSizeText(
                                                  "${data["data"][index]["addon_name"]}" ,
                                                  style: GoogleFonts.openSans(
                                                      color: Colors.black87,
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: size.height*0.017
                                                  ),),
                                                AutoSizeText("\u{20B9}${data["data"][index]["price"]} ",
                                                  style: GoogleFonts.openSans(
                                                      color: Colors.black87,
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: size.height*0.017
                                                  ),),
                                              ],
                                            ),
                                          ),
                                          FlutterSwitch(

                                            activeColor: Colors.green,
                                            width: size.width*0.11,
                                            height:size.height*0.033,
                                            valueFontSize: size.height*0.012,
                                            toggleSize: size.width*0.1,
                                            value: data["data"][index]["status"]==1?true:false,
                                            borderRadius: size.width*0.04,
                                            showOnOff: true,
                                            duration: const Duration(milliseconds: 200),

                                            onToggle: (val) async {
                                              if(data["data"][index]["status"]==1){
                                                print(".......If...${val}");
                                                await VendorServicesApi().addVendorServiceActiveInactive(data["data"][index]["id"].toString(),false,true).then((value) {
                                                  if(value=="success"){
                                                    // change the state
                                                    BlocProvider.of<AddOnBlo>(context).add(UpdateAddOnEvent());
                                                    UtilityFunctions().successToast("Vendor services updated successfully.");

                                                  }
                                                });
                                              }
                                              else{
                                                await VendorServicesApi().addVendorServiceActiveInactive(data["data"][index]["id"].toString(),true,true).then((value) {
                                                  if(value=="success"){

                                                    // change the state
                                                    BlocProvider.of<AddOnBlo>(context).add(UpdateAddOnEvent());
                                                    UtilityFunctions().successToast("Vendor services updated successfully.");

                                                  }
                                                });
                                              }
                                            },
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },),
                        ),
                      ],
                    )
                        :
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText("${widget.serviceType[index]["name"]}",style: GoogleFonts.openSans(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: size.height*0.015
                        ),),
                        SizedBox(
                          height: size.height*0.01,
                        ),
                      ],
                    );
                  }
                  else{
                    return const SizedBox();
                  }
                },
              );
            },);
          },),
        )

      ],
    );
  }
}
