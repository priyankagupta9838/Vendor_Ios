import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vendor/quotes/quotesrecive.dart';
import 'package:vendor/utilityfunctions.dart';
import 'Constraints.dart';

import 'chat system/chatHomePage.dart';
import 'homepages/home.dart';
import 'orders/myorders.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  PageController pageController = PageController();
  Color diactiveColor = Colors.black54;
  int currIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UtilityFunctions().checkNotificationPermission();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(userModel);
    return Scaffold(

      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            currIndex = index;
          });
        },
        children: const [
          HomePage(),
          QuotesReceived(),
          MyOrders(),
          ChatHomePage()
        ],
      ),
      bottomNavigationBar: Container(
        height: size.height * 0.075,
        decoration: const BoxDecoration(
          color: Colors.white70,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNavBarItem(Icons.home_outlined, "Home", 0),
            buildNavBarItem(CupertinoIcons.arrow_down_doc, "Quote", 1),
            buildNavBarItem(CupertinoIcons.gift, "Orders", 2),
            buildNavBarItem(CupertinoIcons.chat_bubble_text, "Replies", 3),
          ],
        ),
      ),
    );
  }

  Widget buildNavBarItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () async {
        setState(() {
          currIndex = index;
          pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color:  diactiveColor,
            size: MediaQuery.of(context).size.height * 0.03,
          ),
          AutoSizeText(
            label,
            style: GoogleFonts.openSans(
              fontSize: MediaQuery.of(context).size.height * 0.01,
              color:  diactiveColor,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}
