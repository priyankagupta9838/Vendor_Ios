/*
import 'package:flutter/material.dart';

import 'login.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body:  Container(
        height: size.height,
        width: size.width,
        color: Colors.white,
        child: SingleChildScrollView(
           scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: size.height*0.02,
              ),
              Container(
                height: size.height*0.063,
                width: size.width,
                color: const Color.fromRGBO(254, 247, 255,1),
                child: Row(
                  children: [
                    Icon(Icons.location_on_outlined,color: Colors.black,size: size.height*0.03,),
                    SizedBox(
                      width: size.width*0.02,
                    ),
                    Text("Koramanagala",style: TextStyle(
                        color: Colors.black,
                        fontSize: size.height*0.022,
                        fontWeight: FontWeight.w600,
                        inherit: false
                    ),),
                    SizedBox(
                      width: size.width*0.3,
                    ),
                    Icon(Icons.search,color: Colors.black,size: size.height*0.027,),
                    SizedBox(
                      width: size.width*0.047,
                    ),
                    Icon(Icons.notification_add_outlined,color: Colors.black,size: size.height*0.027,),
                    SizedBox(
                      width: size.width*0.047,
                    ),
                    Icon(Icons.supervised_user_circle,color: Colors.black,size: size.height*0.027,),

                  ],
                ),
              ),
              SizedBox(
                height: size.height*0.025,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: size.height*0.05,
                    width: size.width*0.27,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(254, 247, 255,1),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(size.width*0.02),bottomLeft: Radius.circular(size.width*0.02)),
                        border: Border.all(
                            color: Colors.black,
                            width: 1
                        )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.check,color: Colors.black,size: size.height*0.025,),
                        Text("Shopping",style: TextStyle(
                            inherit: false,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: size.height*0.015
                        ),)
                      ],
                    ),
                  ),
                  Container(
                    height: size.height*0.05,
                    width: size.width*0.27,
                    decoration: BoxDecoration(
                        borderRadius:BorderRadius.only(bottomRight: Radius.circular(size.width*0.02),topRight: Radius.circular(size.width*0.02)),
                        border: Border.all(
                            color: Colors.black,
                            width: 1
                        )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //Icon(Icons.check,color: Colors.black,size: size.height*0.025,),
                        Text("Sell Now",style: TextStyle(
                            inherit: false,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: size.height*0.015
                        ),)
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height*0.8
                ,
                width: size.width*0.92,
                child: GridView.builder(
                  itemCount: 8,
                  shrinkWrap: true,
                  cacheExtent: size.height*0.3,
                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: size.width*0.038,
                      mainAxisSpacing: size.width*0.038
                  ), itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(size.width*0.045))
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: size.height*0.15,
                          decoration: BoxDecoration(
                              color:Colors.black26,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(size.width*0.045),
                                  topRight: Radius.circular(size.width*0.045))
                          ),

                        ),
                        Container(
                          height: size.height*0.058,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius:BorderRadius.only(
                          bottomLeft: Radius.circular(size.width*0.045),
                            bottomRight: Radius.circular(size.width*0.045))
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:  const EdgeInsets.only(left: 10),
                                child: Text("Sarees",style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: size.height*0.018,
                                  fontWeight: FontWeight.w600
                                ),),
                              ),
                              const Padding(
                                padding:EdgeInsets.only(left: 10),
                                child: Text("222 Products"),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(254, 247, 255,1),
       // currentIndex: 1,
        selectedLabelStyle:TextStyle(fontSize: size.height*0.013,color: Colors.black) ,
        unselectedLabelStyle: TextStyle(fontSize: size.height*0.013,color: Colors.black),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Colors.black,size: size.height*0.03,),

            label: "Home",
            activeIcon: Icon(Icons.home,color: Colors.black,size: size.height*0.03,),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.currency_rupee,color: Colors.black,size: size.height*0.03,),
            label: "Quote",
            activeIcon: Icon(Icons.card_giftcard,color: Colors.black,size: size.height*0.032,),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard,color: Colors.black,size: size.height*0.03,),

            label: "Orders",
            activeIcon: Icon(Icons.home,color: Colors.black,size: size.height*0.03,),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat,color: Colors.black,size: size.height*0.03,),

            label: "Replies",
            activeIcon: Icon(Icons.home,color: Colors.black,size: size.height*0.032,),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart,color: Colors.black,size: size.height*0.03,),

            label: "Cart",
            activeIcon: Icon(Icons.home,color: Colors.black,size: size.height*0.032,),
          ),
        ],
      ),
    );
  }
}
*/
