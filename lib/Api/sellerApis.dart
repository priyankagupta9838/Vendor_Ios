
import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../Constraints.dart';
class SellerApi{

  Future<String> addProduct(
      String productController,String listDisPlayController,String priceController, List<dynamic> photoPath
      ,String prodConditionController, String ageController,String clothTypeController,String fabricController,
      String printController,String borderController,String sizeController,String productInfoController,String categoryId
      ) async {
    String result="";
    String url='$baseIp/api/product/create';
    var request = http.MultipartRequest('POST', Uri.parse(url));

    print("User Token is : ${userToken}");
    request.headers['Authorization'] =userToken.toString();
    // Add text fields to the request
    request.fields['category_id'] = categoryId;
    request.fields['product_name'] = productController;
    request.fields['display_name'] = listDisPlayController;
    request.fields['price'] = priceController;
    request.fields['clothing_type'] = clothTypeController;
    request.fields['fabric'] = fabricController;
    request.fields['print_pattern_type'] = printController;
    request.fields['border'] = borderController;
    request.fields['size_fit'] = sizeController;
    request.fields['info'] =productInfoController;
    request.fields['product_condition'] = "null";
    request.fields['product_age'] = "null";
    request.fields['image_count'] = photoPath.length.toString();


    int count=1;
    for(var image in photoPath){
      request.files.add(await http.MultipartFile.fromPath(
        'image$count',
        image,
      ));
      count++;
    }
    print("....Requested...");
    try {
      var response = await request.send();
      var responseMessage = await response.stream.bytesToString();
      var responseData = jsonDecode(responseMessage);
      if (responseData["status"]=="success") {
        result="success";
      } else {
        result=responseData["message"];
        print(" Error is  ${responseData["error"]}");
      }
    } catch (error) {
      result="Fail";
      print(" Error is  ${error}");
    }

    return result;
  }


  Future<String> updateProduct(
      String productController,String displayController,String productAgeController,String priceController, List<dynamic> photoPath
      ,String prodConditionController, String ageController,String clothTypeController,String fabricController,
      String printController,String borderController,String sizeController,String productInfoController, String categoryId,String productId ,
      ) async {
    String result="";
    String url='$baseIp/api/product/$productId/update';
    var request = http.MultipartRequest('POST', Uri.parse(url));

    print("User Token is : $userToken");
    request.headers['authorization'] =userToken;
    // Add text fields to the request
    request.fields['category_id'] = categoryId;
    request.fields['product_name'] = productController;
    request.fields['display_name'] = displayController;
    request.fields['price'] = priceController;
    request.fields['product_condition'] = prodConditionController;
    request.fields['product_age'] = productAgeController;
    request.fields['clothing_type'] = clothTypeController;
    request.fields['fabric'] = fabricController;
    request.fields['print_pattern_type'] = printController;
    request.fields['border'] = borderController;
    request.fields['size_fit'] = sizeController;
    request.fields['info'] =productInfoController;
    request.fields['image_count'] = photoPath.length.toString();

print("  path length is ${photoPath.length.toString()}");

    int count=1;
    for(var image in photoPath){
      request.files.add(await http.MultipartFile.fromPath(
        'image$count',
        image,
      ));
      count++;
    }


    try {
      var response = await request.send();
      var responseMessage = await response.stream.bytesToString();
      var responseData = jsonDecode(responseMessage);


      if (responseData["status"]=="success") {
        result="success";
        print('Product added successfully');
      } else {
        result=responseData["message"];
        print(" Error is  ${responseData["error"]}");
      }
    } catch (error) {
      result="Fail";
    }

    return result;
  }



/*  Future<List<dynamic>> fetchData() async {
    var box=GetStorage();
    String userToken=box.read("UserToken");
    //String url= '$baseIp/auth/products-getall';
    String url= '$baseIp/auth/seller-products/list';
  final response = await http.get(Uri.parse(url),headers: {
    "authorization":userToken
  });
  if (response.statusCode == 200) {
    print("Data is : ${response.body}");
    Map<String,dynamic> data=json.decode(response.body);
  return data["data"];
  } else {
    return [{}];
  }
  }*/

  Stream<http.Response> fetchSellerProduct()  {

    String url= '$baseIp/api/product?selling=true&type=APPROVED';

    return http.get(Uri.parse(url),headers: {
      "authorization":userToken
    }).asStream();
  }



  Future<String>deleteProduct(String productId) async {
    String result="";
    var box=GetStorage();
    String userToken=box.read("UserToken");
   var value= await http.delete(
      Uri.parse("$baseIp/auth/products-delete"),
      body: {
        "productId":productId
      },
      headers: {
        "authorization":userToken
      });
    print(value.body);
    if (value.body != null) {
      var result = jsonDecode(value.body);

      if(result["message"]=="Product deleted successfully") {
        print(" Done.............");
        return "Done";
      }
      else{

        print(" Fail.............");
        return "Fail";
      }
    } else {
      result="Fail";
      print("Error Occurred : Response body is null.");
    }
    return result;
}

  Future<String>deleteProductImage(  String imageId)async{
    String value="";

    try{

      var url = '$baseIp/api/product/delete-image';
      var response = await http.post(
        Uri.parse(url),
        body: {
          "image_id":imageId
        },
        headers: {
          "authorization":userToken,
          "accept": "application/json",
          "Access-Control-Allow-Origin": "*"
        },
      );

      print(response.body);
      print(response.statusCode);

      if(response.body!=null){

        var result=json.decode(response.body);
        print("resulte is  : $result");
        if(result["status"]=="success"){
          value="success";
        }
        else{
          value="Fail";
        }
      }
      else{
        value="Fail";
        print(" Failed Error is : ${response.body}");
      }

    }
    catch(error){
      value="Fail";
      print(" Failed Error is : ${error}");
    }


    return value;
  }






}