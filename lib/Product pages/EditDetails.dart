import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Account Related/account.dart';
import '../../Api/sellerApis.dart';
import '../../StateManagement/PageBloc.dart';
import '../../StateManagement/PageEvent.dart';
import '../../StateManagement/PageState.dart';
import '../../utilityfunctions.dart';



class EditProduct extends StatefulWidget {
  EditProduct({super.key,required this.productController,required this.displayController,required this.productAgeController,required this.priceController,required this.ageController,required this.prodConditionController,required this.clothTypeController,required this.sizeController,required this.borderController,required this.fabricController,required this.photoList,required this.productInfoController,required this.categoryId,required this.printController,required this.product_no,required this.productId,});
  String productController;
  String displayController;
  String productAgeController;
  String priceController;
  String prodConditionController;
  String ageController;
  String clothTypeController;
  String fabricController;
  String borderController;
  String sizeController;
  String productInfoController;
  String categoryId;
  String printController;
  List<dynamic> photoList;
  String product_no;
  String productId;


  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  TextEditingController productController=TextEditingController();
  TextEditingController displayController=TextEditingController();
  TextEditingController productAgeController=TextEditingController();
  TextEditingController priceController=TextEditingController();
  TextEditingController prodConditionController=TextEditingController();
  TextEditingController ageController=TextEditingController();
  TextEditingController clothTypeController=TextEditingController();
  TextEditingController fabricController=TextEditingController();
  TextEditingController printController=TextEditingController();
  TextEditingController borderController=TextEditingController();
  TextEditingController sizeController=TextEditingController();
  TextEditingController productInfoController=TextEditingController();
  TextEditingController productNumberController =TextEditingController();
  List<dynamic>photoList=[];
  List<dynamic> updatedPhotoList=[];
  var photoCount=0;
  bool buttonClicked=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productController.text=widget.productController;
    displayController.text=widget.displayController;
    productAgeController.text=widget.productAgeController;
    priceController.text=widget.priceController;
    prodConditionController.text=widget.prodConditionController;
    ageController.text=widget.ageController;
    clothTypeController.text=widget.clothTypeController;
    fabricController.text=widget.fabricController;
    printController.text=widget.printController;
    borderController.text=widget.borderController;
    sizeController.text=widget.sizeController;
    productInfoController.text=widget.productInfoController;
    photoList=widget.photoList;
    productNumberController.text=widget.product_no;
    photoCount=widget.photoList.length;

  }
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      }, icon:  Icon(CupertinoIcons.arrow_left,size: size.width*0.055,),

                    ),
                    AutoSizeText("Edit Product Details",

                      style:GoogleFonts.openSans(
                          color: Colors.black,
                          fontSize:  size.height*0.022,
                          fontWeight: FontWeight.w500
                      ) ,
                    ),
                    SizedBox(
                      width: size.width*0.15,
                    )
                    // BlocBuilder<AddProductBlo,AddProductState>(
                    //   builder: (context, state) {
                    //     return IconButton(
                    //         onPressed: (){
                    //
                    //           showDialog(
                    //
                    //             context: context,
                    //             builder: (context) => AlertDialog(
                    //               content: SizedBox(
                    //                   height: size.height*0.05,
                    //                   width: size.width*0.3,
                    //                   child: AutoSizeText("Are you sure to Delete it?",style: GoogleFonts.openSans(
                    //                       color: Colors.black87,
                    //                       fontSize: size.height*0.02,
                    //                       fontWeight: FontWeight.w600
                    //                   ))
                    //
                    //               ),
                    //               actions: <Widget>[
                    //                 Row(
                    //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //                   children: [
                    //                     SizedBox(
                    //                       height: size.height*0.044,
                    //                       width: size.width*0.25,
                    //                       child: ElevatedButton(
                    //                           style: ElevatedButton.styleFrom(
                    //                               backgroundColor: buttonColor),
                    //                           onPressed: () async {
                    //                             await SellerApi().deleteProduct(widget.productId).then((value) {
                    //                               print(" response is ....${value.toString()}");
                    //                               if(value.toString()=="Done"){
                    //                                 BlocProvider.of<AddProductBlo>(context).add(UpdateProductEvent());
                    //                                 showDialog(
                    //                                   context: context,
                    //                                   builder: (context) => AlertDialog(
                    //                                     content: SizedBox(
                    //                                         height: size.height*0.026,
                    //                                         width: size.width*0.3,
                    //                                         child:Row(
                    //                                           children: [
                    //                                             Icon(Icons.check_circle,size: size.height*0.035,color: Colors.green,),
                    //                                             SizedBox(
                    //                                               width: size.width*0.024,
                    //                                             ),
                    //                                             AutoSizeText("Deleted",style: GoogleFonts.openSans(
                    //                                                 color: Colors.green,
                    //                                                 fontSize: size.height*0.02,
                    //                                                 fontWeight: FontWeight.w600
                    //                                             ))
                    //                                           ],
                    //                                         )
                    //
                    //                                     ),
                    //                                     actions: <Widget>[
                    //                                       SizedBox(
                    //                                         height: size.height*0.05,
                    //                                         width: size.width,
                    //                                         child: Center(
                    //                                           child: AutoSizeText("Product deleted successfully",style: GoogleFonts.openSans(
                    //                                               color: Colors.green,
                    //                                               fontSize: size.height*0.018,
                    //                                               fontWeight: FontWeight.w600
                    //                                           ),),
                    //                                         ),
                    //                                       ),
                    //                                       SizedBox(
                    //                                         height: size.height*0.02,
                    //                                       ),
                    //                                       SizedBox(
                    //                                         height: size.height*0.044,
                    //                                         width: size.width*1,
                    //                                         child: ElevatedButton(
                    //                                             style: ElevatedButton.styleFrom(
                    //                                                 backgroundColor: buttonColor),
                    //                                             onPressed: () {
                    //                                               Navigator.pop(context);
                    //                                               Navigator.pop(context);
                    //                                               Navigator.pop(context);
                    //                                               // naviagte pageView here
                    //                                             },
                    //                                             child: const Text("OK",style: TextStyle(color: Colors.black),)),
                    //                                       )
                    //                                     ],
                    //                                   ),
                    //                                 );
                    //                               }
                    //                               else{
                    //                                 showDialog(
                    //
                    //                                   context: context,
                    //                                   builder: (context) => AlertDialog(
                    //                                     content: SizedBox(
                    //                                         height: size.height*0.026,
                    //                                         width: size.width*0.3,
                    //                                         child:Row(
                    //                                           children: [
                    //                                             Icon(Icons.error_outline_outlined,size: size.height*0.035,color: Colors.red,),
                    //                                             SizedBox(
                    //                                               width: size.width*0.022,
                    //                                             ),
                    //                                             AutoSizeText("Error",style: GoogleFonts.openSans(
                    //                                                 color: Colors.red,
                    //                                                 fontSize: size.height*0.02,
                    //                                                 fontWeight: FontWeight.w600
                    //                                             ))
                    //                                           ],
                    //                                         )
                    //
                    //                                     ),
                    //                                     actions: <Widget>[
                    //                                       SizedBox(
                    //                                         height: size.height*0.05,
                    //                                         width: size.width,
                    //                                         child: Center(
                    //                                           child: AutoSizeText("Failed to Delete product.",style: GoogleFonts.openSans(
                    //                                               color: Colors.red,
                    //                                               fontSize: size.height*0.018,
                    //                                               fontWeight: FontWeight.w600
                    //                                           ),),
                    //                                         ),
                    //                                       ),
                    //                                       SizedBox(
                    //                                         height: size.height*0.02,
                    //                                       ),
                    //                                       SizedBox(
                    //                                         height: size.height*0.044,
                    //                                         width: size.width*1,
                    //                                         child: ElevatedButton(
                    //                                             style: ElevatedButton.styleFrom(
                    //                                                 backgroundColor: buttonColor),
                    //                                             onPressed: () {
                    //                                               Navigator.pop(context);
                    //                                               Navigator.pop(context);
                    //                                             },
                    //                                             child: const Text("OK",style: TextStyle(color: Colors.black),)),
                    //                                       )
                    //                                     ],
                    //                                   ),
                    //                                 );
                    //                               }
                    //                             });
                    //
                    //                           },
                    //                           child: const Text("Yes",style: TextStyle(color: Colors.black),)),
                    //                     ),
                    //                     SizedBox(
                    //                       height: size.height*0.044,
                    //                       width: size.width*0.25,
                    //                       child: ElevatedButton(
                    //                           style: ElevatedButton.styleFrom(
                    //                               backgroundColor: buttonColor),
                    //                           onPressed: () {
                    //                             Navigator.pop(context);
                    //                           },
                    //                           child: const Text("No",style: TextStyle(color: Colors.black),)),
                    //                     )
                    //                   ],
                    //                 )
                    //               ],
                    //             ),
                    //           );
                    //
                    //
                    //
                    //         }, icon: Icon(CupertinoIcons.delete,size: size.height*0.023,));
                    //   },
                    // )
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
                        controller: displayController,
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
                            contentPadding: EdgeInsets.all(size.height*0.01)
                        ),

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
                        padding: EdgeInsets.only(left: size.height*0.0000003,right: size.height*0.0000003,top:  size.height*0.02),
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 6,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5
                        ), itemBuilder: (context, index) {
                        return Container(
                            decoration:  const BoxDecoration(
                              color: Colors.grey,
                            ),
                            height: size.height*0.08,
                            child:
                            index< photoList.length
                                ?
                            Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(photoList[index]["image"]),fit: BoxFit.cover)
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: GestureDetector(
                                    onTap: ()  async {
                                      print("....");
                                      await SellerApi().deleteProductImage( photoList[index]["id"].toString()).then((value) {
                                        if(value=="success"){
                                          photoList.remove(photoList[index]);
                                          photoCount--;
                                          setState(() {

                                          });
                                        }
                                      });

                                    },
                                    child: Icon(Icons.cancel,size:size.height*0.03,color: Colors.black87,),

                                  ),
                                )
                              ],
                            )
                                :
                            Stack(
                              children: [
                                index< updatedPhotoList.length
                                    ?
                                Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image:FileImage(File(updatedPhotoList[index])),fit: BoxFit.cover
                                      )
                                  ),
                                )
                                    :
                                const SizedBox(),
                                Align(
                                  alignment:
                                  index< updatedPhotoList.length
                                      ?
                                  Alignment.topRight
                                      :
                                  Alignment.center,
                                  child: GestureDetector(
                                      onTap: () async {
                                        if(  index< updatedPhotoList.length){
                                          updatedPhotoList.remove(updatedPhotoList[index]) ;
                                          photoCount--;
                                          setState(() {

                                          });
                                        }
                                        else{
                                          await UtilityFunctions().imagePicker().then((value) {
                                            if(value.isNotEmpty){
                                              updatedPhotoList.add(value.toString());
                                              photoCount++;
                                              setState(() {
                                              });
                                            }

                                          });
                                        }
                                      },
                                      child:
                                      index< updatedPhotoList.length
                                          ?
                                      Icon(Icons.cancel,size:size.height*0.03,color: Colors.black87,)
                                          :
                                      Icon(Icons.add,size:size.height*0.055,color: Colors.black87,)


                                  ),
                                )
                              ],
                            )
                          /* index< photoList.length
                            ?
                            index< photoList.length
                            :
                            IconButton(
                              onPressed: () async {
                                await UtilityFunctions().imagePicker().then((value) {
                                  if(value.isNotEmpty){
                                    setState(() {
                                      photoList[index]=value.toString();
                                      updatedPhotoList.add(value.toString());
                                    });
                                  }

                                });
                              },
                              icon: Icon(CupertinoIcons.add,size:size.height*0.04,color: Colors.black87,),

                            )*/
                        );

                      },),
                    ),

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
                    //               decoration: const InputDecoration(
                    //                 border: InputBorder.none,
                    //
                    //
                    //
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //     // Column(
                    //     //   crossAxisAlignment: CrossAxisAlignment.start,
                    //     //   children: [
                    //     //     AutoSizeText("Product Age",
                    //     //       style:GoogleFonts.openSans(
                    //     //           color: Colors.black,
                    //     //           fontSize:  size.height*0.018,
                    //     //           fontWeight: FontWeight.w500
                    //     //       ) ,
                    //     //     ),
                    //     //     SizedBox(
                    //     //       height: size.height*0.01,
                    //     //     ),
                    //     //     Container(
                    //     //
                    //     //       height: size.height*0.06,
                    //     //       width: size.width*0.45,
                    //     //       decoration: BoxDecoration(
                    //     //           borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                    //     //           border: Border.all(color: Colors.black45)
                    //     //       ),
                    //     //       child: Padding(
                    //     //         padding: EdgeInsets.only(left: size.height*0.01),
                    //     //         child: TextField(
                    //     //           controller: ageController,
                    //     //           decoration: const InputDecoration(
                    //     //             border: InputBorder.none,
                    //     //
                    //     //
                    //     //
                    //     //           ),
                    //     //         ),
                    //     //       ),
                    //     //     ),
                    //     //   ],
                    //     // )
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
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,



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
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,



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
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,



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
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,



                                  ),
                                ),
                              ),
                            ),
                          ],
                        )

                      ],
                    ),

                    SizedBox(
                      height: size.height*0.03,
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
                      width: size.width*0.9,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                          border: Border.all(color: Colors.black45)
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: size.height*0.01),
                        child: TextField(
                          controller: sizeController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,



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

                      height: size.height*0.14,
                      width: size.width*0.9,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                          border: Border.all(color: Colors.black45)
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: size.height*0.01),
                        child: TextField(
                          maxLines: 10,
                          controller: productInfoController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,

                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    SizedBox(
                        height: size.height * 0.047,
                        child:
                        (productController.text.isEmpty || displayController.text.isEmpty || priceController.text.isEmpty
                            || prodConditionController.text.isEmpty || ageController.text.isEmpty || clothTypeController.text.isEmpty
                            || fabricController.text.isEmpty || printController.text.isEmpty || borderController.text.isEmpty || sizeController.text.isEmpty
                            || productInfoController.text.isEmpty || productNumberController.text.isEmpty ||  (photoList.length + photoCount)<3
                        )
                            ?
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(size.height * 0.01))),
                              backgroundColor: const Color.fromRGBO(29, 27, 32, 0.12)),
                          onPressed: () {
                            UtilityFunctions().errorToast("All data must be provided");
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: size.width * 0.3,
                              ),

                              AutoSizeText(
                                "Submit Changes",
                                style: GoogleFonts.openSans(color: Colors.white,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.2,
                              )
                            ],
                          ),
                        )
                            :
                        BlocBuilder<AddProductBlo,AddProductState>(
                          builder: (context, state) {
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(size.height * 0.01))),
                                  backgroundColor: const Color.fromRGBO(86, 59, 105, 1)),
                              onPressed: () {
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
                                  setState(() {

                                  });
                                  if(userResponse){
                                    await SellerApi().updateProduct(productController.text,displayController.text,widget.productAgeController,priceController.text,
                                        updatedPhotoList,prodConditionController.text,ageController.text,clothTypeController.text,fabricController.text,
                                        printController.text,borderController.text,sizeController.text,productInfoController.text,widget.categoryId,widget.productId
                                    ).then((value) {
                                      if(value.toString()=="success"){
                                        buttonClicked=false;
                                        setState(() {

                                        });
                                        BlocProvider.of<AddProductBlo>(context).add(UpdateProductEvent());
                                        UtilityFunctions().successToast("Product edited successfully");
                                          Navigator.pop(context);

                                      }
                                      else{
                                        print("Fail..........");
                                        buttonClicked=false;
                                        setState(() {

                                        });
                                        UtilityFunctions().errorToast(value.toString());
                                      }
                                    });
                                  }
                                  else{
                                    buttonClicked=false;
                                    setState(() {

                                    });
                                  }
                                });

                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: size.width * 0.3,
                                  ),
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
                                    "Submit Changes",
                                    style: GoogleFonts.openSans(color: Colors.white,
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.2,
                                  )
                                ],
                              ),
                            );
                          },
                        )
                      /*ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(size.height * 0.01))),
                            backgroundColor: const Color.fromRGBO(29, 27, 32, 0.12)),
                        onPressed: () {

                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: size.width * 0.3,
                            ),

                            AutoSizeText(
                              "Submit Details",
                              style: GoogleFonts.openSans(color: Colors.white,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.2,
                            )
                          ],
                        ),
                      ),*/
                    ),

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
