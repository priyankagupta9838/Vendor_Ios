import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vendor/homepages/shopdetailstream.dart';
import '../Account Related/account.dart';
import '../Constraints.dart';
import '../NotificationSetup/helper_Notification.dart';
import 'listings.dart';
import 'overview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 3,
      child: SizedBox(
        height: size.height*1,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
              title: AutoSizeText(
                "Hi , ${userModel["fullname"]}",
                style: GoogleFonts.openSans(
                  color: Colors.black,
                  fontSize: size.height * 0.022,
                  fontWeight: FontWeight.w600,
                ),
              ),
              actions: [
                // IconButton(
                //   onPressed: () async {
                //     await NotificationServices().getToken().then((value) {
                //       print(value.toString());
                //       NotificationServices().sendPushMessage( value.toString(),"Hello World","testing");
                //
                //     });
                //
                //   },
                //   icon: const Icon(Icons.notifications_none, color: Colors.black87),
                // ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        duration: const Duration(milliseconds: 400),
                        childCurrent: const HomePage(),
                        child: const Account(),
                      ),
                    );
                  },
                  icon: const Icon(
                    CupertinoIcons.person_crop_circle_fill,
                    color: Colors.black87,
                  ),
                ),
            ],
            elevation: 0,
             toolbarHeight: size.height*0.09,
            backgroundColor: Colors.transparent,
            bottom:   TabBar(

              tabs: [
                Tab(
                    child: FittedBox(
                      child: AutoSizeText("Overview",
                      style: GoogleFonts.openSans(
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                        fontSize: size.height*0.018
                      ),),
                    )
                ),
                Tab(
                    child: FittedBox(
                      child: AutoSizeText("Listings",
                        style: GoogleFonts.openSans(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontSize: size.height*0.018
                        ),),
                    )
                ),
                Tab(

                  child: FittedBox(

                    child: AutoSizeText("Shop Detail",
                      style: GoogleFonts.openSans(
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                          fontSize: size.height*0.018
                      ),),
                  ),
                ),
              ],
            ),

          ),
            body:   const TabBarView(

             physics: NeverScrollableScrollPhysics(),

              children: [
                Overview(),
                Listings(),

                ShopDetailStream()
              ],
            )
        ),
      ),
    );
  }
}
