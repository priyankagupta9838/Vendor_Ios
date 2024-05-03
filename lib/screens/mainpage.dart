import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Registration Pages/setyourProfile.dart';



class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding:  EdgeInsets.only(left: size.height*0.02,right: size.height*0.02,bottom: size.height*0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText("Choose service type", style:GoogleFonts.openSans(
                  fontSize: size.height*0.031,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(35, 29, 39, 1)
              ) ,),
              SizedBox(
                height: size.height*0.05,
              ),
              AutoSizeText("Select a option to continue", style:GoogleFonts.openSans(
                  fontSize: size.height*0.02,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(35, 29, 39, 1)
              ) ,),
              SizedBox(
                height: size.height*0.05,
              ),

              GestureDetector(
                onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context) =>  UserRegistrationProfile(selectedService: "Upcycle",),));
                },
                child: SizedBox(
                  height: size.height*0.22,
                  width: size.width*1,
                  child: Card(
                    elevation: 0,
                    shape:OutlineInputBorder(
                        borderRadius:BorderRadius.all(Radius.circular(size.height*0.03)),
                        borderSide: BorderSide(
                            color: Colors.black26,
                            width: size.height*0.0007
                        )
                    ),
                    color: const Color.fromRGBO(35, 29, 39, 0.05),
                    child: Column(

                     children: [
                           Padding(
                             padding:  EdgeInsets.all(size.height*0.02),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 AutoSizeText("Upcycle Services", style:GoogleFonts.openSans(
                                     fontSize: size.height*0.025,
                                     fontWeight: FontWeight.w600,
                                     color: const Color.fromRGBO(35, 29, 39, 1)
                                 ) ,),
                                 IconButton(onPressed: (){


                                 }, icon: Icon(Icons.arrow_forward_ios,size: size.height*0.02,))
                               ],
                             ),
                           ),
                       Padding(
                         padding:  EdgeInsets.only(left: size.height*0.02,right: size.height*0.02),
                         child: AutoSizeText("Transform,renew and create-Showcase your Upcycling skills", style:GoogleFonts.openSans(
                             fontSize: size.height*0.018,
                             fontWeight: FontWeight.w500,
                             color: const Color.fromRGBO(35, 29, 39, 1)
                         ) ,),
                       ),
                     ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height*0.03,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>  UserRegistrationProfile(selectedService: "Restoration",),));

                },
                child: SizedBox(
                  height: size.height*0.22,
                  width: size.width*1,
                  child: Card(
                    elevation: 0,
                    shape:OutlineInputBorder(
                        borderRadius:BorderRadius.all(Radius.circular(size.height*0.03)),
                        borderSide: BorderSide(
                            color: Colors.black26,
                            width: size.height*0.0007
                        )
                    ),
                    color: const Color.fromRGBO(35, 29, 39, 0.05),
                    child: Column(

                      children: [
                        Padding(
                          padding:  EdgeInsets.all(size.height*0.02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AutoSizeText("Restore Services", style:GoogleFonts.openSans(
                                  fontSize: size.height*0.025,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromRGBO(35, 29, 39, 1)
                              ) ,),
                              IconButton(onPressed: (){

                              }, icon: Icon(Icons.arrow_forward_ios,size: size.height*0.02,))
                            ],
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(left: size.height*0.02,right: size.height*0.02),
                          child: AutoSizeText("Revive the charm-Provide expert restoration services", style:GoogleFonts.openSans(
                              fontSize: size.height*0.018,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(35, 29, 39, 1)
                          ) ,),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),

    );
  }
}
