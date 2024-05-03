import 'dart:convert';

import '../Constraints.dart';
import 'package:http/http.dart' as http;


class Products{
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


  Stream<http.Response> fetchStreamProductCategory()  {

    String url= '$baseIp/api/category';

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