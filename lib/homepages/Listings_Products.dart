/*
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListingProducts extends StatefulWidget {
  const ListingProducts({Key? key}) : super(key: key);

  @override
  State<ListingProducts> createState() => _ListingProductsState();
}

class _ListingProductsState extends State<ListingProducts> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: size.height*0.02,bottom: size.height*0.01),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText("Products",style: GoogleFonts.openSans(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: size.height*0.02
              ),),
              SizedBox(
                height: size.height*0.004,
              ),
              AutoSizeText("Products(1)",style: GoogleFonts.openSans(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: size.height*0.015
              ),),
            ],
          ),
        ),
        SizedBox(
          height: (size.height*0.11)*2+size.height*0.07,
          child:  Column(
            children: [

              SizedBox(
                height: size.height*0.22,
                width: size.width*1,
                child: ListView.builder(
                  itemCount: 2,
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
                                      image:
 (widget.fetchedData[index]["productImage"][0]["url"]!=null &&  widget.fetchedData[index]["productImage"].length>0)
                                          ?
                                      DecorationImage(
                                          image: NetworkImage(widget.fetchedData[index]["productImage"][0]["url"]))
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
                                      AutoSizeText("\u{20B9}100 || subheading",style: GoogleFonts.openSans(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500
                                      ),),
                                    ],
                                  ),
                                ),
                                IconButton(onPressed: (){
 print(widget.fetchedData[index]["_id"]);
                                  Navigator.push(context, PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      duration: const Duration(milliseconds: 300),
                                      childCurrent:  SellNow(fetchedData: const [],),
                                      child:  EditProduct(
                                        productController:widget.fetchedData[index]["productsName"]??"",
                                        listDisPlayController: widget.fetchedData[index]["subHeading"]??"",
                                        priceController: widget.fetchedData[index]["productPrice"].toString()??"",
                                        ageController:"",
                                        prodConditionController: "",
                                        clothTypeController: widget.fetchedData[index]["type"]??"",
                                        sizeController: widget.fetchedData[index]["sizeFit"]??"",
                                        borderController: widget.fetchedData[index]["border"]??"",
                                        fabricController: widget.fetchedData[index]["fabric"]??"",
                                        photoList: widget.fetchedData[index]["productImage"]??"",
                                        productInfoController: widget.fetchedData[index]["description"]??"",
                                        printController:  widget.fetchedData[index]["printOrPattern"]??"",
                                        productId: widget.fetchedData[index]["_id"]??"",

                                      )));

                                }, icon: const Icon(Icons.edit_outlined))

                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },),
              ),
              Padding(
                padding:  EdgeInsets.only(top: size.height*0.0005),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    height: size.height*0.06,
                    width: size.width*0.37,
                    child: ElevatedButton(

                        style: ElevatedButton.styleFrom(
                            elevation: 5,
                            backgroundColor: const Color.fromRGBO(236, 230, 240, 1),
                            side: const BorderSide(color: Colors.transparent),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(size.height*0.02)))),
                        onPressed: () {
                          Navigator.push(context, PageTransition(
                              type: PageTransitionType.rightToLeft,
                              duration: const Duration(milliseconds: 300),
                              childCurrent:  const Listings(),
                              child: const AddingProduct()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.edit_outlined,color: Colors.deepPurple,size:size.height*0.025),
                            AutoSizeText(
                              "Add Product",
                              style: GoogleFonts.openSans(color: Colors.deepPurple,
                                  fontWeight: FontWeight.w600,
                                  fontSize: size.height*0.015),
                            ),
                          ],
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
*/
