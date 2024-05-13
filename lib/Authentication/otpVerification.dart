
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:vendor/Authentication/timer.dart';
import '../Api/Authentication Api.dart';
import '../Constraints.dart';
import '../StateManagement/PageBloc.dart';
import '../StateManagement/PageEvent.dart';
import '../StateManagement/PageState.dart';
import '../screens/mainpage.dart';
import '../utilityfunctions.dart';
import 'constraints.dart';


class OtpVerification extends StatefulWidget {
  OtpVerification({Key? key,required this.name,required this.userName,required this.password,required this.confirmPassword}) : super(key: key);
  String name;
  String userName;
String password;
String confirmPassword;

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {

  TextEditingController userOtp=TextEditingController();


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
            crossAxisAlignment: CrossAxisAlignment.center,
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
              SizedBox(
                height: size.height*0.055,
              ),
              SizedBox(
                child: Text("OTP Verification",
                  style: TextStyle(
                      fontSize: size.height*0.024,
                      color: Colors.black,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ),
              SizedBox(
                height: size.height*0.025,
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: size.width*1,
                  child: Center(
                    child: AutoSizeText(
                      "Otp created and sent to you on ",
                      style: GoogleFonts.openSans(
                          fontSize: size.height*0.018,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: size.width*1,
                  child: Center(
                    child: AutoSizeText(
                      widget.userName,
                      style: GoogleFonts.openSans(
                          fontSize: size.height*0.018,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height*0.014,
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: size.height*0.03,
                  width: size.width*1,
                  child:  const Center(
                      child: CountDownTimer()
                  ),
                ),
              ),
              SizedBox(
                width: size.width*1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    SizedBox(
                      height: size.height*0.03,
                    ),
                    SizedBox(
                      height: size.height * 0.07,
                      width: size.width * 0.75,
                      child: PinCodeTextField(
                        controller: userOtp,
                        appContext: context,
                        length: 4,
                        obscureText: false,
                        autoFocus: true,
                        enablePinAutofill: true,
                        animationType: AnimationType.fade,
                        cursorColor: Colors.black,
                        textStyle: GoogleFonts.openSans(
                            color: Colors.black38
                        ),
                        pinTheme: PinTheme(
                          activeColor: Colors.black87,
                          selectedColor: Colors.black87,
                          disabledColor: Colors.black87,
                          inactiveColor: Colors.black87,
                          selectedFillColor: Colors.white,
                          inactiveFillColor: Colors.white,
                          shape: PinCodeFieldShape.box,

                          borderRadius: BorderRadius.all(Radius.circular(size.width*0.016)),
                          fieldHeight: size.height*0.063,
                          fieldWidth: size.height*0.063,
                          activeFillColor: Colors.white,
                        ),
                        animationDuration: const Duration(milliseconds: 300),
                        backgroundColor: Colors.white,
                        enableActiveFill: true,
                        // errorAnimationController: errorController,

                        onCompleted: (v) {
                          print("Completed");
                        },
                        onChanged: (value) {
                          print(value);
                          setState(() {

                          });
                        },
                        beforeTextPaste: (text) {
                          print("Allowing to paste $text");
                          return true;
                        },
                      ),
                    ),
                    SizedBox(
                      height: size.height*0.015,
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
                        BlocBuilder<AddTimerBlo,AddTimerState>(builder: (context, state) {
                          return TextButton(
                            onPressed: () async {
                              userOtp.text="";
                              setState(() {

                              });
                              await Authentication().signUpNewUser(widget.name,widget.userName,widget.password.toString().trim(),widget.confirmPassword.toString().trim()).then((value) async {
                                if (value == "success") {
                                  totalSeconds=80;
                                  BlocProvider.of<AddTimerBlo>(context).add(UpdateTimerEvent());
                                  // if(userOtp.text.isNotEmpty ){
                                  // //  String userOtp=digit1.text.toString()+digit2.text.toString()+digit3.text.toString()+digit4.text.toString();
                                  //   await Authentication().otpVerification(userOtp.text).then((value) {
                                  //     if(value=="success"){
                                  //
                                  //       Navigator.pushReplacement(
                                  //         context,
                                  //         PageTransition(
                                  //           child: const MainHomePage(),
                                  //           type: PageTransitionType.fade,
                                  //           duration: const Duration(milliseconds: 400),
                                  //           childCurrent: OtpVerification(userName: '', password: '', confirmPassword: '', name: '',),
                                  //         ),
                                  //       );
                                  //
                                  //     }
                                  //     else
                                  //     {
                                  //       UtilityFunctions().errorToast("Something went wrong please try gain.");
                                  //
                                  //     }
                                  //   });
                                  // }
                                  // else{
                                  //   UtilityFunctions().errorToast( "Please provide complete OTP.");
                                  // }
                                }
                                else {
                                  UtilityFunctions().errorToast(
                                      "Something went wrong please try gain.");
                                }
                              });


                            },
                            child: Text(
                              "Send Again",
                              style: GoogleFonts.openSans(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w800,
                                  fontSize: size.height*0.014
                              ),
                            ),
                          );
                        })
                        ],
                    ),
                    SizedBox(
                      height: size.height*0.038,
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
                      height: size.height*0.04,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left:size.width*0.035,right:size.width*0.035),
                      child: InkWell(
                        onTap: () async {

                          if(userOtp.text.isNotEmpty){
                            //String userOtp=digit1.text.toString()+digit2.text.toString()+digit3.text.toString()+digit4.text.toString();
                            await Authentication().otpVerification(userOtp.text).then((value) {
                              if(value=="success"){

                                Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                    child: const MainHomePage(),
                                    type: PageTransitionType.fade,
                                    duration: const Duration(milliseconds: 400),
                                    childCurrent: OtpVerification(userName: '', password: '', confirmPassword: '', name: '',),
                                  ),
                                );

                              }
                              else
                              {
                                UtilityFunctions().errorToast("Something went wrong please try gain.");

                              }
                            });
                          }
                          else{
                            UtilityFunctions().errorToast( "Please provide complete OTP.");
                          }


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
                              "Continue",
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
