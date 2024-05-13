import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Constraints.dart';

class OrdersApi{
  Stream<http.Response>  allOrders() {

    String url= '$baseIp/api/order?order_status=ALL%20ORDERS';

    return http.get(Uri.parse(url),headers: {
      "authorization":userToken
    }).asStream();
  }

  Future<String>rejectOrder( orderId,  String rejectionReason, )async{
    String value="";


    try{

      var url ='$baseIp/api/order/$orderId/reject';
      var response = await http.post(
        Uri.parse(url),
        body: jsonEncode({
          "rejection_reason":rejectionReason,
        }),
        headers: {
          "authorization":userToken,
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin": "*"
        },
      );

      print(response.body);
      print(response.statusCode);

      if(response.body!=null){

        var result=json.decode(response.body);
        print(result["message"]);
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



  Future<String>acceptOrder( orderId, )async{
    String value="";


    try{

      var url ='$baseIp/api/order/$orderId/accept';
      var response = await http.post(
        Uri.parse(url),
        body: jsonEncode({
            "expected_pickup_date": "null",
            "expected_pickup_time": "null"

        }),
        headers: {
          "authorization":userToken,
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin": "*"
        },
      );

      print(response.body);
      print(response.statusCode);

      if(response.body!=null){

        var result=json.decode(response.body);
        print(result["message"]);
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