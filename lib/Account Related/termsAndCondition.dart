import 'dart:convert';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vendor/Constraints.dart';

import '../Api/Authentication Api.dart';
import 'onlinePdfViewer.dart';

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    Size size=MediaQuery.of(context).size;
    TextStyle content=GoogleFonts.openSans(
        decoration: TextDecoration.none,
        fontSize:size.height*0.018,
        fontWeight: FontWeight.w400,
        color: const Color.fromRGBO(28, 28, 30, 1)
    );
    return Scaffold(

      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.purple.shade50,
          title: AutoSizeText("Terms and conditions",style: GoogleFonts.cabin(
            fontWeight: FontWeight.w500,
            fontSize: size.height*0.025,
            color: Colors.black87
          ),)),
      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.white,
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: OnlinePdfViewer(
                url:"$baseIp/api/static-properties/seller-terms-and-conditions")

          /*StreamBuilder(
              stream:Authentication().termsAndConditions(),
              builder: (context, snapshot) {
                if( snapshot.hasData ){
                  var data=jsonDecode(snapshot.data!.body);
                   print(data["data"][0]["property_value"].toString());

                  return snapshot.data?.statusCode==200
                      ?
                  SizedBox(
                    height: size.height*1,
                     width: size.width*1,
                     child:
                     data["data"][0]["property_value"].toString() !="" &&  data["data"][0]["property_value"] != null &&  !data["data"][0]["property_value"].toString().contains(".pdf")
                      ?

                     Image.network(data["data"][0]["property_value"],fit: BoxFit.fill)
                    :
                     SizedBox(

                         height: size.height*1,
                         width: size.width*1,
                         child:  OnlinePdfViewer(
                           url:data["data"][0]["property_value"].toString())
                     ),



                  )
                      :
                  Center(
                    child: SizedBox(
                      child: AutoSizeText("Server Error.",
                        style: GoogleFonts.openSans(
                            color: Colors.black,
                            fontSize: size.height*0.018,
                            fontWeight: FontWeight.w500
                        ),),
                    ),
                  );
                }
                else{
                  return  const Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  );
                }
              },)*/


          // Padding(
          //   padding:  EdgeInsets.only(left: size.width*0.02,right: size.width*0.02,bottom: size.width*0.1),
          //   child: Column(
          //     children: [
          //       SizedBox(
          //         height: size.height*0.05,
          //       ),
          //       Container(
          //         color: const Color.fromRGBO(247, 244, 249, 1),
          //         height: size.height*0.07,
          //         child: Row(
          //           children: [
          //             IconButton(
          //                 onPressed: (){
          //                   Navigator.pop(context);
          //                 },
          //                 icon: const Icon(CupertinoIcons.arrow_left) ),
          //             SizedBox(width: size.width*0.13,),
          //             AutoSizeText("Terms and Conditions",style: GoogleFonts.openSans(
          //                 decoration:TextDecoration.none ,
          //                 color: Colors.black,
          //                 fontWeight: FontWeight.w600,
          //                 fontSize: size.height*0.024
          //
          //             ),),
          //
          //
          //           ],
          //         ),
          //
          //       ),
          //       SizedBox(
          //         height: size.height*0.022,
          //       ),
          //       SizedBox(
          //         width: size.width*0.95,
          //         child: AutoSizeText(
          //             "Thank you for using our e-commerce multi-vendor application (C2B). This Privacy Policy outlines how we collect, use, and safeguard your personal information. By accessing or using the Platform, you consent to the practices described in this policy.",
          //             style:content
          //         ),
          //       ),
          //       SizedBox(
          //         height: size.height*0.022,
          //       ),
          //       SizedBox(
          //         width: size.width*0.95,
          //         child: AutoSizeText(
          //             " 1. Information Collection: We collect information you provide when you register an account, make purchases, or interact with the Platform. This may include your name, contact details, payment information, and browsing activity.",
          //             style:content
          //         ),
          //       ),
          //
          //       SizedBox(
          //         height: size.height*0.022,
          //       ),
          //       SizedBox(
          //         width: size.width*0.95,
          //         child: AutoSizeText(
          //             "2. Use of Information: We use your information to process orders, improve our services, and personalize your experience. This includes sending order notifications, recommendations, and updates.",
          //             style:content
          //         ),
          //       ),
          //
          //       SizedBox(
          //         height: size.height*0.022,
          //       ),
          //       SizedBox(
          //         width: size.width*0.95,
          //         child: AutoSizeText(
          //             "3. Data Security: We implement security measures to protect your data from unauthorized access, alteration, or disclosure. However, no online platform can guarantee complete security.",
          //             style:content
          //         ),
          //       ),
          //       SizedBox(
          //         height: size.height*0.022,
          //       ),
          //       SizedBox(
          //         width: size.width*0.95,
          //         child: AutoSizeText(
          //             "4. Third-Party Services: We may use third-party services for payment processing, analytics, and marketing. These services have their own privacy policies, and we encourage you to review them.",
          //             style:content
          //         ),
          //       ),
          //       SizedBox(
          //         height: size.height*0.022,
          //       ),
          //       SizedBox(
          //         width: size.width*0.95,
          //         child: AutoSizeText(
          //             "5. Cookies and Tracking Technologies: We use cookies and similar technologies to enhance your experience on the Platform. You can manage your preferences regarding these technologies",
          //             style:content
          //         ),
          //       ),
          //       SizedBox(
          //         height: size.height*0.022,
          //       ),
          //       SizedBox(
          //         width: size.width*0.95,
          //         child: AutoSizeText(
          //             "6. User Content: Content you share on the Platform, such as reviews and comments, may be visible to others. Please be cautious when sharing personal information.",
          //             style:content
          //         ),
          //       ),
          //       SizedBox(
          //         height: size.height*0.022,
          //       ),
          //       SizedBox(
          //         width: size.width*0.95,
          //         child: AutoSizeText(
          //             "7. Children's Privacy: The Platform is not intended for children under the age of [X]. We do not knowingly collect or store information from children.",
          //             style:content
          //         ),
          //       ),
          //       SizedBox(
          //         height: size.height*0.022,
          //       ),
          //       SizedBox(
          //         width: size.width*0.95,
          //         child: AutoSizeText(
          //             "8. Your Choices: You can update your account information, manage communication preferences, and delete your account. Please note that certain information may be retained for legal purposes.",
          //             style:content
          //         ),
          //       ),
          //       SizedBox(
          //         height: size.height*0.022,
          //       ),
          //       SizedBox(
          //         width: size.width*0.95,
          //         child: AutoSizeText(
          //             "9. Changes to Privacy Policy: We may update this Privacy Policy to reflect changes in our practices. We will notify you of significant changes through the Platform or other means.",
          //             style:content
          //         ),
          //       ),
          //       SizedBox(
          //         height: size.height*0.022,
          //       ),
          //       SizedBox(
          //         width: size.width*0.95,
          //         child: AutoSizeText(
          //             "10. Contact Us: If you have questions or concerns about our Privacy Policy, please contact our customer support team.",
          //             style:content
          //         ),
          //       ),
          //
          //
          //     ],
          //   ),
          // ),
        ),
      ),
    );
  }
}
