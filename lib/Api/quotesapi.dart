import 'dart:convert';

import '../Constraints.dart';
import 'package:http/http.dart' as http;



class QuotesApi{

  Stream<http.Response>  fetchQuotes() {

    String url= '$baseIp/api/quote/fetch-quotes-by-customers';

    return http.get(Uri.parse(url),headers: {
      "authorization":userToken
    }).asStream();
  }



  Future<String>acceptRejectQuotes(var quotesId, bool  accept_reject,  String rejection_reason,String day  )async{
    String value="";


    try{

      var url ='$baseIp/api/quote/accept-reject-quote';
      var response = await http.post(
        Uri.parse(url),
        body: jsonEncode({
          "quote_id": quotesId,
          "accept_reject": accept_reject,
          "rejection_reason":rejection_reason,
          "completion_days":day,
        }),
        headers: {
          "authorization":userToken,
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin": "*"
        },
      );
      //debanjan.d@jurysoft.com

      if(response.body!=null){

        var result=json.decode(response.body);
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