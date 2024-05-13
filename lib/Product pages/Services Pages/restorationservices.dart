import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RestorationServices extends StatefulWidget {
  const RestorationServices({super.key});

  @override
  State<RestorationServices> createState() => _RestorationServicesState();
}

class _RestorationServicesState extends State<RestorationServices> {
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;

    // List<Map<String ,String>> ServiceType=[];
    // ServiceType.add({
    //   "id":"2",
    //   "name":"String"
    // });
    return  const Column(
      children: [
       /* StreamBuilder(
          stream: VendorServicesApi().fetchRegularDryCleanServices() ,
          builder: (context, snapshot) {
            if( snapshot.hasData ){
              var data=jsonDecode(snapshot.data!.body);

              return snapshot.data?.statusCode==200
                  ?
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText("Regular dry clean (${data["data"].length})",style: GoogleFonts.openSans(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: size.height*0.015
                  ),),
                  SizedBox(
                    height: size.height*0.01,
                  ),
                  SizedBox(
                    height: size.height*0.099*data["data"].length,
                    width: size.width*1,
                    child: ListView.builder(
                      itemCount: data["data"].length,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return  Padding(
                          padding:  EdgeInsets.only(left: size.height*0.001,right: size.height*0.001,
                              bottom: size.height*0.01
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: size.height*0.099,
                                width: size.width*1,
                                color: const Color.fromRGBO(254, 247, 255, 0.5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: size.height*0.07,
                                      width: size.width*0.2,
                                      decoration: BoxDecoration(
                                        //color: Colors.grey,
                                          borderRadius: BorderRadius.all(Radius.circular(size.height*0.01)),
                                          image:    (data["data"][index]["vendor_services_list"][index]["service"]["image"]!=null &&  data["data"][index]["vendor_services_list"].length>0)
                                              ?
                                          DecorationImage(
                                              image: NetworkImage(data["data"][index]["vendor_services_list"][index]["service"]["image"]))
                                              :
                                          const DecorationImage(
                                              image: AssetImage("assets/images/imagePlaceholder.jpg"),

                                              fit: BoxFit.cover
                                          )
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width*0.02,
                                    ),
                                    SizedBox(
                                      height: size.height*0.07,
                                      width: size.width*0.57,
                                      child:  Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          AutoSizeText("Zara Silk" ,style: GoogleFonts.openSans(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600
                                          ),),
                                          AutoSizeText("\u{20B9}${data["data"][0]["vendor_services_list"][index]["price"]} || subheading",style: GoogleFonts.openSans(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500
                                          ),),
                                        ],
                                      ),
                                    ),
                                    IconButton(onPressed: (){


                                      Navigator.push(context, PageTransition(
                                          type: PageTransitionType.rightToLeft,
                                          duration: const Duration(milliseconds: 300),
                                          childCurrent:  const RestorationServices(),
                                          child:   const EditService()));
                                    }, icon: const Icon(Icons.edit_outlined))

                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },),
                  ),
                ],
              )
                  :
              Column(
                children: [
                  AutoSizeText("Regular dry clean",style: GoogleFonts.openSans(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: size.height*0.015
                  ),),
                  SizedBox(
                    height: size.height*0.01,
                  ),
                ],
              );
            }
            else{
              return SizedBox();
            }
          },
        ),
        StreamBuilder(
          stream: VendorServicesApi().fetchStainRemovalServices() ,
          builder: (context, snapshot) {
            if( snapshot.hasData ){
              var data=jsonDecode(snapshot.data!.body);

              return snapshot.data?.statusCode==200
                  ?
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText("Stain Removal(${data["data"].length})",style: GoogleFonts.openSans(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: size.height*0.015
                  ),),
                  SizedBox(
                    height: size.height*0.01,
                  ),
                  SizedBox(
                    height: size.height*0.099*data["data"].length,
                    width: size.width*1,
                    child: ListView.builder(
                      itemCount: data["data"].length,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return  Padding(
                          padding:  EdgeInsets.only(left: size.height*0.001,right: size.height*0.001,
                              bottom: size.height*0.01
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: size.height*0.099,
                                width: size.width*1,
                                color: const Color.fromRGBO(254, 247, 255, 0.5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: size.height*0.07,
                                      width: size.width*0.2,
                                      decoration: BoxDecoration(
                                        //color: Colors.grey,
                                          borderRadius: BorderRadius.all(Radius.circular(size.height*0.01)),
                                          image:    (data["data"][index]["vendor_services_list"][index]["service"]["image"]!=null &&  data["data"][index]["vendor_services_list"].length>0)
                                              ?
                                          DecorationImage(
                                              image: NetworkImage(data["data"][index]["vendor_services_list"][index]["service"]["image"]))
                                              :
                                          const DecorationImage(
                                              image: AssetImage("assets/images/imagePlaceholder.jpg"),

                                              fit: BoxFit.cover
                                          )
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width*0.02,
                                    ),
                                    SizedBox(
                                      height: size.height*0.07,
                                      width: size.width*0.57,
                                      child:  Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          AutoSizeText("Zara Silk" ,style: GoogleFonts.openSans(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600
                                          ),),
                                          AutoSizeText("\u{20B9}${data["data"][0]["vendor_services_list"][index]["price"]} || subheading",style: GoogleFonts.openSans(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500
                                          ),),
                                        ],
                                      ),
                                    ),
                                    IconButton(onPressed: (){


                                      Navigator.push(context, PageTransition(
                                          type: PageTransitionType.rightToLeft,
                                          duration: const Duration(milliseconds: 300),
                                          childCurrent:  const RestorationServices(),
                                          child:   const EditService()));
                                    }, icon: const Icon(Icons.edit_outlined))

                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },),
                  ),
                ],
              )
                  :
              Column(
                children: [
                  AutoSizeText("Stain Removal(0)",style: GoogleFonts.openSans(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: size.height*0.015
                  ),),
                  SizedBox(
                    height: size.height*0.01,
                  ),
                ],
              );
            }
            else{
              return const SizedBox();
            }
          },
        ),
        StreamBuilder(
          stream: VendorServicesApi().fetchPolishingServices() ,
          builder: (context, snapshot) {
            if( snapshot.hasData ){
              var data=jsonDecode(snapshot.data!.body);

              return snapshot.data?.statusCode==200
                  ?
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText("Polishing (${data["data"].length})",style: GoogleFonts.openSans(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: size.height*0.015
                  ),),
                  SizedBox(
                    height: size.height*0.01,
                  ),
                  SizedBox(
                    height: size.height*0.099*data["data"].length,
                    width: size.width*1,
                    child: ListView.builder(
                      itemCount: data["data"].length,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return  Padding(
                          padding:  EdgeInsets.only(left: size.height*0.001,right: size.height*0.001,
                              bottom: size.height*0.01
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: size.height*0.099,
                                width: size.width*1,
                                color: const Color.fromRGBO(254, 247, 255, 0.5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: size.height*0.07,
                                      width: size.width*0.2,
                                      decoration: BoxDecoration(
                                        //color: Colors.grey,
                                          borderRadius: BorderRadius.all(Radius.circular(size.height*0.01)),
                                          image:    (data["data"][index]["vendor_services_list"][index]["service"]["image"]!=null &&  data["data"][index]["vendor_services_list"].length>0)
                                              ?
                                          DecorationImage(
                                              image: NetworkImage(data["data"][index]["vendor_services_list"][index]["service"]["image"]))
                                              :
                                          const DecorationImage(
                                              image: AssetImage("assets/images/imagePlaceholder.jpg"),

                                              fit: BoxFit.cover
                                          )
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width*0.02,
                                    ),
                                    SizedBox(
                                      height: size.height*0.07,
                                      width: size.width*0.57,
                                      child:  Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          AutoSizeText("Zara Silk" ,style: GoogleFonts.openSans(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600
                                          ),),
                                          AutoSizeText("\u{20B9}${data["data"][0]["vendor_services_list"][index]["price"]} || subheading",style: GoogleFonts.openSans(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500
                                          ),),
                                        ],
                                      ),
                                    ),
                                    IconButton(onPressed: (){


                                      Navigator.push(context, PageTransition(
                                          type: PageTransitionType.rightToLeft,
                                          duration: const Duration(milliseconds: 300),
                                          childCurrent:  const RestorationServices(),
                                          child:   const EditService()));
                                    }, icon: const Icon(Icons.edit_outlined))

                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },),
                  ),
                ],
              )
                  :
              Column(
                children: [
                  AutoSizeText("Polishing (0)",style: GoogleFonts.openSans(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: size.height*0.015
                  ),),
                  SizedBox(
                    height: size.height*0.01,
                  ),
                ],
              );
            }
            else{
              return const SizedBox();
            }
          },
        ),
        StreamBuilder(
          stream: VendorServicesApi().fetchPrintAndDyeServices() ,
          builder: (context, snapshot) {
            if( snapshot.hasData ){
              var data=jsonDecode(snapshot.data!.body);

              return snapshot.data?.statusCode==200
                  ?
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText("Print and Dye (${data["data"].length})",style: GoogleFonts.openSans(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: size.height*0.015
                  ),),
                  SizedBox(
                    height: size.height*0.01,
                  ),
                  SizedBox(
                    height: size.height*0.099*data["data"].length,
                    width: size.width*1,
                    child: ListView.builder(
                      itemCount: data["data"].length,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return  Padding(
                          padding:  EdgeInsets.only(left: size.height*0.001,right: size.height*0.001,
                              bottom: size.height*0.01
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: size.height*0.099,
                                width: size.width*1,
                                color: const Color.fromRGBO(254, 247, 255, 0.5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: size.height*0.07,
                                      width: size.width*0.2,
                                      decoration: BoxDecoration(
                                        //color: Colors.grey,
                                          borderRadius: BorderRadius.all(Radius.circular(size.height*0.01)),
                                          image:    (data["data"][index]["vendor_services_list"][index]["service"]["image"]!=null &&  data["data"][index]["vendor_services_list"].length>0)
                                              ?
                                          DecorationImage(
                                              image: NetworkImage(data["data"][index]["vendor_services_list"][index]["service"]["image"]))
                                              :
                                          const DecorationImage(
                                              image: AssetImage("assets/images/imagePlaceholder.jpg"),

                                              fit: BoxFit.cover
                                          )
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width*0.02,
                                    ),
                                    SizedBox(
                                      height: size.height*0.07,
                                      width: size.width*0.57,
                                      child:  Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          AutoSizeText("Zara Silk" ,style: GoogleFonts.openSans(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600
                                          ),),
                                          AutoSizeText("\u{20B9}${data["data"][0]["vendor_services_list"][index]["price"]} || subheading",style: GoogleFonts.openSans(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500
                                          ),),
                                        ],
                                      ),
                                    ),
                                    IconButton(onPressed: (){


                                      Navigator.push(context, PageTransition(
                                          type: PageTransitionType.rightToLeft,
                                          duration: const Duration(milliseconds: 300),
                                          childCurrent:  const RestorationServices(),
                                          child:   const EditService()));
                                    }, icon: const Icon(Icons.edit_outlined))

                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },),
                  ),
                ],
              )
                  :
              Column(
                children: [
                  AutoSizeText("Print and Dye",style: GoogleFonts.openSans(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: size.height*0.015
                  ),),
                  SizedBox(
                    height: size.height*0.01,
                  ),
                ],
              );
            }
            else{
              return const SizedBox();
            }
          },
        ),
        StreamBuilder(
          stream: VendorServicesApi().fetchRepairClothesServices() ,
          builder: (context, snapshot) {
            if( snapshot.hasData ){
              var data=jsonDecode(snapshot.data!.body);

              return snapshot.data?.statusCode==200
                  ?
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText("Repair clothes (${data["data"].length})",style: GoogleFonts.openSans(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: size.height*0.015
                  ),),
                  SizedBox(
                    height: size.height*0.01,
                  ),
                  SizedBox(
                    height: size.height*0.099*data["data"].length,
                    width: size.width*1,
                    child: ListView.builder(
                      itemCount: data["data"].length,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return  Padding(
                          padding:  EdgeInsets.only(left: size.height*0.001,right: size.height*0.001,
                              bottom: size.height*0.01
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: size.height*0.099,
                                width: size.width*1,
                                color: const Color.fromRGBO(254, 247, 255, 0.5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: size.height*0.07,
                                      width: size.width*0.2,
                                      decoration: BoxDecoration(
                                        //color: Colors.grey,
                                          borderRadius: BorderRadius.all(Radius.circular(size.height*0.01)),
                                          image:    (data["data"][index]["vendor_services_list"][index]["service"]["image"]!=null &&  data["data"][index]["vendor_services_list"].length>0)
                                              ?
                                          DecorationImage(
                                              image: NetworkImage(data["data"][index]["vendor_services_list"][index]["service"]["image"]))
                                              :
                                          const DecorationImage(
                                              image: AssetImage("assets/images/imagePlaceholder.jpg"),

                                              fit: BoxFit.cover
                                          )
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width*0.02,
                                    ),
                                    SizedBox(
                                      height: size.height*0.07,
                                      width: size.width*0.57,
                                      child:  Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          AutoSizeText("Zara Silk" ,style: GoogleFonts.openSans(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600
                                          ),),
                                          AutoSizeText("\u{20B9}${data["data"][0]["vendor_services_list"][index]["price"]} || subheading",style: GoogleFonts.openSans(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500
                                          ),),
                                        ],
                                      ),
                                    ),
                                    IconButton(onPressed: (){


                                      Navigator.push(context, PageTransition(
                                          type: PageTransitionType.rightToLeft,
                                          duration: const Duration(milliseconds: 300),
                                          childCurrent:  const RestorationServices(),
                                          child:   const EditService()));
                                    }, icon: const Icon(Icons.edit_outlined))

                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },),
                  ),
                ],
              )
                  :
              Column(
                children: [
                  AutoSizeText("Repair clothes (0)",style: GoogleFonts.openSans(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: size.height*0.015
                  ),),
                  SizedBox(
                    height: size.height*0.01,
                  ),
                ],
              );
            }
            else{
              return const SizedBox();
            }
          },
        ),
*/
      ],
    );
  }
}
