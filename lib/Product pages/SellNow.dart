import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import '../homepages/listings.dart';
import 'EditDetails.dart';
import 'adding_product.dart';

class SellNow extends StatefulWidget {
   SellNow({super.key,required this.fetchedData});
   late List<dynamic> fetchedData;
  @override
  State<SellNow> createState() => _SellNowState();
}

class _SellNowState extends State<SellNow> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: size.height*0.02,bottom: size.height*0.01),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText("Products",style: GoogleFonts.openSans(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: size.height*0.02
              ),),
              SizedBox(
                height: size.height*0.004,
              ),
              AutoSizeText("Products(${widget.fetchedData.length})",style: GoogleFonts.openSans(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: size.height*0.015
              ),),
            ],
          ),
        ),
        SizedBox(
          height: size.height*0.11*widget.fetchedData.length,
          width: size.width,
          child: ListView.builder(
            itemCount: widget.fetchedData.length,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(bottom: size.height*0.08),
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
                      color: const Color.fromRGBO(254, 247, 255, 1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: size.height*0.07,
                            width: size.width*0.2,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.all(Radius.circular(size.height*0.01)),
                              border: Border.all(color: Colors.black12),
                            ),
                            child: widget.fetchedData[index]["images"].length>0
                            ?
                            Image.network(widget.fetchedData[index]["images"][0]["image"],fit: BoxFit.fill,errorBuilder: (context, error, stackTrace) {
                              return  Image.asset("assets/images/imagePlaceholder.jpg",fit: BoxFit.fill);
                            },)
                                :
                            Image.asset("assets/images/imagePlaceholder.jpg",fit: BoxFit.fill)
                            ,
                          ),
                          SizedBox(
                            width: size.width*0.02,
                          ),
                          SizedBox(
                            height: size.height*0.078,
                            width: size.width*0.56
                            ,
                            child:  Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                widget.fetchedData[index]["approved"]==null
                                    ?

                                AutoSizeText(" Waiting for approval",style: GoogleFonts.openSans(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w600,
                                  fontSize: size.height*0.016
                                ),)
                                :
                                widget.fetchedData[index]["approved"]==0
                                ?
                                AutoSizeText("Rejected",style: GoogleFonts.openSans(
                                    color: Colors.red.shade800,
                                    fontWeight: FontWeight.w600,
                                    fontSize: size.height*0.016
                                ),)
                                :
                                AutoSizeText("Approved",style: GoogleFonts.openSans(
                                    color: Colors.green.shade800,
                                    fontWeight: FontWeight.w600,
                                    fontSize: size.height*0.016
                                ),),
                                AutoSizeText("${widget.fetchedData[index]["product_name"] ?? ""} ${widget.fetchedData[index]["clothing_type"] ?? ""}" ,style: GoogleFonts.openSans(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600
                                ),),
                                AutoSizeText("\u{20B9}${widget.fetchedData[index]["price"] ?? ""}",style: GoogleFonts.openSans(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500
                                ),),
                              ],
                            ),
                          ),

                          IconButton(onPressed: (){
                           // print(widget.fetchedData[index]["_id"]);
                            Navigator.push(context, PageTransition(
                                type: PageTransitionType.rightToLeft,
                                duration: const Duration(milliseconds: 300),
                                childCurrent:  SellNow(fetchedData: const [],),
                                child:  EditProduct(
                                  productController:widget.fetchedData[index]["product_name"]??"",
                                  displayController:widget.fetchedData[index]["display_name"]??"",
                                  productAgeController: widget.fetchedData[index]["product_age"]??"",
                                  priceController: widget.fetchedData[index]["price"].toString()??"",
                                  ageController:widget.fetchedData[index]["product_age"],
                                  prodConditionController:widget.fetchedData[index]["product_condition"],
                                  clothTypeController: widget.fetchedData[index]["clothing_type"]??"",
                                  sizeController: widget.fetchedData[index]["size_fit"]??"",
                                  borderController: widget.fetchedData[index]["border"]??"",
                                  fabricController: widget.fetchedData[index]["fabric"]??"",
                                  photoList: widget.fetchedData[index]["images"]??"",
                                  productInfoController:widget.fetchedData[index]["info"]??"",
                                  printController:  widget.fetchedData[index]["print_pattern_type"]??"",
                                  product_no:widget.fetchedData[index]["product_no"].toString()??"",
                                  productId: widget.fetchedData[index]["id"].toString()??"",
                                  categoryId:widget.fetchedData[index]["category_id"].toString()??"",

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
                      Icon(Icons.edit_outlined,color: Colors.deepPurple,size:size.height*0.023),
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
    );
  }
}
