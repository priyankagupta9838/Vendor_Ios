
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Api/vendorservicesapi.dart';
import '../Product pages/SellNow.dart';
import '../Product pages/Services Pages/fetchVendorservices.dart';
import '../Product pages/Services Pages/vendorServices.dart';
import '../Product pages/addon/addonStream.dart';
import '../Product pages/fetchVendorProduct.dart';

class Listings extends StatefulWidget {
  const Listings({super.key});

  @override
  State<Listings> createState() => _ListingsState();
}

class _ListingsState extends State<Listings> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Padding(
        padding:  EdgeInsets.only(left: size.height*0.02,right: size.height*0.015,),
      child: SizedBox(
        height: size.height*1,
        width: size.width*1,
        child:   const SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VendorServices(),
              AddOnServices(),
             FetchVendorProduct()
            ],
          ),
        ),
      ),
    );
  }
}
