import 'dart:convert';

import '../Constraints.dart';
import 'package:http/http.dart' as http;


class ShopDetailApi{


  Future<String>addShopDetails( Map<String,dynamic>userShopData) async {
   print(userShopData);
    String result="";
    String url='$baseIp/auth/shop/details';
    var request = http.MultipartRequest('POST', Uri.parse(url));

    print("User Token is : $userToken");

    request.headers['authorization'] =userToken.toString();
    // Add text fields to the request
   print(userShopData["shopCoverPhoto"]);
    request.files.add(
        await http.MultipartFile.fromPath(
          'shopCoverPhoto',
          userShopData["shopCoverPhoto"].toString(),
          
        ));

   for(var path in userShopData["portfolioShop"] ){

     request.files.add(
         await http.MultipartFile.fromPath(
           'portfolioShop',
           path.toString()
         ));

   }
   request.files.add(
       await http.MultipartFile.fromPath(
         'docOne',
         userShopData["docOne"].toString(),
       ));
   request.files.add(
       await http.MultipartFile.fromPath(
         'docTwo',
         userShopData["docTwo"].toString(),
       ));
    request.fields['shopName'] = userShopData["shopName"].toString();
    request.fields['shopLocation'] = userShopData["shopLocation"].toString();
    request.fields['uniquesness'] = userShopData["uniquesness"].toString();
    request.fields['termOne'] = userShopData["termOne"].toString();
    request.fields['termTwo'] = userShopData["termTwo"].toString();

    try {


      var response = await request.send();
      var responseMessage = await response.stream.bytesToString();
      var responseData = jsonDecode(responseMessage);


      if (responseData["message"]!=null) {

        result="Done";
        print('Data added successfully');
      } else {
        result="Fail";
        print(" Error is  ${responseData["error"]}");
      }
    } catch (error) {
      print(error);
      result="Fail";
    }

    return result;

  }


  Future<String>editShopDetails( Map<String,dynamic>userShopData,String shopId) async {
    print(userShopData);
    String result="";
    String url='$baseIp/api/user/vendor-update';
    var request = http.MultipartRequest('POST', Uri.parse(url));

    print("User Token is : $userToken");

    request.headers['authorization'] =userToken.toString();
    // Add text fields to the request
    print(userShopData["shopCoverPhoto"]);
    request.files.add(
        await http.MultipartFile.fromPath(
          'shopCoverPhoto',
          userShopData["shopCoverPhoto"].toString(),

        ));

    for(var path in userShopData["portfolioShop"] ){

      request.files.add(
          await http.MultipartFile.fromPath(
              'portfolioShop',
              path.toString()
          ));

    }
    request.files.add(
        await http.MultipartFile.fromPath(
          'docOne',
          userShopData["docOne"].toString(),
        ));
    request.files.add(
        await http.MultipartFile.fromPath(
          'docTwo',
          userShopData["docTwo"].toString(),
        ));
    request.fields['shopName'] = userShopData["shopName"].toString();
    request.fields['shopLocation'] = userShopData["shopLocation"].toString();
    request.fields['uniquesness'] = userShopData["uniquesness"].toString();
    request.fields['termOne'] = userShopData["termOne"].toString();
    request.fields['termTwo'] = userShopData["termTwo"].toString();

    try {


      var response = await request.send();
      var responseMessage = await response.stream.bytesToString();
      var responseData = jsonDecode(responseMessage);

      if (responseData["message"]!=null) {

        result="Done";
        print('Data added successfully');
      } else {
        result="Fail";
        print(" Error is  ${responseData["error"]}");
      }
    } catch (error) {
      print(error);
      result="Fail";
    }

    return result;

  }






  /*Future<List<dynamic>> fetchProductCategory() async {

    String url= '$baseIp/auth/category-getall';
    final response = await http.get(Uri.parse(url),headers: {
      "authorization":userToken
    });
    if (response.statusCode == 200) {
      print("Data is : ${response.body}");
      Map<String,dynamic> data=json.decode(response.body);
      print("Categories is : ${data}");
      return data["data"];
    } else {
      return [{}];
    }
  }*/


  Stream<http.Response> getShopDetails()  {

    String url= '$baseIp/api/account/get-shop-details';

     return http.get(Uri.parse(url),headers: {
              "authorization":userToken
          }).asStream();
    }

  Stream<http.Response> fetchStreamProductOfIndividualCategory(String productNo)  {

    String url= '$baseIp/auth/products-get/$productNo';

    return http.get(Uri.parse(url),headers: {
      "authorization":userToken
    }).asStream();
  }

}