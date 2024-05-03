import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import '../Constraints.dart';
import '../utilityfunctions.dart';
import 'SignUp-2.dart';
import 'constraints.dart';
import 'login.dart';

class SignUpPage1 extends StatefulWidget {
  const SignUpPage1({Key? key}) : super(key: key);

  @override
  State<SignUpPage1> createState() => _SignUpPage1State();
}

class _SignUpPage1State extends State<SignUpPage1> {
  TextEditingController email=TextEditingController();
  TextEditingController name=TextEditingController();
  final pattern = r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$|^[0-9]{10}$';

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
            /*  CircleAvatar(
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
                      child: Text("Name",
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
                        controller: name,
                        inputFormatters: [ FilteringTextInputFormatter. allow(RegExp(r'[A-Za-z- ]')),],
                        enableSuggestions: true,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: size.height*0.02,
                        ),
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person,size: size.height*0.022,),
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
                            hintText: "Name",
                            contentPadding: EdgeInsets.all(size.height*0.01)
                        ),
                        textAlign: TextAlign.start,

                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height*0.02,
                  ),
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
                    height: size.height*0.01,
                  ),
                  SizedBox(
                    child: Padding(
                      padding: EdgeInsets.only(left:size.width*0.035,right:size.width*0.035),
                      child: TextField(
                        controller: email,
                        inputFormatters: [ FilteringTextInputFormatter. allow(emailPassword),],
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
                                )
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
                    height: size.height*0.035,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left:size.width*0.035,right:size.width*0.035),
                    child: InkWell(
                      onTap: () async {
                        if(email.text.isNotEmpty && name.text.isNotEmpty){

                          final regExp = RegExp(pattern);
                          if (!regExp.hasMatch(email.text)) {
                            UtilityFunctions().errorToast("Please provide valid phone number or email as username.");
                          }
                          else{
                            Navigator.push(context, PageTransition(
                                type: PageTransitionType.fade,
                                duration:  const Duration(milliseconds: 400),
                                childCurrent:  const SignUpPage1(),
                                child:SignUpPage2(email:email.text.toString(),name:name.text.toString().trim())));
                          }


                        }
                        else{

                          UtilityFunctions().errorToast("Please provide all details.");
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
                                fontSize: size.height*0.022,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height*0.06,
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

                  /*SizedBox(
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
                              child: const  LogInPage(),
                              type: PageTransitionType.fade,
                              duration: const Duration(milliseconds: 400),
                              childCurrent: const SignUpPage1(),
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
