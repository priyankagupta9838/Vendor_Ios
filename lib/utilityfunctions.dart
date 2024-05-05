import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vendor/Constraints.dart';
import 'dart:io';
class UtilityFunctions {
  Future<String> imagePicker() async {
    String filePath = "";
    ImagePicker imagePicker = ImagePicker();
    print(imagePicker);
    XFile? file = await imagePicker.pickImage(
        source: ImageSource.gallery);
    print(file?.path);
    if (file!.path.isNotEmpty) {
      filePath = file.path;
    }
    return filePath;
  }

  Future errorScreen(BuildContext context, String errorString) {
    Size size = MediaQuery
        .of(context)
        .size;
    return AwesomeDialog(
      context: context,
      animType: AnimType.scale,
      //dialogType: DialogType.error,
      body: Padding(
        padding: EdgeInsets.all(size.width * 0.02),
        child: Center(child: AutoSizeText(
          errorString,
          style: GoogleFonts.openSans(
              color: Colors.black,
              fontSize: size.height * 0.018
          ),
        ),),
      ),
      btnOkOnPress: () {},
      btnOkColor: Colors.redAccent,
      buttonsTextStyle: GoogleFonts.openSans(
          fontWeight: FontWeight.w400,
          fontSize: size.height * 0.02,
          color: Colors.white
      ),
      dismissOnBackKeyPress: true,
      customHeader: Icon(
        Icons.error_outline, color: Colors.red, size: size.height * 0.1,),
    ).show();
  }

  Future successScreen(BuildContext context, String message) {
    Size size = MediaQuery
        .of(context)
        .size;
    return AwesomeDialog(
      context: context,
      animType: AnimType.scale,
      //dialogType: DialogType.error,
      body: Padding(
        padding: EdgeInsets.all(size.width * 0.02),
        child: Center(child: AutoSizeText(
          message,
          style: GoogleFonts.openSans(
              color: Colors.black,
              fontSize: size.height * 0.018
          ),
        ),),
      ),
      btnOkOnPress: () {},
      btnOkColor: Colors.green,
      buttonsTextStyle: GoogleFonts.openSans(
          fontWeight: FontWeight.w400,
          fontSize: size.height * 0.02,
          color: Colors.white
      ),
      dismissOnBackKeyPress: true,
      customHeader: Icon(
        Icons.check_circle, color: Colors.green, size: size.height * 0.1,),
    ).show();
  }

