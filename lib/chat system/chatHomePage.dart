import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vendor/Constraints.dart';
import 'openChat.dart';

class ChatHomePage extends StatelessWidget {
  const ChatHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(194, 172, 209, 1),
        title:  AutoSizeText("Chat with User",style: GoogleFonts.roboto(
            color: Colors.white,
            fontSize: size.height*0.025,
            fontWeight: FontWeight.w400
        ),),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream:  FirebaseFirestore.instance
            .collection("Users").doc(userModel["id"].toString()).snapshots(),
        builder: (context, snapshot) {
          print("chat data is : ${snapshot.data?.data()}");
          return snapshot.hasData
              ?
          snapshot.data?.data()!=null?
          ListView.builder(
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: snapshot.data!.data()?["Channels"]?.length,
            itemBuilder: (context, index) {
              return  Padding(
                padding:  EdgeInsets.only(left: size.width*0.018,right: size.width*0.018,top: size.width*0.018),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, PageTransition(
                        type: PageTransitionType.bottomToTop,
                        duration: const Duration(milliseconds: 0),
                        childCurrent: const ChatHomePage(),
                        child:  OpenChat(channel: snapshot.data!.data()?["Channels"][index]["channel name"], userName: snapshot.data!.data()?["Channels"][index]["userName"], vendorId:snapshot.data!.data()!["Channels"][index]["userId"].toString() , vendorShopName: "Username", vendorShopImage: snapshot.data!.data()?["Channels"][index]["vendor shopImage"],)));
                         },
                  child: Container(
                    height: size.height * 0.09,
                    width: size.width * 0.9,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(174, 144, 194, 1),
                      borderRadius: BorderRadius.all(
                      Radius.circular( size.width*0.012)
                        ),
                      ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: size.width*0.025,
                              ),
                              CircleAvatar(
                                radius: size.height * 0.03,
                                child:  AutoSizeText(snapshot.data!.data()!["Channels"][index]["vendor shopName"].toString().substring(0,1)),
                              ),
                              SizedBox(
                                width: size.width * 0.03,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    snapshot.data!.data()!["Channels"][index]["userName"].toString(),
                                    maxLines: 1,
                                    style: GoogleFonts.openSans(
                                      fontSize: size.height*0.02,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                  AutoSizeText(
                                    "New Message",
                                    style: GoogleFonts.aBeeZee(
                                        color: Colors.white,
                                        fontSize: size.height*0.014,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          )
              :
          SizedBox()
              :
          SizedBox(
            height: size.height*0.78,
            width: size.width,
            child: const Center(child: Text("No chat Available")),
          );
        },
      ),
    );
  }
}
