import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vendor/Authentication/resetPasswordWithEmail.dart';
import '../Api/Authentication Api.dart';
import '../Constraints.dart';
import '../NotificationSetup/helper_Notification.dart';
import '../StorageStream.dart';
import '../utilityfunctions.dart';
import 'SignUP-1.dart';
import 'constraints.dart';
import 'login with otp.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  bool hide=true;
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
                height: size.height*0.07,
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
                        controller: email,
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
                    height: size.height*0.02,
                  ),
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
                    height: size.height*0.01,
                  ),
                  SizedBox(
                    child: Padding(
                      padding: EdgeInsets.only(left:size.width*0.035,right:size.width*0.035),
                      child: TextField(
                        controller: password,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: size.height*0.02,
                        ),
                        obscureText: hide,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_outline,size: size.height*0.022,),
                            suffixIcon:
                            !hide
                                ?
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    hide=!hide;
                                  });
                                },
                                icon: Icon(Icons.remove_red_eye,size: size.height*0.022,))
                                :
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    hide=!hide;
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

                            hintText: "Password",
                            contentPadding: EdgeInsets.all(size.height*0.01)
                        ),
                        textAlign: TextAlign.start,

                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height*0.017,
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: size.width*0.035),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, PageTransition(
                            type: PageTransitionType.fade,
                            duration: const Duration(milliseconds: 300),
                            childCurrent: const LogInPage(),
                            child: const LogInPhoneNumber()));
                      },
                      child: SizedBox(
                        child: Text("Login with OTP",
                          style: TextStyle(
                              fontSize: size.height*0.017,
                              color: Colors.blue,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height*0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left:size.width*0.035,right:size.width*0.035),
                    child: InkWell(
                      onTap: () async {
                        if(email.text.isNotEmpty && password.text.isNotEmpty){
                          await Authentication().loginUser(email.text,password.text).then((value) async {
                            if(value=="success")
                            {
                              Navigator.pushReplacement(context, PageTransition(
                                  type: PageTransitionType.fade,
                                  duration: const Duration(milliseconds: 0),
                                  childCurrent: const LogInPage(),
                                  child: const StorageStream()));

                              await NotificationServices().getToken().then((value) async {
                                if(value!.isNotEmpty){
                                  await Authentication().sendDeviceToken(value).then((value2) {
                                    if(value2=="success"){
                                      print("Device token is : $value");
                                    }
                                    else{
                                      print("else condition${value2.toString()}");
                                    }

                                  });
                                }
                              });



                            }
                            else if(value=="Server Error.")
                            {
                              UtilityFunctions().errorToast( "Some server error occurred");
                            }

                            else{
                              UtilityFunctions().errorToast( value.toString());
                            }

                          });
                        }
                        else{
                          UtilityFunctions().errorToast( "Please provide all details.");
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Center(
                              child: SizedBox(
                                height: size.height*0.03,
                                width: size.height*0.03,
                                child: const CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        )
                            :
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Center(
                              child: AutoSizeText(
                                "Log In",
                                style: GoogleFonts.openSans(
                                    color: Colors.white,
                                    fontSize: size.height*0.025,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height*0.033,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.push(context, PageTransition(
                              type: PageTransitionType.fade,
                              duration: const Duration(milliseconds: 300),
                              childCurrent: const LogInPage(),
                              child: const ResetPasswordWithEmail()));

                        },
                        child: AutoSizeText("Forgot Your Password ?",
                          style:TextStyle(
                              fontSize: size.height*0.017,
                              fontWeight: FontWeight.w500,
                              color: Colors.black
                          ) ,),
                      )
                    ],
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

                /*  SizedBox(
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
                              type: PageTransitionType.fade,
                              duration: const Duration(milliseconds: 350),
                              childCurrent: const LogInPage(),
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