  void errorToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black87.withOpacity(0.7),
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void successToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black87.withOpacity(0.7),
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }







  /*Future<void> createChannel(String userId, String userName, String userEmail,
      String serviceTypeName) async {
    String downloadUrl="";
    Reference reference =
    FirebaseStorage.instance.ref();
    Reference imageDirectory =
    reference.child("MykanjeeShopImages");
    //String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference imageFolder = imageDirectory.child("${userModel["id"].toString()}-$userId").child("shopImage");
    print(" if condition nnnnnnnnnnnnnnnnn$imageFolder");
    await imageFolder
        .putFile(File(userModel["vendor_details"]["shop_image"].toString())).whenComplete(() async {
      print("mmmmmmmmmmmmmmm................   $imageFolder");
      downloadUrl =
      await imageFolder.getDownloadURL().whenComplete(() async {
        await FirebaseFirestore.instance
            .collection("Users")
            .doc(userModel["id"].toString())
            .get().then((value) async {
          if (value.data() == null) {
            await FirebaseFirestore.instance
                .collection("Users")
                .doc(userModel["id"].toString())
                .set(

                {
                  "Channels": [
                    {
                      "channel name": "${userModel["id"].toString()}-$userId",
                      "vendorId": userModel["id"].toString(),
                      "vendor name": "${userModel["fullname"]}",
                      "vendor email": userModel["email"],
                      "vendor shopName": userModel["vendor_details"]["shop_name"]
                          .toString(),
                      "vendor shopImage": downloadUrl,

                      "vendor service": userModel["vendor_details"]["service_type"]
                          .toString(),
                      "vendor serviceTypeName": serviceTypeName,
                      "userId": userId,
                      "userName": userName,
                      "userEmail": userEmail,
                      "createdAt": DateTime.now(),
                    }
                  ],
                  "Chat Channels": [
                    "${userModel["id"].toString()}-$userId"
                  ],

                }
            ).whenComplete(() async {
              await FirebaseFirestore.instance
                  .collection("Users")
                  .doc(userId)
                  .set(

                  {
                    "Channels": [
                      {
                        "channel name": "${userModel["id"].toString()}-$userId",
                        "vendorId": userModel["id"].toString(),
                        "vendor name": "${userModel["fullname"]}",
                        "vendor email": userModel["email"],
                        "vendor shopName": userModel["vendor_details"]["shop_name"]
                            .toString(),
                        "vendor shopImage": downloadUrl,

                        "vendor service": userModel["vendor_details"]["service_type"]
                            .toString(),
                        "vendor serviceTypeName": serviceTypeName,
                        "userId": userId,
                        "userName": userName,
                        "userEmail": userEmail,
                        "createdAt": DateTime.now(),
                      }
                    ],
                    "Chat Channels": [
                      "${userModel["id"].toString()}-$userId"
                    ],
                  }
              );
            });
          }
          else {
            if (value.data()?["Chat Channels"] != null &&
                value.data()?["Chat Channels"].contains(
                    "${userModel["id"].toString()}-$userId")) {

            }
            else {
              await FirebaseFirestore.instance
                  .collection("Users")
                  .doc(userModel["id"].toString())
                  .update(
                  {

                    "Channels":

                    FieldValue.arrayUnion([
                      {
                        "channel name": "${userModel["id"].toString()}-$userId",
                        "vendorId": userModel["id"].toString(),
                        "vendor name": "${userModel["fullname"]}",
                        "vendor email": userModel["email"],
                        "vendor shopName": userModel["vendor_details"]["shop_name"]
                            .toString(),
                        "vendor shopImage": downloadUrl,

                        "vendor service": userModel["vendor_details"]["service_type"]
                            .toString(),
                        "vendor serviceTypeName": serviceTypeName,
                        "userId": userId,
                        "userName": userName,
                        "userEmail": userEmail,
                        "createdAt": DateTime.now(),
                      }
                    ]),


                    "Chat Channels": FieldValue.arrayUnion(
                        [ "${userModel["id"].toString()}-$userId"])
                  }


              ).whenComplete(() async {
                if (value.data()?["Chat Channels"] != null &&
                    value.data()?["Chat Channels"].contains(
                        "${userModel["id"].toString()}-$userId")) {

                }
                else {
                  await FirebaseFirestore.instance
                      .collection("Users")
                      .doc(userId)
                      .update(

                      {

                        "Channels": FieldValue.arrayUnion([
                          {
                            "channel name": "${userModel["id"]
                                .toString()}-$userId",
                            "vendorId": userModel["id"].toString(),
                            "vendor name": "${userModel["fullname"]}",
                            "vendor email": userModel["email"],
                            "vendor shopName": userModel["vendor_details"]["shop_name"]
                                .toString(),
                            "vendor shopImage": downloadUrl,

                            "vendor service": userModel["vendor_details"]["service_type"]
                                .toString(),
                            "vendor serviceTypeName": serviceTypeName,
                            "userId": userId,
                            "userName": userName,
                            "userEmail": userEmail,
                            "createdAt": DateTime.now(),
                          }
                        ]),


                        "Chat Channels": FieldValue.arrayUnion(
                            [ "${userModel["id"].toString()}-$userId"])
                      }
                  );
                }
              });
            }
          }
        });
      });
    });
  }*/







  Future<void> createChannel(String userId, String userName, String userEmail,
      String serviceTypeName) async {
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(userModel["id"].toString())
        .get().then((value) async {
      if (value.data() == null) {
        await FirebaseFirestore.instance
            .collection("Users")
            .doc(userModel["id"].toString())
            .set(

            {
              "Channels": [
                {
                  "channel name": "${userModel["id"].toString()}-$userId",
                  "vendorId": userModel["id"].toString(),
                  "vendor name": "${userModel["fullname"]}",
                  "vendor email": userModel["email"],
                  "vendor shopName": userModel["vendor_details"]["shop_name"]
                      .toString(),
                  "vendor shopImage": userModel["vendor_details"]["shop_image"]
                      .toString(),

                  "vendor service": userModel["vendor_details"]["service_type"]
                      .toString(),
                  "vendor serviceTypeName": serviceTypeName,
                  "userId": userId,
                  "userName": userName,
                  "userEmail": userEmail,
                  "createdAt": DateTime.now(),
                }
              ],
              "Chat Channels": [
                "${userModel["id"].toString()}-$userId"
              ],

            }
        ).whenComplete(() async {
          await FirebaseFirestore.instance
              .collection("Users")
              .doc(userId)
              .set(

              {
                "Channels": [
                  {
                    "channel name": "${userModel["id"].toString()}-$userId",
                    "vendorId": userModel["id"].toString(),
                    "vendor name": "${userModel["fullname"]}",
                    "vendor email": userModel["email"],
                    "vendor shopName": userModel["vendor_details"]["shop_name"]
                        .toString(),
                    "vendor shopImage": userModel["vendor_details"]["shop_image"]
                        .toString(),

                    "vendor service": userModel["vendor_details"]["service_type"]
                        .toString(),
                    "vendor serviceTypeName": serviceTypeName,
                    "userId": userId,
                    "userName": userName,
                    "userEmail": userEmail,
                    "createdAt": DateTime.now(),
                  }
                ],
                "Chat Channels": [
                  "${userModel["id"].toString()}-$userId"
                ],
              }
          );
        });
      }
      else {
        if (value.data()?["Chat Channels"] != null &&
            value.data()?["Chat Channels"].contains(
                "${userModel["id"].toString()}-$userId")) {

        }
        else {
          await FirebaseFirestore.instance
              .collection("Users")
              .doc(userModel["id"].toString())
              .update(
              {

                "Channels":

                FieldValue.arrayUnion([
                  {
                    "channel name": "${userModel["id"].toString()}-$userId",
                    "vendorId": userModel["id"].toString(),
                    "vendor name": "${userModel["fullname"]}",
                    "vendor email": userModel["email"],
                    "vendor shopName": userModel["vendor_details"]["shop_name"]
                        .toString(),
                    "vendor shopImage": userModel["vendor_details"]["shop_image"]
                        .toString(),

                    "vendor service": userModel["vendor_details"]["service_type"]
                        .toString(),
                    "vendor serviceTypeName": serviceTypeName,
                    "userId": userId,
                    "userName": userName,
                    "userEmail": userEmail,
                    "createdAt": DateTime.now(),
                  }
                ]),


                "Chat Channels": FieldValue.arrayUnion(
                    [ "${userModel["id"].toString()}-$userId"])
              }


          ).whenComplete(() async {
            if (value.data()?["Chat Channels"] != null &&
                value.data()?["Chat Channels"].contains(
                    "${userModel["id"].toString()}-$userId")) {

            }
            else {
              await FirebaseFirestore.instance
                  .collection("Users")
                  .doc(userId)
                  .update(

                  {

                    "Channels": FieldValue.arrayUnion([
                      {
                        "channel name": "${userModel["id"].toString()}-$userId",
                        "vendorId": userModel["id"].toString(),
                        "vendor name": "${userModel["fullname"]}",
                        "vendor email": userModel["email"],
                        "vendor shopName": userModel["vendor_details"]["shop_name"]
                            .toString(),
                        "vendor shopImage": userModel["vendor_details"]["shop_image"]
                            .toString(),

                        "vendor service": userModel["vendor_details"]["service_type"]
                            .toString(),
                        "vendor serviceTypeName": serviceTypeName,
                        "userId": userId,
                        "userName": userName,
                        "userEmail": userEmail,
                        "createdAt": DateTime.now(),
                      }
                    ]),


                    "Chat Channels": FieldValue.arrayUnion(
                        [ "${userModel["id"].toString()}-$userId"])
                  }
              );
            }
          });
        }
      }
    }
    );
  }



  Future<void>checkNotificationPermission()async{
    PermissionStatus status = await Permission.notification.status;

    if (!status.isGranted) {
      status = await Permission.notification.request();
    }
  }

}
