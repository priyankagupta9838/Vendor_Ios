/*import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vendor/Registration%20Pages/setUpYourAccountDetails_2.dart';

import '../utilityfunctions.dart';



class AccountDetail1 extends StatefulWidget {
  const AccountDetail1({super.key});

  @override
  State<AccountDetail1> createState() => _AccountDetail1State();
}

class _AccountDetail1State extends State<AccountDetail1> {
  TextEditingController nameController=TextEditingController();
  TextEditingController accountNumController=TextEditingController();
  TextEditingController bankController=TextEditingController();
  TextEditingController cityController=TextEditingController();
  TextEditingController branchController=TextEditingController();
  TextEditingController ifscController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height*1,
        width: size.width*1,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: size.height*0.06,),
              Container(
                color:  const Color.fromRGBO(247, 244, 249, 1),
                height: size.height*0.06,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: const Icon(CupertinoIcons.arrow_left),

                    ),
                    AutoSizeText("Account Details",

                      style:GoogleFonts.openSans(
                          color: Colors.black,
                          fontSize:  size.height*0.022,
                          fontWeight: FontWeight.w600
                      ) ,
                    ),
                    SizedBox(
                      width: size.width*0.2,
                    )
                  ],
                ),

              ),

              Padding(
                padding:  EdgeInsets.only(left:  size.height*0.018,right:  size.height*0.018,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height*0.02,
                    ),
                    AutoSizeText("Account Holder Name *",
                      style:GoogleFonts.openSans(
                          color: Colors.black,
                          fontSize:  size.height*0.018,
                          fontWeight: FontWeight.w500
                      ) ,
                    ),
                    SizedBox(
                      height: size.height*0.01,
                    ),
                    Container(
                      height: size.height*0.056,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Colors.black)
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: size.height*0.02),
                        child: TextField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter here",
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height*0.02,
                    ),
                    AutoSizeText("Account Number*",
                      style:GoogleFonts.openSans(
                          color: Colors.black,
                          fontSize:  size.height*0.018,
                          fontWeight: FontWeight.w500
                      ) ,
                    ),
                    SizedBox(
                      height: size.height*0.01,
                    ),
                    Container(
                      height: size.height*0.056,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Colors.black)
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: size.height*0.02),
                        child: TextField(
                          controller: accountNumController,
                          decoration: const InputDecoration(

                            border: InputBorder.none,
                            hintText: "Enter here",
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height*0.02,
                    ),
                    AutoSizeText("Bank Name *",
                      style:GoogleFonts.openSans(
                          color: Colors.black,
                          fontSize:  size.height*0.018,
                          fontWeight: FontWeight.w500
                      ) ,
                    ),
                    SizedBox(
                      height: size.height*0.01,
                    ),
                    Container(
                      height: size.height*0.056,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Colors.black)
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: size.height*0.02),
                        child:  TextField(
                          controller: bankController,
                          decoration: const InputDecoration(

                            border: InputBorder.none,


                            hintText: "Select here",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height*0.02,
                    ),
                    AutoSizeText("City*",
                      style:GoogleFonts.openSans(
                          color: Colors.black,
                          fontSize:  size.height*0.018,
                          fontWeight: FontWeight.w500
                      ) ,
                    ),
                    SizedBox(
                      height: size.height*0.01,
                    ),
                    Container(
                      height: size.height*0.056,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Colors.black)
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: size.height*0.02),
                        child:  TextField(
                          controller: cityController,
                          decoration: const InputDecoration(

                            border: InputBorder.none,


                            hintText: "Enter here",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height*0.02,
                    ),
                    AutoSizeText("Branch*",
                      style:GoogleFonts.openSans(
                          color: Colors.black,
                          fontSize:  size.height*0.018,
                          fontWeight: FontWeight.w500
                      ) ,
                    ),
                    SizedBox(
                      height: size.height*0.01,
                    ),
                    Container(
                      height: size.height*0.056,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Colors.black)
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: size.height*0.02),
                        child: TextField(
                          controller: branchController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter here",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height*0.02,
                    ),
                    AutoSizeText("IFSC Code*",
                      style:GoogleFonts.openSans(
                          color: Colors.black,
                          fontSize:  size.height*0.018,
                          fontWeight: FontWeight.w500
                      ) ,
                    ),
                    SizedBox(
                      height: size.height*0.01,
                    ),
                    Container(
                      height: size.height*0.056,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Colors.black)
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: size.height*0.02),
                        child:  TextField(
                          controller: ifscController,
                          decoration: const InputDecoration(

                            border: InputBorder.none,


                            hintText: "Enter here",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height*0.06,
                    ),

                    SizedBox(
                      height: size.height*0.052,
                      width: size.width*0.95,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(size.height*0.01))),
                            backgroundColor: const Color.fromRGBO(29, 27, 32, 0.12)),
                        onPressed: () {
                          if(nameController.text.isNotEmpty && accountNumController.text.isNotEmpty && bankController.text.isNotEmpty && cityController.text.isNotEmpty && branchController.text.isNotEmpty && ifscController.text.isNotEmpty ){
                            Navigator.push(context, PageTransition(
                                type: PageTransitionType.rightToLeft,
                                duration: const Duration(milliseconds: 400),
                                childCurrent: const AccountDetail1(),
                                child:  AccountDetails2( accountHolderName: nameController.text.toString(),
                                  accountNumber: accountNumController.text.toString(),
                                  bankName: bankController.text.toString(),
                                  cityName:cityController.text.toString(),
                                  branchName: branchController.text.toString(),
                                  ifscCode: ifscController.text.toString(),)));
                          }
                          else{
                            UtilityFunctions().errorScreen(context, "All fields are required.");
                          }


                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AutoSizeText("Next",
                              style: GoogleFonts.openSans(
                                  color: Colors.white,
                                  fontSize: size.height*0.022,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                            SizedBox(
                              width: size.width*0.05,
                            ),
                            const Icon(CupertinoIcons.arrow_right,color: Colors.white,),

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
    ) ;

  }
}*/
