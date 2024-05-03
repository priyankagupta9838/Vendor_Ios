import 'dart:convert';
import 'package:http/http.dart'as http;

import '../Constraints.dart';

class VendorServicesApi{

  Stream<http.Response> fetchingServicesType()  {

    String url= '$baseIp/api/services/fetch-service-type';

    return http.get(Uri.parse(url),headers: {
      "authorization":userToken
    }).asStream();
  }


  Stream<http.Response> fetchStitchingServices(String servicetypeId)  {

    String url= '$baseIp/api/vendor-services?service_type_id=$servicetypeId';

    return http.get(Uri.parse(url),headers: {
      "authorization":userToken
    }).asStream();
  }


  Future<String>addVendorServiceActiveInactive(String vendorServiceId,bool status,bool isAddon)async{
    String value="";


    try{

      var url =
          isAddon
      ?
          '$baseIp/api/vendor-services/active-inactive-addon'
              :
          '$baseIp/api/vendor-services/active-inactive-service';
      var response = await http.post(
        Uri.parse(url),
        body: jsonEncode(
          isAddon
          ?
          {
            "vendor_service_addon_id": vendorServiceId,
            "status": status
          }
          :
          {
            "vendor_service_id": vendorServiceId,
            "status": status
          }
        ),
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
        //print(result["message"]);
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




  Future<String>addVendorServices(String serviceTypeId, String clothingItemType,  String setServicePrice)async{
    String value="";


    try{

      var url ='$baseIp/api/vendor-services/add';
      var response = await http.post(
        Uri.parse(url),
        body: jsonEncode({
          "service_type_id": serviceTypeId,
          "meterial_type": "null",
           "clothing_item_type": clothingItemType.toString(),
          "price":int.parse(setServicePrice.toString()),
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
        //print(result["message"]);
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

  Future<String>addVendorRestorationServices(String serviceTypeId, String  clothingItemName,    String setServicePrice)async{
    String value="";


    try{

      var url ='$baseIp/api/vendor-services/add';
      var response = await http.post(
        Uri.parse(url),
        body: jsonEncode({
          "service_type_id": serviceTypeId,
          "meterial_type": clothingItemName.toString(),
          "clothing_item_type": "null",
          "price": int.parse(setServicePrice.toString()),
        }),
        headers: {
          "authorization":userToken,
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin": "*"
        },
      );



      if(response.body!=null){

        var result=json.decode(response.body);
        // print(result["message"]);
        // print("resulte is  : $result");
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



  Stream<http.Response> fetchAddOnServices(String serviceTypeId )  {

    String url= '$baseIp/api/vendor-services/addon?service_type_id=$serviceTypeId';

    return http.get(Uri.parse(url),headers: {
      "authorization":userToken
    }).asStream();
  }


  Future<String>addOnServices(String serviceTypeId,  String addOnName ,String addDescription,  String setServicePrice)async{
    String value="";


    try{

      var url ='$baseIp/api/vendor-services/create-addon';
      var response = await http.post(
        Uri.parse(url),
        body: jsonEncode({
          "service_type_id": serviceTypeId,
          "addon_name": addOnName,
          "addon_desc": addDescription.toString(),
          "price":int.parse(setServicePrice.toString()),
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
        //print(result["message"]);
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






  Future<String>editVendorServices()async{
    String value="";

    try{

      var url ='$baseIp/';
      var response = await http.post(
        Uri.parse(url),
        body: jsonEncode({
          "service_type_id": 2,
          "material_type": "string",
          "clothing_item_type": "string",
          "price": 0
        }),
        headers: {
          "authorization":userToken,
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin": "*"
        },
      );

      // print(response.body);
      // print(response.statusCode);

      if(response.body!=null){

        var result=json.decode(response.body);
        // print("resulte is  : $result");
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