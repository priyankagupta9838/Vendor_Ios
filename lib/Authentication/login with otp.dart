import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vendor/Constraints.dart';
import '../Api/Authentication Api.dart';
import '../utilityfunctions.dart';
import 'SignUP-1.dart';
import 'constraints.dart';
import 'loginwithotpverification.dart';

class LogInPhoneNumber extends StatefulWidget {
  const LogInPhoneNumber({Key? key}) : super(key: key);

  @override
  State<LogInPhoneNumber> createState() => _LogInPhoneNumberState();
}

class _LogInPhoneNumberState extends State<LogInPhoneNumber> {
  TextEditingController phoneNumber=TextEditingController();
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
              // CircleAvatar(
              //   backgroundColor: Colors.purple,
              //   radius: size.height*0.04,
              //   backgroundImage: const AssetImage("assets/logo/download.png"),
              // ),
              SizedBox(
                height: size.height*0.03,
              ),
              SizedBox(
                child: Text("Log In",
                  style: TextStyle(
                      fontSize: size.height*0.028,
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
                    padding:  EdgeInsets.only(left: size.width*0.035),
                    child: SizedBox(
                      child: Text("Phone/Email",
                        style: TextStyle(
                            fontSize: size.height*0.017,
                            color: Colors.black54,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height*0.006,
                  ),
                  SizedBox(
                    child: Padding(
                      padding:  EdgeInsets.only(left:size.width*0.035,right:size.width*0.035),
                      child: TextField(
                        controller: phoneNumber,
                        inputFormatters: [ FilteringTextInputFormatter. allow(emailPassword),],
                        enableSuggestions: true,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: size.height*0.02,
                        ),
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email_outlined,size: size.height*0.022,),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                              borderSide: const BorderSide(
                                  color: Colors.black45,
                                  width: 1
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                                borderSide: const BorderSide(
                                    color: Colors.black,
                                    width: 1
                                )
                            ),
                            hintText: "Phone/Email",
                            contentPadding: EdgeInsets.all(size.height*0.01)
                        ),
                        textAlign: TextAlign.start,

                      ),
                    ),
                  ),

                  SizedBox(
                    height: size.height*0.055,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left:size.width*0.035,right:size.width*0.035),
                    child: InkWell(
                      onTap: () async {

                           if(phoneNumber.text.isNotEmpty){
                             await Authentication().loginWithOtp(phoneNumber.text.toString().trim()).then((value) {
                               if(value.toString()=="success"){
                                 totalSeconds=80;
                                 Navigator.push(context, PageTransition(
                                     type: PageTransitionType.fade,
                                     duration: const Duration(milliseconds: 400),
                                     childCurrent: const LogInPhoneNumber(),
                                     child:  LoginWithOtpVerification(userName: phoneNumber.text.toString().trim(),)));
                               }else{
                                 UtilityFunctions().errorToast( value.toString());
                               }
                             });

                           }
                           else{
                             UtilityFunctions().errorToast( "username can't be empty");
                           }

                        // Navigator.push(context, PageTransition(
                        //     type: PageTransitionType.fade,
                        //     duration: const Duration(milliseconds: 400),
                        //     childCurrent: const LogInPhoneNumber(),
                        //     child:  ResetOtpScreen(userName: phoneNumber.text.toString().trim(),)));
                        //


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
                            "Send OTP",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: size.height*0.022,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height*0.033,
                  ),
                 /* SizedBox(
                    height: size.height*0.035,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left:size.width*0.035,right:size.width*0.035),
                    child: InkWell(
                      onTap: (){

                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.032)),
                            border:Border.all(
                                color: Colors.black45,
                                width: 1
                            ),
                            color: Colors.white
                        ),
                        height: size.height*0.052,
                        width: size.width*0.93,
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: size.height*0.015,
                              backgroundColor: Colors.transparent,
                              backgroundImage: const AssetImage("assets/logo/google.png"),
                            ),
                            SizedBox(
                              width: size.width*0.02,
                            ),
                            Center(
                              child: Text(
                                "Sign Up with google",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: size.height*0.017,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height*0.022,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left:size.width*0.035,right:size.width*0.035),
                    child: InkWell(
                      onTap: (){

                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.032)),
                            border:Border.all(
                                color: const Color.fromRGBO(24, 119, 242, 1),
                                width: 1
                            ),
                            color: Colors.blue
                        ),
                        height: size.height*0.052,
                        width: size.width*0.93,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: size.height*0.015,
                              backgroundColor: Colors.transparent,
                              backgroundImage: const AssetImage("assets/logo/facebook.png"),
                            ),
                            SizedBox(
                              width: size.width*0.02,
                            ),
                            Center(
                              child:  Text(
                                "Sign Up with Facebook",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: size.height*0.018,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height*0.022,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left:size.width*0.035,right:size.width*0.035),
                    child: InkWell(
                      onTap: (){

                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.032)),
                            border:Border.all(
                                color: Colors.black45,
                               width: 1
                            ),
                            color: const Color.fromRGBO(0,0,1, 1)
                        ),
                        height: size.height*0.052,
                        width: size.width*0.93,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: size.height*0.017,
                              backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                              backgroundImage: const AssetImage("assets/logo/apple.png"),
                            ),
                            SizedBox(
                              width: size.width*0.02,
                            ),
                            Center(
                              child: Text(
                                "Sign Up with Apple",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: size.height*0.018,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),*/
                  SizedBox(
                    height: size.height*0.004,
                  ),
                  /*SizedBox(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                          return const SignUpPage();
                        },));
                      },
                      child: Text("Create Account",
                      style: TextStyle(
                        fontSize: size.height*0.02,
                        color: Colors.blue
                      ),),
                    ),
                  ),*/
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have account?",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: size.height*0.017
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            PageTransition(
                              child: const SignUpPage1(),
                              type: PageTransitionType.rightToLeftJoined,
                              duration: const Duration(milliseconds: 350),
                              childCurrent: const LogInPhoneNumber(),
                            ),
                          );
                        },
                        child: Text(
                          "Register",
                          style: GoogleFonts.openSans(
                            color: Colors.blue,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
