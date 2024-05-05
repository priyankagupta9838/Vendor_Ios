import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vendor/Api/Authentication%20Api.dart';
import 'package:vendor/Authentication/resetPasswordWithEmail.dart';
import 'package:vendor/utilityfunctions.dart';
import 'constraints.dart';
import 'login.dart';

class ProvideResetPassword extends StatefulWidget {
  ProvideResetPassword({Key? key, required this.otp, required this.username})
      : super(key: key);
  String otp;
  String username;

  @override
  State<ProvideResetPassword> createState() => _ProvideResetPasswordState();
}

class _ProvideResetPasswordState extends State<ProvideResetPassword> {
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  bool buttonClicked=false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: size.height * 1,
        width: size.width * 1,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.08,
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
                radius: size.height * 0.04,
                backgroundImage: const AssetImage("assets/logo/download.png"),
              ),*/
              SizedBox(
                height: size.height * 0.03,
              ),
              SizedBox(
                child: Text(
                  "Reset Password",
                  style: TextStyle(
                      fontSize: size.height * 0.028,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: size.height * 0.045,
              ),
              SizedBox(
                width: size.width * 0.7,
                child: AutoSizeText(
                  "If there is an account associated with this email address you will receive a Link to reset email. ",
                  style: GoogleFonts.openSans(fontSize: size.height * 0.014),
                ),
              ),
              SizedBox(
                height: size.height * 0.052,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.035),
                    child: SizedBox(
                      child: Text(
                        "Password",
                        style: TextStyle(
                            fontSize: size.height * 0.017,
                            color: Colors.black54,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.006,
                  ),
                  SizedBox(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.035, right: size.width * 0.035),
                      child: TextField(
                        controller: password,
                        enableSuggestions: true,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: size.height * 0.02,
                        ),
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              size: size.height * 0.022,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(size.width * 0.02)),
                              borderSide: const BorderSide(
                                  color: Colors.black45, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(size.width * 0.02)),
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 1)),
                            hintText: "Password",
                            contentPadding: EdgeInsets.all(size.height * 0.01)),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.035),
                    child: SizedBox(
                      child: Text(
                        "Confirm Password",
                        style: TextStyle(
                            fontSize: size.height * 0.017,
                            color: Colors.black54,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.006,
                  ),
                  SizedBox(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.035, right: size.width * 0.035),
                      child: TextField(
                        controller: confirmPassword,
                        enableSuggestions: true,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: size.height * 0.02,
                        ),
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              size: size.height * 0.022,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(size.width * 0.02)),
                              borderSide: const BorderSide(
                                  color: Colors.black45, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(size.width * 0.02)),
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 1)),
                            hintText: "Confirm Password",
                            contentPadding: EdgeInsets.all(size.height * 0.01)),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  SizedBox(
                    width: size.width*1,
                    child: Padding(
                      padding:  EdgeInsets.only(right: size.width*0.1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      duration: const Duration(milliseconds: 400),
                                      childCurrent: ProvideResetPassword(
                                          otp: "", username: ""),
                                      child: const LogInPage()));
                            },
                            child: AutoSizeText(
                              "Try to Login ?",
                              style: TextStyle(
                                  fontSize: size.height * 0.017,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.27,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.035, right: size.width * 0.035),
                    child: InkWell(
                      onTap: () async {
                        if (password.text.isEmpty ||
                            confirmPassword.text.isEmpty) {
                          UtilityFunctions().errorToast(
                               "Provide your new password");
                        } else if (password.text != confirmPassword.text) {
                          UtilityFunctions().errorToast(
                               "Both password must be same");
                        } else if (password.text.isNotEmpty &&
                            confirmPassword.text.isNotEmpty) {
                          buttonClicked=true;
                          setState(() {

                          });
                          Authentication()
                              .newPassword(
                                  password.text, widget.otp, widget.username)
                              .then((value) {
                            if (value == "success") {
                              // Go to login page
                              buttonClicked=false;
                              setState(() {

                              });
                              UtilityFunctions().successToast( "Password updated successfully");
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      duration:
                                      const Duration(milliseconds: 300),
                                      childCurrent: ProvideResetPassword(
                                        otp: '',
                                        username: '',
                                      ),
                                      child: const LogInPage()));

                            } else {
                              if (value == "Incorrect OTP or OTP expired.") {
                                buttonClicked=false;
                                setState(() {

                                });
                                UtilityFunctions()
                                    .errorToast(
                                         "$value please try again");
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          duration:
                                              const Duration(milliseconds: 300),
                                          childCurrent: ProvideResetPassword(
                                              otp: "", username: ""),
                                          child:
                                              const ResetPasswordWithEmail()));

                              } else {
                                buttonClicked=false;
                                setState(() {

                                });
                                UtilityFunctions().errorToast( value);
                              }
                            }
                          });
                        } else {
                          buttonClicked=false;
                          setState(() {

                          });
                          UtilityFunctions().errorToast(
                               "Something went wrong please try again");
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(size.width * 0.032)),
                            color: buttonColor),
                        height: size.height * 0.051,
                        width: size.width * 0.93,
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
                          child: Text(
                            "Reset Password",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: size.height * 0.02,
                                fontWeight: FontWeight.w600),
                          ),
                        )




                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height*0.03,
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
