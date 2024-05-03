
import 'dart:convert';
import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:searchfield/searchfield.dart';
import '../Account Related/account.dart';
import '../Api/sellerApis.dart';
import '../Api/shoppingApi.dart';
import '../StateManagement/PageBloc.dart';
import '../StateManagement/PageEvent.dart';
import '../StateManagement/PageState.dart';
import '../utilityfunctions.dart';

class AddingProduct extends StatefulWidget {
  const AddingProduct({super.key});

  @override
  State<AddingProduct> createState() => _AddingProductState();
}

class _AddingProductState extends State<AddingProduct> {
  TextEditingController productController=TextEditingController();
  TextEditingController listDisPlayController=TextEditingController();
  TextEditingController priceController=TextEditingController();
  TextEditingController prodConditionController=TextEditingController();
  TextEditingController ageController=TextEditingController();
  TextEditingController clothTypeController=TextEditingController();
  TextEditingController fabricController=TextEditingController();
  TextEditingController printController=TextEditingController();
  TextEditingController borderController=TextEditingController();
  TextEditingController sizeController=TextEditingController();
  TextEditingController productInfoController=TextEditingController();
  TextEditingController categoryController=TextEditingController();

  int productPhotoCounter=0;
  List<String>photoPath=[];
  bool buttonClicked=false;
  bool buttonClick2=false;
  bool enable=false;
  List<String>categoryId=[];
  List<String>categoryName=[];
  String selectedCategory="";

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height*1,
        width: size.width*1,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: size.height*0.06,),
              Container(
                color: const Color.fromRGBO(236, 230, 240, 1),
                height: size.height*0.06,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      }, icon:  Icon(CupertinoIcons.arrow_left,size: size.width*0.055,),

                    ),
                    SizedBox(
                      width: size.width*0.14,
                    ),
                    AutoSizeText("Adding Product Details",

                      style:GoogleFonts.openSans(
                          color: Colors.black,
                          fontSize:  size.height*0.022,
                          fontWeight: FontWeight.w500
                      ) ,
                    ),
                  ],
                ),

              ),
              Padding(
                padding:  EdgeInsets.only(left: size.height*0.01,right: size.height*0.01),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height*0.02,
                    ),

                    AutoSizeText("Select Category",
                      style:GoogleFonts.openSans(
                          color: Colors.black,
                          fontSize:  size.height*0.018,
                          fontWeight: FontWeight.w500
                      ) ,
                    ),
                    SizedBox(
                      height: size.height*0.016,
                    ),
                    Container(
                      height: size.height*0.06,
                      width: size.width*1,
                      decoration: const BoxDecoration(

                        //borderRadius:  BorderRadius.all(Radius.circular(size.height*0.005)),
                        //border: Border.all(color: Colors.purple.shade200)
                      ),
                      child: StreamBuilder(
                        stream: Products().fetchStreamProductCategory(),
                        builder: (context, snapshot) {

                          if( snapshot.hasData ){
                            var data=jsonDecode(snapshot.data!.body);
                            categoryName.clear();
                            for(var id in data["data"]){
                              categoryName.add(id["category_name"].toString());
                              categoryId.add(id["id"].toString());
                            }
                            return snapshot.data?.statusCode==200
                                ?
                            SearchField(
                              controller: categoryController,
                              suggestionItemDecoration: SuggestionDecoration(
                              ),
                              key: const Key("Search key"),
                              suggestions:
                              categoryName.map((e) => SearchFieldListItem(e)).toList(),
                              searchStyle: GoogleFonts.openSans(
                                  color: Colors.black87,
                                  fontSize: size.height*0.018,
                                  fontWeight: FontWeight.w500),
                              suggestionStyle: GoogleFonts.openSans(
                                color: Colors.black,
                                fontSize: size.height*0.018,
                                fontWeight: FontWeight.w500,
                              ),
                             // marginColor: Colors.white,
                              suggestionsDecoration: SuggestionDecoration(


                                  color: Colors.purple.shade50,
                                  //shape: BoxShape.rectangle,

                                  padding: EdgeInsets.all(size.height * 0.015),
                                  // border: Border.all(width: 2, color: Colors.black),
                                  borderRadius: BorderRadius.circular(0)),
                              searchInputDecoration: InputDecoration(
                                focusColor: Colors.black,
                                  hintText: "Select Category",
                                  contentPadding: EdgeInsets.only(top: size.height*0.02,left: size.width*0.022),
                                  fillColor: Colors.transparent,
                                  filled: true,
                                  suffixIcon: Icon(Icons.arrow_drop_down,size: size.width*0.055,color: Colors.black87,),
                                  hintStyle: GoogleFonts.openSans(
                                      color: Colors.grey,
                                      fontSize: size.height*0.02,
                                      fontWeight: FontWeight.w500),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                      //style: BorderStyle.none
                                    ),
                                    borderRadius: BorderRadius.circular(size.height*0.006),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.black54,
                                      width: 1,
                                      //style: BorderStyle.none
                                    ),
                                    borderRadius: BorderRadius.circular(size.height*0.006),
                                  ),
                                  //focusColor: Colors.black,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.black54,
                                      width: 1,
                                      //style: BorderStyle.none
                                    ),

                                    borderRadius: BorderRadius.circular(size.height*0.006),
                                  )

                              ),
                              onSuggestionTap: (value) {
                                int position=int.parse("${categoryName.indexOf(value.searchKey)}");
                                selectedCategory=value.searchKey;
                                selectedCategory=categoryId[position].toString();
                              },
                              enabled: true,
                              itemHeight: 50,
                              maxSuggestionsInViewPort: 3,
                            )
                                :
                            SearchField(
                              controller: categoryController,
                              suggestionItemDecoration: SuggestionDecoration(

                              ),
                              key: const Key("Search key"),
                              suggestions:
                              categoryName.map((e) => SearchFieldListItem(e)).toList(),
                              searchStyle: GoogleFonts.openSans(
                                  color: Colors.black87,
                                  fontSize: size.height*0.018,
                                  fontWeight: FontWeight.w500),
                              suggestionStyle: GoogleFonts.openSans(
                                color: Colors.black,
                                fontSize: size.height*0.018,
                                fontWeight: FontWeight.w500,
                              ),

                              suggestionsDecoration: SuggestionDecoration(
                                padding:  EdgeInsets.only(left: size.height*0.01,right: size.height*0.01),
                                //shape: BoxShape.rectangle,

                              ),
                              searchInputDecoration: InputDecoration(
                                  hintText: "Select Measurement",
                                  contentPadding: EdgeInsets.only(top: size.height*0.02,left: size.width*0.022),
                                  fillColor: Colors.transparent,
                                  filled: true,
                                  suffixIcon: Icon(Icons.arrow_drop_down,size: size.width*0.055,color: Colors.black87,),
                                  hintStyle: GoogleFonts.openSans(
                                      color: Colors.grey,
                                      fontSize: size.height*0.02,
                                      fontWeight: FontWeight.w500),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.black87,
                                      width: 1,
                                      //style: BorderStyle.none
                                    ),
                                    borderRadius: BorderRadius.circular(size.height*0.006),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.black54,
                                      width: 1,
                                      //style: BorderStyle.none
                                    ),
                                    borderRadius: BorderRadius.circular(size.height*0.006),
                                  ),
                                  focusColor: Colors.black,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.black54,
                                      width: 1,
                                      //style: BorderStyle.none
                                    ),
                                    borderRadius: BorderRadius.circular(size.height*0.006),
                                  )

                              ),
                              onSuggestionTap: (value) {

                              },
                              enabled: true,
                              itemHeight: 50,
                              maxSuggestionsInViewPort: 3,
                            );
                          }
                          else{
                            return SearchField(
                              controller: categoryController,
                              suggestionItemDecoration: SuggestionDecoration(

                              ),
                              key: const Key("Search key"),
                              suggestions:
                              categoryName.map((e) => SearchFieldListItem(e)).toList(),
                              searchStyle: GoogleFonts.openSans(
                                  color: Colors.black87,
                                  fontSize: size.height*0.018,
                                  fontWeight: FontWeight.w500),
                              suggestionStyle: GoogleFonts.openSans(
                                color: Colors.black,
                                fontSize: size.height*0.018,
                                fontWeight: FontWeight.w500,
                              ),

                                suggestionsDecoration: SuggestionDecoration(


                                    color: Colors.purple.shade50,
                                    //shape: BoxShape.rectangle,

                                    padding: EdgeInsets.all(size.height * 0.015),
                                    // border: Border.all(width: 2, color: Colors.black),
                                    borderRadius: BorderRadius.circular(0)),
                              searchInputDecoration: InputDecoration(
                                  hintText: "Select Category",
                                  contentPadding: EdgeInsets.only(top: size.height*0.02,left: size.width*0.022),
                                  fillColor: Colors.transparent,
                                  filled: true,
                                  suffixIcon: Icon(Icons.arrow_drop_down,size: size.width*0.055,color: Colors.black87,),
                                  hintStyle: GoogleFonts.openSans(
                                      color: Colors.grey,
                                      fontSize: size.height*0.02,
                                      fontWeight: FontWeight.w500),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.black87,
                                      width: 1,
                                      //style: BorderStyle.none
                                    ),
                                    borderRadius: BorderRadius.circular(size.height*0.006),
                                  ),
                                  focusColor: Colors.black,
                                  disabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.black54,
                                      width: 1,
                                      //style: BorderStyle.none
                                    ),
                                    borderRadius: BorderRadius.circular(size.height*0.006),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.black54,
                                      width: 1,
                                      //style: BorderStyle.none
                                    ),
                                    borderRadius: BorderRadius.circular(size.height*0.006),
                                  )

                              ),
                              onSuggestionTap: (value) {

                              },
                              enabled: true,
                              itemHeight: 50,
                              maxSuggestionsInViewPort: 3,
                            );
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: size.height*0.03,
                    ),


                    AutoSizeText("Product Name",
                      style:GoogleFonts.openSans(
                          color: Colors.black,
                          fontSize:  size.height*0.018,
                          fontWeight: FontWeight.w500
                      ) ,
                    ),
                    SizedBox(
                      height: size.height*0.01,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: size.height*0.002),
                      child: TextField(
                        controller: productController,
                        onChanged: (value){
                          productController.text=value;
                          setState(() {

                          });
                        },
                        decoration: InputDecoration(
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
                            hintText: "Product Name",
                            hintStyle: GoogleFonts.openSans(
                                color: Colors.black54
                            ),
                            contentPadding: EdgeInsets.all(size.height*0.01)
                        ),

                      ),
                    ),
                    SizedBox(
                      height: size.height*0.02,
                    ),
                    AutoSizeText("Listing Display Name",
                      style:GoogleFonts.openSans(
                          color: Colors.black,
                          fontSize:  size.height*0.018,
                          fontWeight: FontWeight.w500
                      ) ,
                    ),
                    SizedBox(
                      height: size.height*0.01,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: size.height*0.002),
                      child: TextField(
                        controller: listDisPlayController,
                        onChanged: (value){
                          listDisPlayController.text=value;
                          setState(() {

                          });
                        },
                        decoration: InputDecoration(
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
                            hintText: "Listing Display Name",
                            hintStyle: GoogleFonts.openSans(
                                color: Colors.black54
                            ),
                            contentPadding: EdgeInsets.all(size.height*0.01)
                        ),

                      ),
                    ),
                    SizedBox(
                      height: size.height*0.02,
                    ),
                    AutoSizeText("Product Price",
                      style:GoogleFonts.openSans(
                          color: Colors.black,
                          fontSize:  size.height*0.018,
                          fontWeight: FontWeight.w500
                      ) ,
                    ),
                    SizedBox(
                      height: size.height*0.01,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: size.height*0.002),
                      child: TextField(
                        controller: priceController,
                        onChanged: (value){
                          priceController.text=value;
                          setState(() {

                          });
                        },
                        decoration: InputDecoration(
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
                          hintText: "Product Price",
                          hintStyle: GoogleFonts.openSans(
                              color: Colors.black54
                          ),
                          contentPadding: EdgeInsets.all(size.height*0.01),

                        ),
                        keyboardType: TextInputType.number,

                      ),
                    ),
                    SizedBox(
                      height: size.height*0.02,
                    ),
                    AutoSizeText("Product Photo (3 to 6)",
                      style:GoogleFonts.openSans(
                          color: Colors.black,
                          fontSize:  size.height*0.02,
                          fontWeight: FontWeight.w500
                      ) ,
                    ),
                    SizedBox(
                      height: size.height*0.35,
                      child: GridView.builder(
                        padding: EdgeInsets.only(top: size.height*0.03,left: size.height*0.00002,bottom: size.height*0.00002,right: size.height*0.00002),
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 6,
                        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: size.width*0.013,
                          mainAxisSpacing: size.height*0.01,
                        ), itemBuilder: (context, index) {
                        return Container(

                            color: Colors.grey,
                            child:
                            index<productPhotoCounter
                                ?
                            Stack(
                              children: [
                                SizedBox(
                                    height: size.height*0.15,
                                    child: Image.file(File(photoPath[index]),fit: BoxFit.cover,)),
                                Padding(
                                  padding:  EdgeInsets.only(bottom: size.height*0.01,right: size.width*0.01),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: GestureDetector(
                                      onTap: () async {
                                        photoPath.removeAt(index);
                                        productPhotoCounter--;
                                        setState(() {

                                        });
                                      },
                                      child: Icon(Icons.cancel,size:size.height*0.03,color: Colors.black54,),

                                    ),
                                  ),
                                )
                              ],
                            )
                                :
                            IconButton(
                              onPressed: () async {
                                await UtilityFunctions().imagePicker().then((value) async {
                                  if(value.isNotEmpty){
                                  //   setState(() {
                                  //     photoPath.add(value.toString());
                                  //     productPhotoCounter++;
                                  //   });

                                    File imageFile = File(value.toString());
                                    int fileSize = await imageFile.length();

                                    if (fileSize <= 1024 * 1024) {
                                      setState(() {
                                        print("FileSize success....... $fileSize");
                                        photoPath.add(value.toString());
                                        productPhotoCounter++;
                                      });

                                    } else {

                                     UtilityFunctions().errorToast("Please select the image less than or equal to 1 mb ");
                                     print("FileSize....... $fileSize");
                                    }
                                  }

                                });
                              },
                              icon: Icon(CupertinoIcons.add,size:size.height*0.04,),

                            )
                        );

                      },),
                    ),
                    // SizedBox(
                    //   height: size.height * 0.01,
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         AutoSizeText("Product Condition",
                    //           style:GoogleFonts.openSans(
                    //               color: Colors.black,
                    //               fontSize:  size.height*0.02,
                    //               fontWeight: FontWeight.w500
                    //           ) ,
                    //         ),
                    //         SizedBox(
                    //           height: size.height*0.01,
                    //         ),
                    //         Container(
                    //
                    //           height: size.height*0.06,
                    //           width: size.width*0.45,
                    //           decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                    //               border: Border.all(color: Colors.black45)
                    //           ),
                    //           child: Padding(
                    //             padding: EdgeInsets.only(left: size.height*0.01),
                    //             child: TextField(
                    //               controller: prodConditionController,
                    //               decoration:  InputDecoration(
                    //                 border: InputBorder.none,
                    //                 hintText: "Product Condition",
                    //                 hintStyle: GoogleFonts.openSans(
                    //                     color: Colors.black54
                    //                 ),
                    //
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //     Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         AutoSizeText("Product Age",
                    //           style:GoogleFonts.openSans(
                    //               color: Colors.black,
                    //               fontSize:  size.height*0.018,
                    //               fontWeight: FontWeight.w500
                    //           ) ,
                    //         ),
                    //         SizedBox(
                    //           height: size.height*0.01,
                    //         ),
                    //         Container(
                    //
                    //           height: size.height*0.06,
                    //           width: size.width*0.45,
                    //           decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                    //               border: Border.all(color: Colors.black45)
                    //           ),
                    //           child: Padding(
                    //             padding: EdgeInsets.only(left: size.height*0.01),
                    //             child: TextField(
                    //               controller: ageController,
                    //               decoration:  InputDecoration(
                    //                 border: InputBorder.none,
                    //                 hintText: "Product Age",
                    //                 hintStyle: GoogleFonts.openSans(
                    //                     color: Colors.black54
                    //                 ),
                    //
                    //
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       ],
                    //     )
                    //
                    //   ],
                    // ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText("Clothing Type",
                              style:GoogleFonts.openSans(
                                  color: Colors.black,
                                  fontSize:  size.height*0.018,
                                  fontWeight: FontWeight.w500
                              ) ,
                            ),
                            SizedBox(
                              height: size.height*0.01,
                            ),
                            Container(

                              height: size.height*0.06,
                              width: size.width*0.45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                                  border: Border.all(color: Colors.black45)
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: size.height*0.01),
                                child: TextField(
                                  controller: clothTypeController,
                                  onChanged: (value){
                                    clothTypeController.text=value;
                                    setState(() {

                                    });
                                  },
                                  decoration:  InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Clothing Type",
                                    hintStyle: GoogleFonts.openSans(
                                        color: Colors.black54
                                    ),



                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText("Fabric",
                              style:GoogleFonts.openSans(
                                  color: Colors.black,
                                  fontSize:  size.height*0.018,
                                  fontWeight: FontWeight.w500
                              ) ,
                            ),
                            SizedBox(
                              height: size.height*0.01,
                            ),
                            Container(

                              height: size.height*0.06,
                              width: size.width*0.45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                                  border: Border.all(color: Colors.black45)
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: size.height*0.01),
                                child: TextField(
                                  controller: fabricController,
                                  onChanged: (value){
                                    fabricController.text=value;
                                    setState(() {

                                    });
                                  },
                                  decoration:  InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Fabric",
                                    hintStyle: GoogleFonts.openSans(
                                        color: Colors.black54
                                    ),


                                  ),
                                ),
                              ),
                            ),
                          ],
                        )

                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText("Print or Pattern Type ",
                              style:GoogleFonts.openSans(
                                  color: Colors.black,
                                  fontSize:  size.height*0.018,
                                  fontWeight: FontWeight.w500
                              ) ,
                            ),
                            SizedBox(
                              height: size.height*0.01,
                            ),
                            Container(

                              height: size.height*0.06,
                              width: size.width*0.45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                                  border: Border.all(color: Colors.black45)
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: size.height*0.01),
                                child: TextField(
                                  controller: printController,
                                  onChanged: (value){
                                    printController.text=value;
                                    setState(() {

                                    });
                                  },
                                  decoration:  InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Print",
                                    hintStyle: GoogleFonts.openSans(
                                        color: Colors.black54
                                    ),


                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText("Border",
                              style:GoogleFonts.openSans(
                                  color: Colors.black,
                                  fontSize:  size.height*0.018,
                                  fontWeight: FontWeight.w500
                              ) ,
                            ),
                            SizedBox(
                              height: size.height*0.01,
                            ),
                            Container(

                              height: size.height*0.06,
                              width: size.width*0.45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                                  border: Border.all(color: Colors.black45)
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: size.height*0.01),
                                child: TextField(
                                  controller: borderController,
                                  onChanged: (value){
                                    borderController.text=value;
                                    setState(() {

                                    });
                                  },
                                  decoration:  InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Border",
                                    hintStyle: GoogleFonts.openSans(
                                        color: Colors.black54
                                    ),


                                  ),
                                ),
                              ),
                            ),
                          ],
                        )

                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),


                    AutoSizeText("Size & Fit",
                      style:GoogleFonts.openSans
                        (
                          color: Colors.black,
                          fontSize:  size.height*0.018,
                          fontWeight: FontWeight.w500
                      ) ,
                    ),
                    SizedBox(
                      height: size.height*0.01,
                    ),
                    Container(

                      height: size.height*0.06,
                      width: size.width*0.45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                          border: Border.all(color: Colors.black45)
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: size.height*0.01),
                        child: TextField(
                          controller: sizeController,
                          onChanged: (value){
                            sizeController.text=value;
                            setState(() {

                            });
                          },
                          decoration:  InputDecoration(
                            border: InputBorder.none,
                            hintText: "Size & Fit",
                            hintStyle: GoogleFonts.openSans(
                                color: Colors.black54
                            ),


                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height*0.03,
                    ),
                    AutoSizeText("Product info",
                      style:GoogleFonts.openSans(
                          color: Colors.black,
                          fontSize:  size.height*0.018,
                          fontWeight: FontWeight.w500
                      ) ,

                    ),
                    SizedBox(
                      height: size.height*0.01,
                    ),
                    Container(

                      height: size.height*0.1,
                      width: size.width*0.94,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                          border: Border.all(color: Colors.black45)
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: size.height*0.01),
                        child: TextField(
                          maxLines: 3,
                          controller: productInfoController,
                          onChanged: (value){
                            productInfoController.text=value;
                            setState(() {

                            });
                          },
                          decoration:  InputDecoration(
                            border: InputBorder.none,
                            hintText: "Product Info",
                            hintStyle: GoogleFonts.openSans(
                                color: Colors.black54
                            ),

                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    BlocBuilder<AddProductBlo,AddProductState>(
                      builder: (context, state) {
                        return  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                height: size.height * 0.047,
                                width: size.width*0.44,
                                child:
                                (productController.text.trim().isEmpty || listDisPlayController.text.trim().isEmpty || priceController.text.trim().isEmpty
                                    || productPhotoCounter<3 ||
                                    clothTypeController.text.trim().isEmpty
                                    || fabricController.text.trim().isEmpty || printController.text.trim().isEmpty || borderController.text.trim().isEmpty || sizeController.text.trim().isEmpty
                                    || productInfoController.text.trim().isEmpty || selectedCategory.trim().isEmpty
                                )
                                    ?
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(size.height * 0.01))),
                                      backgroundColor: const Color.fromRGBO(29, 27, 32, 0.12)),
                                  onPressed: () {
                                    UtilityFunctions().errorToast("All data must be provided.");
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [


                                      AutoSizeText(
                                        "Submit",
                                        style: GoogleFonts.openSans(color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: size.height * 0.021,

                                        ),
                                      ),

                                    ],
                                  ),
                                )
                                    :
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(size.height * 0.01))),
                                      backgroundColor: const Color.fromRGBO(86, 59, 105, 1)),
                                  onPressed: ()  {
                                    if(!enable){
                                      bool userResponse=false;
                                      AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.noHeader,
                                        animType: AnimType.scale,
                                        body:  Padding(
                                          padding: EdgeInsets.all(size.width*0.03),
                                          child: const Center(
                                            child: Text(
                                              'Do you want to submit?',
                                              style: TextStyle(fontStyle: FontStyle.italic),
                                            ),
                                          ),
                                        ),
                                        btnCancelOnPress: () {

                                        },
                                        btnCancelText: "No",
                                        btnCancelColor: Colors.redAccent,
                                        btnCancelIcon: Icons.close, // You can add an icon if you like
                                        btnOkOnPress: () {
                                          userResponse=true;
                                          print("..true");
                                          // Action when "Yes" button is pressed
                                        },
                                        btnOkText: "Yes",
                                        btnOkColor: Colors.green,
                                        btnOkIcon: Icons.check, // You can add an icon if you like
                                        buttonsTextStyle: TextStyle(
                                          fontSize: size.height * 0.02,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ).show().whenComplete(() async {
                                        buttonClicked=true;
                                        enable=true;
                                        setState(() {

                                        });
                                        if(userResponse){
                                          await SellerApi().addProduct(productController.text,listDisPlayController.text,priceController.text,
                                              photoPath,prodConditionController.text,ageController.text,clothTypeController.text,fabricController.text,
                                              printController.text,borderController.text,sizeController.text,productInfoController.text,selectedCategory.toString()
                                          ).then((value) {
                                            if(value.toString()=="success"){
                                              buttonClicked=false;
                                              enable=false;
                                              setState(() {

                                              });
                                              BlocProvider.of<AddProductBlo>(context).add(UpdateProductEvent());
                                              UtilityFunctions().successToast("Product added successfully.");
                                              Navigator.pop(context);

                                            }
                                            else{
                                              buttonClicked=false;
                                              enable=false;
                                              setState(() {

                                              });
                                              UtilityFunctions().successToast(value);
                                            }
                                          });
                                        }
                                        else{
                                          buttonClicked=false;
                                          enable=false;
                                          setState(() {

                                          });
                                        }
                                      });
                                    }
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      buttonClicked
                                          ?
                                      Center(
                                        child: SizedBox(
                                          height: size.height*0.03,
                                          width: size.height*0.03,
                                          child: const CircularProgressIndicator(
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                          :
                                      AutoSizeText(
                                        "Submit",
                                        style: GoogleFonts.openSans(color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: size.height * 0.021,
                                        ),
                                      )
                                      ,

                                    ],
                                  ),
                                )
                            ),
                            SizedBox(
                                height: size.height * 0.047,
                                width: size.width*0.44,
                                child:
                                (productController.text.trim().isEmpty || listDisPlayController.text.trim().isEmpty || priceController.text.trim().isEmpty
                                    || productPhotoCounter<3 ||
                                    clothTypeController.text.trim().isEmpty
                                    || fabricController.text.trim().isEmpty || printController.text.trim().isEmpty || borderController.text.trim().isEmpty || sizeController.text.trim().isEmpty
                                    || productInfoController.text.trim().isEmpty || selectedCategory.trim().isEmpty
                                )
                                    ?
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(size.height * 0.01))),
                                      backgroundColor: const Color.fromRGBO(29, 27, 32, 0.12)),
                                  onPressed: () {
                                    UtilityFunctions().errorToast("All data must be provided.");
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [


                                      AutoSizeText(
                                        "Save & Add",
                                        style: GoogleFonts.openSans(color: Colors.white,
                                          fontWeight: FontWeight.w600,

                                        ),
                                      ),

                                    ],
                                  ),
                                )
                                    :

                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(size.height * 0.01))),
                                      backgroundColor: const Color.fromRGBO(86, 59, 105, 1)),
                                  onPressed: () async {

                                    if(!enable){
                                      buttonClick2=true;
                                      enable=true;
                                      setState(() {

                                      });
                                      await SellerApi().addProduct(productController.text,listDisPlayController.text,priceController.text,
                                          photoPath,prodConditionController.text,ageController.text,clothTypeController.text,fabricController.text,
                                          printController.text,borderController.text,sizeController.text,productInfoController.text,selectedCategory.toString()
                                      ).then((value) {
                                        if(value.toString()=="success"){

                                          BlocProvider.of<AddProductBlo>(context).add(UpdateProductEvent());
                                          UtilityFunctions().successToast("Product added successfully.");
                                          buttonClick2=false;
                                          enable=false;
                                          productController.text="";
                                          listDisPlayController.text="";
                                          priceController.text="";
                                          productPhotoCounter=0;
                                          clothTypeController.text="";
                                          fabricController.text="";
                                          printController.text="";
                                          borderController.text="";
                                          sizeController.text="";
                                          selectedCategory="";
                                          productInfoController.text="";
                                          setState(() {

                                          });
                                          // Navigator.pop(context);

                                        }
                                        else{
                                          buttonClick2=false;
                                          enable=false;
                                          setState(() {

                                          });
                                          UtilityFunctions().successToast(value);
                                        }
                                      });

                                    }
                                    // productController.text="";
                                    // listDisPlayController.text="";
                                    // priceController.text="";
                                    // productPhotoCounter=0;
                                    // clothTypeController.text="";
                                    // fabricController.text="";
                                    // printController.text="";
                                    // borderController.text="";
                                    // sizeController.text="";
                                    // selectedCategory="";
                                    // productInfoController.text="";

                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      buttonClick2
                                          ?
                                      Center(
                                        child: SizedBox(
                                          height: size.height*0.03,
                                          width: size.height*0.03,
                                          child: const CircularProgressIndicator(
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                          :
                                      AutoSizeText(
                                        "Save & Add",
                                        style: GoogleFonts.openSans(color: Colors.white,
                                            fontWeight: FontWeight.w600
                                        ),
                                      ),

                                    ],
                                  ),
                                )


                            )

                            ,
                          ],
                        );
                      },
                    )

                  ],
                ),
              ),



              SizedBox(
                height: size.height*0.02,
              )
            ],
          ),
        ),
      ),
    );
  }
}
