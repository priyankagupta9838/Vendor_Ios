import 'dart:convert';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vendor/utilityfunctions.dart';
import '../../Api/vendorservicesapi.dart';
import '../../Constraints.dart';
import '../../StateManagement/PageBloc.dart';
import '../../StateManagement/PageEvent.dart';
import '../../StateManagement/PageState.dart';


class UpCycleServices extends StatefulWidget {
  UpCycleServices({super.key,required this.serviceType});
    List<Map<String,String>>serviceType;
  @override
  State<UpCycleServices> createState() => _UpCycleServicesState();
}

class _UpCycleServicesState extends State<UpCycleServices> {
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
          return   StreamBuilder(
            stream: VendorServicesApi().fetchStitchingServices(widget.serviceType[index]["id"].toString()) ,
            builder: (context, snapshot) {
              if( snapshot.hasData ){
                var data=jsonDecode(snapshot.data!.body);
                //print(data["data"]);
                return snapshot.data?.statusCode==200 && data["data"].length>0
                    ?
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height*0.01,
                    ),
                    AutoSizeText("${widget.serviceType[index]["name"]}(${data["data"][0]["vendor_services_list"].length})",style: GoogleFonts.openSans(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: size.height*0.015
                    ),),
                    SizedBox(
                      height: size.height*0.01,
                    ),
                    SizedBox(
                      height: size.height*0.085*data["data"][0]["vendor_services_list"].length,
                      width: size.width*1,
                      child: ListView.builder(
                        itemCount: data["data"][0]["vendor_services_list"].length,

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
                                  height: size.height*0.076,
                                  width: size.width*1,
                                  color: const Color.fromRGBO(254, 247, 255, 0.5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height: size.height*0.07,
                                        width: size.width*0.2,
                                        decoration: BoxDecoration(
                                          //color: Colors.grey,
                                            borderRadius: BorderRadius.all(Radius.circular(size.height*0.02)),
                                            border: Border.all(color: Colors.black12),
                                            image:    (data["data"][0]["vendor_services_list"][index]["service"]["image"]!=null &&  data["data"][0]["vendor_services_list"].length>0)
                                                ?
                                            DecorationImage(
                                                image: NetworkImage(data["data"][0]["vendor_services_list"][index]["service"]["image"]))
                                                :
                                            const DecorationImage(
                                                image:AssetImage("assets/logo/download.png"),

                                                fit: BoxFit.fill
                                            )
                                        ),
                                      ),
                                      SizedBox(
                                        width: size.width*0.02,
                                      ),
                                      SizedBox(
                                        height: size.height*0.08,
                                        width: size.width*0.57,
                                        child:  Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            data["data"][0]["vendor_services_list"][index]["approved"]==null
                                                ?
                                            AutoSizeText(" Waiting for approval",style: GoogleFonts.openSans(
                                                color: Colors.black87,
                                                fontWeight: FontWeight.w600,
                                                fontSize: size.height*0.016
                                            ),)
                                                :
                                            data["data"][0]["vendor_services_list"][index]["approved"]==0
                                                ?
                                            AutoSizeText("Rejected",style: GoogleFonts.openSans(
                                                color: Colors.red.shade800,
                                                fontWeight: FontWeight.w600,
                                                fontSize: size.height*0.016
                                            ),)
                                                :
                                            AutoSizeText("Approved",style: GoogleFonts.openSans(
                                                color: Colors.green.shade800,
                                                fontWeight: FontWeight.w600,
                                                fontSize: size.height*0.016
                                            ),),


                                            AutoSizeText(
                                            "${data["data"][0]["name"]}" ,
                                              style: GoogleFonts.openSans(
                                                color: Colors.black87,
                                                fontWeight: FontWeight.w500,
                                              fontSize: size.height*0.016
                                            ),),
                                            AutoSizeText("\u{20B9}${data["data"][0]["vendor_services_list"][index]["price"]} || ${userModel["vendor_details"]["service_type"].toString().toUpperCase()=="RESTORATION"
                                                  ?
                                          "${data["data"][0]["vendor_services_list"][index]["material_type"]}"
                                             :
                                       "${data["data"][0]["vendor_services_list"][index]["clothing_item_type"]}"}",
                                              style: GoogleFonts.openSans(
                                                color: Colors.black87,
                                                fontWeight: FontWeight.w400,
                                                  fontSize: size.height*0.016
                                            ),),
                                          ],
                                        ),
                                      ),
                                      BlocBuilder<AddServiceBlo,AddServiceState>(builder: (context, state) {
                                        return FlutterSwitch(
                                          activeColor: Colors.green,
                                          width: size.width*0.11,
                                          height:size.height*0.033,
                                          valueFontSize: size.height*0.012,
                                          toggleSize: size.width*0.1,
                                          value: data["data"][0]["vendor_services_list"][index]["status"]==1?true:false,
                                          borderRadius: size.width*0.04,
                                          duration: const Duration(milliseconds: 200),
                                          onToggle: (val) async {
                                            if(data["data"][0]["vendor_services_list"][index]["status"]==1){
                                              print(".......If...${val}");
                                              await VendorServicesApi().addVendorServiceActiveInactive(data["data"][0]["vendor_services_list"][index]["id"].toString(),false,false).then((value) {
                                                if(value=="success"){
                                                  // change the state
                                                  BlocProvider.of<AddServiceBlo>(context).add(UpdateServicesEvent());
                                                  UtilityFunctions().successToast("Vendor services updated successfully.");

                                                }
                                              });
                                            }
                                            else{
                                              await VendorServicesApi().addVendorServiceActiveInactive(data["data"][0]["vendor_services_list"][index]["id"].toString(),true,false).then((value) {
                                                if(value=="success"){

                                                  // change the state
                                                  BlocProvider.of<AddServiceBlo>(context).add(UpdateServicesEvent());
                                                  UtilityFunctions().successToast("Vendor services updated successfully.");

                                                }
                                              });
                                            }
                                          },
                                        );
                                      },),

                                      // IconButton(onPressed: (){
                                      //
                                      //   Navigator.push(context, PageTransition(
                                      //       type: PageTransitionType.rightToLeft,
                                      //       duration: const Duration(milliseconds: 300),
                                      //       childCurrent:   UpCycleServices(serviceType: [],),
                                      //       child:   const EditService()));
                                      // }, icon: const Icon(Icons.edit_outlined))

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
                    AutoSizeText("${widget.serviceType[index]["name"]}(0)",style: GoogleFonts.openSans(
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
        },),
      )

      ],
    );
  }
}
