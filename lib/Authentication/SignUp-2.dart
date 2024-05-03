import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Account Related/termsAndCondition.dart';
import '../Api/Authentication Api.dart';
import '../Constraints.dart';
import '../utilityfunctions.dart';
import 'constraints.dart';
import 'login.dart';
import 'otpVerification.dart';

class SignUpPage2 extends StatefulWidget {

  const SignUpPage2({Key? key, required this.email,required this.name});
  final String email;
  final String name;

  @override
  State<SignUpPage2> createState() => _SignUpPage2State();
}

class _SignUpPage2State extends State<SignUpPage2> {
  TextEditingController password=TextEditingController();
  TextEditingController confirmPassword=TextEditingController();
  bool termsAndConditions=false;
  bool hide1=true;
  bool hide2=true;
  bool buttonClicked=false;
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
              /*CircleAvatar(
                backgroundColor: Colors.purple,
                radius: size.height*0.04,
                backgroundImage: const AssetImage("assets/logo/download.png"),
              ),*/
              SizedBox(
                height: size.height*0.03,
              ),
              SizedBox(
                child: Text("Register",
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
                      child: Text("Password",
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
                        controller: password,
                        obscureText: hide2,
                        enableSuggestions: true,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: size.height*0.02,
                        ),
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_outline,size: size.height*0.022,),
                            suffixIcon:
                            !hide2
                                ?
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    hide2=!hide2;
                                  });
                                },
                                icon: Icon(Icons.remove_red_eye,size: size.height*0.022,))
                                :
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    hide2=!hide2;
                                  });
                                },
                                icon: Icon(Icons.visibility_off,size: size.height*0.022,)),
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
                            hintText: "Password",
                            contentPadding: EdgeInsets.all(size.height*0.01)
                        ),
                        textAlign: TextAlign.start,

                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height*0.025,
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: size.width*0.035),
                    child: SizedBox(
                      child: Text("Confirm Password",
                        style: TextStyle(
                            fontSize: size.height*0.017,
                            color: Colors.black54,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height*0.01,
                  ),
                  SizedBox(
                    child: Padding(
                      padding: EdgeInsets.only(left:size.width*0.035,right:size.width*0.035),
                      child: TextField(
                        controller: confirmPassword,
                        obscureText: hide1,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: size.height*0.02,
                        ),
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_outline,size: size.height*0.022,),
                            suffixIcon:
                            !hide1
                                ?
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    hide1=!hide1;
                                  });
                                },
                                icon: Icon(Icons.remove_red_eye,size: size.height*0.022,))
                                :
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    hide1=!hide1;
                                  });
                                },
                                icon: Icon(Icons.visibility_off,size: size.height*0.022,)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                                borderSide: const BorderSide(
                                    color: Colors.black45,
                                    width: 1
                                )
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                                borderSide: const BorderSide(
                                    color: Colors.black,
                                    width: 1
                                )
                            ),

                            hintText: "Confirm Password",
                            contentPadding: EdgeInsets.all(size.height*0.01)
                        ),
                        textAlign: TextAlign.start,

                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height*0.025,
                  ),
                  SizedBox(
                    height: size.height*0.062,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: size.width*0.038,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              termsAndConditions=!termsAndConditions;
                            });
                          },
                          child: Container(
                            height: size.height*0.024,
                            width: size.width*0.045,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(size.height*0.007)),
                                border: Border.all(
                                    color: Colors.black87,
                                    style: BorderStyle.solid,
                                    width: 1
                                )
                            ),
                            child:
                            termsAndConditions
                                ?
                            Icon(Icons.check,size: size.height*0.020,color: Colors.green,)
                                :
                            const SizedBox()
                            ,
                          ),
                        ),
                        SizedBox(
                          width: size.width*0.029,
                        ),
                        SizedBox(
                          //height: size.height*0.062,
                          width: size.width*0.85,
                          child: Row(
                            children: [
                              AutoSizeText("I agree to the ",
                                style: GoogleFonts.openSans(
                                    fontSize: size.height*0.018,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                      child: const TermsAndCondition(),
                                      type: PageTransitionType.fade,
                                      duration: const Duration(milliseconds: 400),
                                      childCurrent:  const SignUpPage2(email: '', name: '',),
                                    ),
                                  );
                                },
                                child: AutoSizeText(" T&C",
                                  style: GoogleFonts.openSans(
                                      fontSize: size.height*0.018,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.blue
                                  ),
                                ),
                              ),
                              AutoSizeText(" and ",
                                style: GoogleFonts.openSans(
                                    fontSize: size.height*0.018,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  if (!await launchUrl(Uri.parse("https://mykanjee.in/privacy-policy/"))) {
                                  throw Exception('Could not launch');
                                  }


                                  // Navigator.push(
                                  //   context,
                                  //   PageTransition(
                                  //     child: const PrivacyAndPolicy(),
                                  //     type: PageTransitionType.fade,
                                  //     duration: const Duration(milliseconds: 400),
                                  //     childCurrent:  const SignUpPage2(email: '', name: '',),
                                  //   ),
                                  // );
                                },
                                child: AutoSizeText(" privacy & policy",
                                  style: GoogleFonts.openSans(
                                      fontSize: size.height*0.018,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.blue
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height*0.035,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left:size.width*0.035,right:size.width*0.035),
                    child: InkWell(
                      onTap: () async {

                        if(password.text.isNotEmpty && confirmPassword.text==password.text && password.text.length<6){
                          UtilityFunctions().errorToast("Password must be at least 6 character.");
                        }
                        else if(termsAndConditions && password.text.isNotEmpty && confirmPassword.text.isNotEmpty && password.text==confirmPassword.text)
                        {

                          buttonClicked=true;
                          setState(() {

                          });
                          await Authentication().signUpNewUser(widget.name,widget.email,password.text.toString().trim(),confirmPassword.text.toString().trim()).then((value) {
                            if(value=="success") {
                              totalSeconds=80;
                              Navigator.pushReplacement(
                                context,
                                PageTransition(
                                  child: OtpVerification(
                                    name:widget.name,
                                    userName: widget.email, password: password.text.toString().trim(), confirmPassword:confirmPassword.text.toString().trim()),
                                  type: PageTransitionType.fade,
                                  duration: const Duration(milliseconds: 400),
                                  childCurrent: const SignUpPage2(
                                    email: '', name: '',),
                                ),
                              );
                            }
                            else if(value=="Username already registered. Try logging in."){
                              buttonClicked=false;
                              setState(() {

                              });
                              UtilityFunctions().errorToast("Username already registered. Try logging in.");
                              Navigator.pop(context);
                               /* Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                    child:  const LogInPage(),
                                    type: PageTransitionType.fade,
                                    duration: const Duration(milliseconds: 400),
                                    childCurrent:  const SignUpPage2(email: '', name: '',),
                                  ),
                                );*/

                            }
                            else if(value=="error")
                            {
                              UtilityFunctions().errorToast("Bad request");
                              buttonClicked=false;
                              setState(() {

                              });

                            }
                          });
                        }
                        else if(password.text.isEmpty || confirmPassword.text.isEmpty){
                          UtilityFunctions().errorToast("Please provide all details.");

                        }
                        else if(password.text!=confirmPassword.text){
                          UtilityFunctions().errorToast("Both Password must be same.");
                        }
                        else{
                          UtilityFunctions().errorToast("Please accept terms and conditions.");
                        }


                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.032)),
                            color: buttonColor
                        ),
                        height: size.height*0.051,
                        width: size.width*0.93,
                        child:  buttonClicked
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
                          child: AutoSizeText("Continue",
                              style: GoogleFonts.openSans(
                                  color: Colors.white,
                                  fontSize: size.height*0.02,
                                  fontWeight: FontWeight.w500
                              )
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height*0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: size.width*0.4,
                        child: Divider(
                          color: Colors.black,
                          height: MediaQuery.of(context).size.height * 0.01,
                          thickness: MediaQuery.of(context).size.height * 0.0028,
                          endIndent: 3,
                          indent: 3,
                        ),
                      ),
                      AutoSizeText("or",style: GoogleFonts.openSans(
                        color: Colors.black,
                        fontSize: size.height*0.015,
                        fontWeight: FontWeight.w800,
                      ),),
                      SizedBox(

                        width: size.width*0.4,
                        child: Divider(
                          color: Colors.black,
                          height: MediaQuery.of(context).size.height * 0.01,
                          thickness: MediaQuery.of(context).size.height * 0.0028,
                          endIndent: 3,
                          indent: 3,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: size.height*0.02,
                  ),
                  /*Padding(
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
                  ),
                  SizedBox(
                    height: size.height*0.004,
                  ),*/
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
                        "Already have account?",
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
                              child: const LogInPage(),
                              type: PageTransitionType.fade,
                              duration: const Duration(milliseconds: 400),
                              childCurrent:  const SignUpPage2(email:"", name: "",),
                            ),
                          );
                        },
                        child: Text(
                          "Log In",
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
