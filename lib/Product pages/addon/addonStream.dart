import 'dart:convert';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vendor/Product%20pages/Services%20Pages/upcycleservice.dart';
import '../../Api/vendorservicesapi.dart';
import '../../Constraints.dart';
import '../../StateManagement/PageBloc.dart';
import '../../StateManagement/PageState.dart';
import '../addon/createaddon.dart';
import 'fetchaddon.dart';


class AddOnServices extends StatefulWidget {
  const AddOnServices({
    super.key,
  });

  @override
  State<AddOnServices> createState() => _AddOnServicesState();
}

class _AddOnServicesState extends State<AddOnServices> {

  List<Map<String ,String>> upCycleServiceType=[];
  List<Map<String ,String>> restoreServiceType=[];


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.02),
          child: Column(
            children: [
              AutoSizeText(
                "Add On Services",
                style: GoogleFonts.openSans(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: size.height * 0.022),
              ),
              SizedBox(
                height: size.height * 0.004,
              ),
            ],
          ),
        ),

        StreamBuilder(
          stream: VendorServicesApi().fetchingServicesType(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = jsonDecode(snapshot.data!.body);
              upCycleServiceType.clear();
              restoreServiceType.clear();
              for(int i=0;i<data["data"].length;i++){
                if(data["data"][i]["service"]["name"].toString().toUpperCase()=="UPCYCLE"){
                  upCycleServiceType.add({
                    "id":data["data"][i]["id"].toString(),
                    "name":data["data"][i]["name"]
                  });
                }
                else{
                  restoreServiceType.add({
                    "id":data["data"][i]["id"].toString(),
                    "name":data["data"][i]["name"]

                  });
                }

              }
              return snapshot.data?.statusCode == 200
                  ?  FetchAddOnServices(serviceType: userModel["vendor_details"]["service_type"].toString().toUpperCase()=="RESTORATION" ? restoreServiceType : upCycleServiceType,)
                  : Column(
                children: [
                  AutoSizeText(
                    "",
                    style: GoogleFonts.openSans(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: size.height * 0.015),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                ],
              );
            } else {
              return const SizedBox();
            }
          },
        ),

        Padding(
          padding: EdgeInsets.only(top: size.height * 0.0005),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: size.height * 0.06,
              width: size.width * 0.37,
              color: Colors.transparent,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 5,
                      backgroundColor: const Color.fromRGBO(236, 230, 240, 1),
                      side: const BorderSide(color: Colors.transparent),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(size.height * 0.02)))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            duration: const Duration(milliseconds: 300),
                            childCurrent: const AddOnServices(),
                            child:  CreatingAddOn( serviceType: userModel["vendor_details"]["service_type"].toString().toUpperCase()=="RESTORATION"

                                ?
                            restoreServiceType
                                :
                            upCycleServiceType,)));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.edit_outlined,
                          color: Colors.deepPurple, size: size.height * 0.02),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      AutoSizeText(
                        "Add AddOn",
                        style: GoogleFonts.openSans(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w600,
                            fontSize: size.height * 0.015),
                      ),
                    ],
                  )),
            ),
          ),
        ),

      ],
    );
  }
}
