
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import '../homepages/home.dart';
import 'constraints.dart';

class LogInOtpScreen extends StatefulWidget {
  const LogInOtpScreen({Key? key}) : super(key: key);

  @override
  State<LogInOtpScreen> createState() => _LogInOtpScreenState();
}

class _LogInOtpScreenState extends State<LogInOtpScreen> {
  TextEditingController digit1=TextEditingController();
  TextEditingController digit2=TextEditingController();
  TextEditingController digit3=TextEditingController();
  TextEditingController digit4=TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: size.height*1,
        width: size.width*1,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: size.height*0.08,
              ),
              Container(
                height: size.height*0.1,
                width: size.width*0.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(size.height*0.03)),
                    image: const DecorationImage(
                        image: AssetImage("assets/logo/download.png"),
                        fit: BoxFit.fill
                    )
                ),
              ),
             /* CircleAvatar(
                backgroundColor: Colors.purple,
                radius: size.height*0.04,
                backgroundImage: const AssetImage("assets/logo/download.png"),
              ),*/
              SizedBox(
                height: size.height*0.055,
              ),
              SizedBox(
                child: Text("Log In",
                  style: TextStyle(
                      fontSize: size.height*0.024,
                      color: Colors.black,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ),
              SizedBox(
                height: size.height*0.052,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: size.width*0.05),

                    child: SizedBox(
                      child: AutoSizeText(
                        "OTP Verification",
                        style: GoogleFonts.openSans(
                            fontSize: size.height*0.016,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height*0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: size.height*0.063,
                        width: size.height*0.063,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                                color: Colors.black87,
                                width: 1
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.016),
                            )
                        ),
                        child: Center(
                          child: TextField(
                            controller: digit1,
                            maxLength: 1,
                            enableSuggestions: false,
                            autofocus: true,
                            style: GoogleFonts.openSans(
                                color: Colors.black26,
                                fontSize: size.height*0.026,
                                fontWeight: FontWeight.w600
                            ),
                            textAlign: TextAlign.center,
                            keyboardType:  TextInputType.number,
                            decoration:   InputDecoration(
                                counter: const Offstage(),
                                contentPadding: EdgeInsets.all(size.height*0.02),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: size.height*0.063,
                        width: size.height*0.063,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                                color: Colors.black87,
                                width: 1
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.016),
                            )
                        ),
                        child: Center(
                          child: TextField(
                            controller: digit2,
                            maxLength: 1,
                            style: GoogleFonts.openSans(
                                color: Colors.black26,
                                fontSize: size.height*0.026,
                                fontWeight: FontWeight.w600
                            ),
                            keyboardType:  TextInputType.number,
                            decoration:   InputDecoration(
                                counter: Offstage(),
                                contentPadding: EdgeInsets.all(size.height*0.02),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: size.height*0.063,
                        width: size.height*0.063,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                                color: Colors.black87,
                                width: 1
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.016),
                            )
                        ),
                        child: Center(
                          child: TextField(
                            controller: digit3,
                            maxLength: 1,
                            style: GoogleFonts.openSans(
                                color: Colors.black26,
                                fontSize: size.height*0.026,
                                fontWeight: FontWeight.w600
                            ),
                            keyboardType:  TextInputType.number,
                            decoration:   InputDecoration(
                                counter: const Offstage(),
                                contentPadding: EdgeInsets.all(size.height*0.02),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: size.height*0.063,
                        width: size.height*0.063,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                                color: Colors.black87,
                                width: 1
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.016),
                            )
                        ),
                        child: Center(
                          child: TextField(
                            controller: digit4,
                            style: GoogleFonts.openSans(
                                color: Colors.black26,
                                fontSize: size.height*0.026,
                                fontWeight: FontWeight.w600
                            ),
                            maxLength: 1,
                            keyboardType:  TextInputType.number,
                            decoration:   InputDecoration(
                                counter: const Offstage(),
                                contentPadding: EdgeInsets.all(size.height*0.02),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: size.height*0.012,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't receive ?",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: size.height*0.014
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                         /* Navigator.pushReplacement(
                            context,
                            PageTransition(
                              child: const LogInPhoneNumber(),
                              type: PageTransitionType.fade,
                              duration: const Duration(milliseconds: 400),
                              childCurrent: const LogInOtpScreen(),
                            ),
                          );*/
                        },
                        child: Text(
                          "Send Again",
                          style: GoogleFonts.openSans(
                              color: Colors.blue,
                              fontWeight: FontWeight.w800,
                              fontSize: size.height*0.014
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height*0.058,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: size.height*0.33,
                      width: size.width*0.75,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/logo/otp-image.png"),
                              fit: BoxFit.contain
                          )
                      ),
                    ),
                  ),

                  SizedBox(
                    height: size.height*0.06,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left:size.width*0.035,right:size.width*0.035),
                    child: InkWell(
                      onTap: () async {
                        Navigator.pushReplacement(
                          context,
                          PageTransition(
                            child: const HomePage(),
                            type: PageTransitionType.fade,
                            duration: const Duration(milliseconds: 400),
                            childCurrent: const LogInOtpScreen(),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.032)),
                            color: buttonColor
                        ),
                        height: size.height*0.051,
                        width: size.width*0.93,
                        child: Center(
                          child: Text(
                            "Submit",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: size.height*0.02,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
