import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vendor/Account%20Related/profile.dart';
import 'package:vendor/Account%20Related/termsAndCondition.dart';
import 'package:vendor/utilityfunctions.dart';

import '../Api/User Account API.dart';
import '../Constraints.dart';
import '../storagestream.dart';
import '../privacyandpolicy.dart';
import 'accountdetail.dart';
import 'loginAndSecurity.dart';
import 'notification.dart';




class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}
const cardColor =  Color.fromRGBO(235, 227, 240, 1);
const textColor =  Color.fromRGBO(28, 28, 30, 1);
const buttonColor =  Color.fromRGBO(174, 144, 194, 1);




class _AccountState extends State<Account> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: size.height*0.065,
              ),

              Container(
                color: const Color.fromRGBO(247, 244, 249, 1),
                height: size.height*0.065,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        icon: const Icon(CupertinoIcons.arrow_left,color: Colors.black,) ),
                    SizedBox(width: size.width*0.25,),
                    AutoSizeText("Account",style: GoogleFonts.openSans(
                        color: textColor,
                        fontWeight: FontWeight.w500,
                        fontSize: size.height*0.025

                    ),),


                  ],
                ),
              ),
              SizedBox(
                height: size.height*0.02,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, PageTransition(
                            type: PageTransitionType.fade,
                            duration: const Duration(milliseconds: 100),
                            childCurrent: const Account(),
                            child: const UerProfile()));
                      },
                      child:Container(
                        height: size.height*0.11,
                        width: size.width*0.95,
                        decoration: BoxDecoration(
                            color:   const Color.fromRGBO(35, 29, 39, 0.1),
                            borderRadius: BorderRadius.all(Radius.circular(size.height*0.01))
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: size.width*0.035,
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.grey,
                              radius: size.height*0.042,
                              child:  AutoSizeText(userModel.isNotEmpty?userModel["fullname"].toString().substring(0,1):"",style: TextStyle(
                                  fontSize: size.height*0.03
                              ),),
                            ),
                            SizedBox(
                              width: size.width*0.032,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText(
                                  userModel.isNotEmpty?"${userModel["fullname"]}":"Full Name",
                                  style: GoogleFonts.openSans(
                                      color: textColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: size.height*0.02
                                  ),),
                                SizedBox(
                                  width: size.width*0.7,
                                  child: AutoSizeText(
                                    userModel.isNotEmpty?"${userModel["email"]??userModel["phone"]}":"User Name",
                                    maxLines: 1,
                                    style: GoogleFonts.openSans(
                                        color: textColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: size.height*0.018
                                    ),),
                                ),

                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height*0.03,
                    ),
                    Container(
                      height: size.height*0.24,
                      width: size.width*0.94,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(35, 29, 39, 0.1),
                          borderRadius: BorderRadius.all(Radius.circular(size.height*0.008))
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height*0.023,
                          ),
                          InkWell(
                            highlightColor: Colors.white,
                            onTap: () {
                              Navigator.push(context, PageTransition(
                                  type: PageTransitionType.fade,
                                  duration: const Duration(milliseconds: 100),
                                  childCurrent: const Account(),
                                  child: const AccountDetail()));
                            },
                            child: Padding(
                              padding:  EdgeInsets.only(left: size.width*0.072),
                              child: Row(
                                children: [

                                  Icon(CupertinoIcons.person,size: size.height*0.024,),
                                  SizedBox(width: size.width*0.033,),
                                  AutoSizeText("Account Details",
                                    style: GoogleFonts.openSans(
                                        fontSize: size.height*0.019
                                    ),)
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height*0.01,
                          ),
                          Divider(
                            height: size.height*0.01,
                            color: Colors.grey,
                            thickness: size.height*0.001,
                            indent: size.width*0.043,
                            endIndent: size.width*0.043,
                          ),
                          SizedBox(
                            height: size.height*0.01,
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left: size.width*0.072),
                            child: InkWell(
                              highlightColor: Colors.white,
                              onTap: () {

                              },
                              child: SizedBox(
                                width: size.width*1,
                                child: Row(
                                  children: [

                                    Icon(CupertinoIcons.person,size: size.height*0.024,),
                                    SizedBox(width: size.width*0.033,),
                                    AutoSizeText("Payments",
                                      style: GoogleFonts.openSans(
                                          fontSize: size.height*0.019
                                      ),)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height*0.01,
                          ),




                          Divider(
                            height: size.height*0.01,
                            color: Colors.grey,
                            thickness: size.height*0.001,
                            indent: size.width*0.043,
                            endIndent: size.width*0.043,
                          ),
                          SizedBox(
                            height: size.height*0.01,
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left: size.width*0.072),
                            child: InkWell(
                              highlightColor: Colors.white,
                              onTap: () {
                                Navigator.push(context, PageTransition(
                                    type: PageTransitionType.fade,
                                    duration: const Duration(milliseconds: 100),
                                    childCurrent: const Account(),
                                    child: const LoginAndSecurity()));
                              },
                              child: Row(
                                children: [

                                  Icon(CupertinoIcons.person,size: size.height*0.024,),
                                  SizedBox(width: size.width*0.033,),
                                  AutoSizeText("Login and Security",
                                    style: GoogleFonts.openSans(
                                      fontSize: size.height*0.019,
                                      decoration: TextDecoration.none,
                                    ),)
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height*0.01,
                          ),
                          Divider(
                            height: size.height*0.01,
                            color: Colors.grey,
                            thickness: size.height*0.001,
                            indent: size.width*0.043,
                            endIndent: size.width*0.043,
                          ),
                          SizedBox(
                            height: size.height*0.01,
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left: size.width*0.072),
                            child: InkWell(
                              highlightColor: Colors.white,
                              onTap: () {
                                Navigator.push(context, PageTransition(
                                    type: PageTransitionType.fade,
                                    duration: const Duration(milliseconds: 100),
                                    childCurrent: const Account(),
                                    child: const Notifications()));
                              },
                              child: Row(
                                children: [

                                  Icon(CupertinoIcons.person,size: size.height*0.024,),
                                  SizedBox(width: size.width*0.033,),
                                  AutoSizeText("Notification",
                                    style: GoogleFonts.openSans(
                                        fontSize: size.height*0.019
                                    ),)
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height*0.01,
                          ),


                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height*0.03,
                    ),
                    Container(
                      height: size.height*0.25,
                      width: size.width*0.94,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(35, 29, 39, 0.1),
                          borderRadius: BorderRadius.all(Radius.circular(size.height*0.008))
                      ),
                      child: Column(
                        children: [

                          SizedBox(
                            height: size.height*0.023,
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left: size.width*0.072),
                            child: InkWell(
                              highlightColor: Colors.white,
                                onTap: () {
                                  Navigator.push(context, PageTransition(
                                      type: PageTransitionType.fade,
                                      duration: const Duration(milliseconds: 100),
                                      childCurrent: const Account(),
                                      child: const TermsAndCondition()));
                                },
                              child: Row(
                                children: [

                                  Icon(CupertinoIcons.person,size: size.height*0.024,),
                                  SizedBox(width: size.width*0.033,),
                                  AutoSizeText("Terms and Conditions",
                                    style: GoogleFonts.openSans(
                                        fontSize: size.height*0.019
                                    ),)
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height*0.01,
                          ),
                          Divider(
                            height: size.height*0.01,
                            color: Colors.grey,
                            thickness: size.height*0.001,
                            indent: size.width*0.043,
                            endIndent: size.width*0.043,
                          ),
                          SizedBox(
                            height: size.height*0.01,
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left: size.width*0.072),
                            child: InkWell(
                              highlightColor: Colors.white,
                                onTap: () async {

                                  if (!await launchUrl(Uri.parse("https://mykanjee.in/privacy-policy/"))) {
                                  throw Exception('Could not launch');
                                  }
                                  // Navigator.push(context, PageTransition(
                                  //     type: PageTransitionType.fade,
                                  //     duration: const Duration(milliseconds: 100),
                                  //     childCurrent: const Account(),
                                  //     child: const PrivacyAndPolicy()));
                                },
                              child: Row(
                                children: [

                                  Icon(CupertinoIcons.person,size: size.height*0.024,),
                                  SizedBox(width: size.width*0.033,),
                                  AutoSizeText("Privacy Policy",
                                    style: GoogleFonts.openSans(
                                        fontSize: size.height*0.019
                                    ),)
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height*0.01,
                          ),
                          Divider(
                            height: size.height*0.01,
                            color: Colors.grey,
                            thickness: size.height*0.001,
                            indent: size.width*0.043,
                            endIndent: size.width*0.043,
                          ),

                          SizedBox(
                            height: size.height*0.01,
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left: size.width*0.072),
                            child: InkWell(
                              highlightColor: Colors.white,
                              onTap: () {

                              },
                              child: Row(
                                children: [

                                  Icon(CupertinoIcons.person,size: size.height*0.024,),
                                  SizedBox(width: size.width*0.033,),
                                  AutoSizeText("Help & Support",
                                    style: GoogleFonts.openSans(
                                        fontSize: size.height*0.019
                                    ),)
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height*0.01,
                          ),
                          Divider(
                            height: size.height*0.01,
                            color: Colors.grey,
                            thickness: size.height*0.001,
                            indent: size.width*0.043,
                            endIndent: size.width*0.043,
                          ),

                          SizedBox(
                            height: size.height*0.01,
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left: size.width*0.072),
                            child: InkWell(
                              highlightColor: Colors.white,
                              onTap: () {
                                bool userResponse=false;
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.noHeader,
                                  animType: AnimType.scale,
                                  body:  Padding(
                                    padding: EdgeInsets.all(size.width*0.03),
                                    child: const Center(
                                      child: Text(
                                        'Do you want to log out?',
                                        style: TextStyle(fontStyle: FontStyle.italic),
                                      ),
                                    ),
                                  ),
                                  btnCancelOnPress: () {

                                  },
                                  btnCancelText: "No",
                                  btnCancelColor: Colors.grey.shade500,
                                  btnCancelIcon: Icons.close, // You can add an icon if you like
                                  btnOkOnPress: () {
                                    userResponse=true;
                                    print("..true");
                                    // Action when "Yes" button is pressed
                                  },
                                  btnOkText: "Yes",
                                  btnOkColor: Colors.purple.shade200,
                                  btnOkIcon: Icons.check, // You can add an icon if you like
                                  buttonsTextStyle: TextStyle(
                                    fontSize: size.height * 0.02,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ).show().whenComplete(() async {

                                  if(userResponse){
                                    var box=GetStorage();
                                    box.remove("UserToken");
                                    box.remove("refreshToken");
                                    userModel.clear();
                                    userDetails.clear();
                                   await UserAccount().removeDeviceToken().then((value) {

                                     if(value.toString()=="success"){
                                       print("device token clear.......................................");
                                       Navigator.pushAndRemoveUntil(context, PageTransition(
                                           type: PageTransitionType.bottomToTop,
                                           duration: const Duration(milliseconds: 0),
                                           childCurrent: const Account(),
                                           child: const StorageStream()),(route) => false,);

                                     }
                                     else{
                                       UtilityFunctions().errorToast("Please try again");
                                     }


                                   });

                                  }

                                });
                              },
                              child: Row(
                                children: [

                                  Icon(CupertinoIcons.person,size: size.height*0.024,),
                                  SizedBox(width: size.width*0.033,),
                                  AutoSizeText("Log out",
                                    style: GoogleFonts.openSans(
                                        fontSize: size.height*0.019
                                    ),)
                                ],
                              ),
                            ),
                          ),



                        ],
                      ),
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
