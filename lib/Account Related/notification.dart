import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}
const textColor =  Color.fromRGBO(28, 28, 30, 1);

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height*1,
        width: size.width*1,
        child: Column(
          children: [
            SizedBox(
              height: size.height*0.065,
            ),

            Container(
              color: const Color.fromRGBO(247, 244, 249, 1),
              height: size.height*0.07,
              child: Row(
                children: [
                  IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon: const Icon(CupertinoIcons.arrow_left,color: Colors.black,) ),
                  SizedBox(width: size.width*0.2,),
                  AutoSizeText("Notifications",style: GoogleFonts.openSans(
                      color: textColor,
                      fontWeight: FontWeight.w600,
                      fontSize: size.height*0.024

                  ),),


                ],
              ),
            ),

            SizedBox(
              height: size.height*0.86,
              width: size.width*1,
              child: ListView.builder(
                padding:  EdgeInsets.all(size.height*0.01),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return SizedBox(

                    child: Card(
                      color: Colors.white54,
                      child: Padding(
                        padding:  EdgeInsets.all(size.height*0.01),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AutoSizeText("Today",style: GoogleFonts.openSans(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: size.height*0.018
                                ),),
                                AutoSizeText("1/2/2024",style: GoogleFonts.openSans(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: size.height*0.018
                                ),),
                              ],
                            ),
                            SizedBox(
                              height: size.height*0.01,
                            ),
                            AutoSizeText("Just in time for summer, we've added the hottest Just in time for summer, we've added the hottest Just in time for summer, we've added the hottest Just in time for summer, we've added the hottest Just in time for summer, we've added the hottest...",style: GoogleFonts.openSans(
                                color: Colors.black87,
                                fontWeight: FontWeight.w400,
                                fontSize: size.height*0.018
                            ),)

                          ],
                        ),
                      ),
                    ),
                  );
                },),
            )
          ],
        ),
      ),
    );
  }
}
