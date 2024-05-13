import 'dart:convert';
import '../Constraints.dart';
import 'package:http/http.dart' as http;
class UserAccount{

  Future<String>addDetails( Map<String,dynamic>userData) async {

    String value="";
    try{

      Map data = {
        "first_name":userData["firstName"].toString() ,
        "last_name":userData["lastName"].toString(),
        "phone": userData["mobileNumber"].toString(),
        "alt_phone": userData["alternativeMobile"].toString(),
        "email": userData["email"].toString()
      };

      String body = json.encode(data);
      var url = '$baseIp/api/user/add-profile-details';
      var response = await http.post(
        Uri.parse(url),
        body: body,
        headers: {
          "Authorization":userToken.toString(),
          "Content-Type": "application/json",
          "accept": "application/json",
          "Access-Control-Allow-Origin": "*"
        },
      );
      print("......${response.body}");
      print(response.statusCode);
      var result=jsonDecode(response.body);
      if(result["status"]=="success"){
        value="success";
      }
      else {
        if(result["message"]=="Username already registered. Try logging in."){
          value="Username already registered. Try logging in.";
        }
        else{
          value="error";
        }
      }
    }
    catch(error){
      value=error.toString();
    }


    return value;

  }

  Future<String>addProfileDetails( Map<String,dynamic>userData ) async {

    String value="";
    try{
      Map data ={
        "first_name":userData["firstName"].toString() ,
        "last_name":userData["lastName"].toString(),
        "phone": userData["mobileNumber"].toString(),
        "alt_phone": userData["alternativeMobile"].toString(),
        "email": userData["email"].toString()
      };

      String body = json.encode(data);
      var url = '$baseIp/api/user/add-profile-details';
      var response = await http.post(
        Uri.parse(url),
        body: body,
        headers: {
          "Authorization":userToken.toString(),
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin": "*"
        },
      );
      print("......Add profile details ..${response.body}");
      print(response.statusCode);
      var result=jsonDecode(response.body);
      if(result["status"]=="success"){
        value="success";
      }
      else {
        value=result["message"];
      }
    }
    catch(error){
      value=error.toString();
    }


    return value;

  }


  Future<String>updateProfileDetails( Map<String,dynamic>userData) async {

    String value="";

    try{
      Map data ={
        "profile_id":int.parse(userData["profile_id"]),
        "first_name":userData["firstName"].toString() ,
        "last_name":userData["lastName"].toString(),
        "phone": userData["mobileNumber"].toString(),
        "alt_phone": userData["alternativeMobile"].toString(),
        "email": userData["email"].toString()
      };

      String body = json.encode(data);
      var url = '$baseIp/api/user/edit-profile-details';
      var response = await http.post(
        Uri.parse(url),
        body: body,
        headers: {
          "Authorization":userToken.toString(),
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin": "*"
        },
      );
      print("...${response.body}");
      var result=jsonDecode(response.body);
      if(result["status"]=="success"){
        value="success";
      }
      else {
        value=result["message"];
      }
    }
    catch(error){
      value=error.toString();
    }


    return value;

  }


  Future<Map<String,dynamic>> fetchUserAccount() async {

    String url= '$baseIp/api/user/profile-details';
    final response = await http.get(Uri.parse(url),headers: {
      "authorization":userToken
    });
    if (response.statusCode == 200) {
      var data=json.decode(response.body);
      if(data["status"]=="success"){
        return data["data"];
      }
    } else {
      print("Failed : ${response.body}");
    }
    return {};
  }

  Future<String>addBankAccountDetails( Map<String,dynamic>accountData) async {

    String result="";
    String url='$baseIp/auth/bank-account';
    var request = http.MultipartRequest('POST', Uri.parse(url));

    request.headers['authorization'] =userToken;


        await http.MultipartFile.fromPath(
          'panImg',
          accountData["panCardImage"].toString(),
        );
    await http.MultipartFile.fromPath(
      'aadharImage',
      accountData["adharCardImage"].toString(),
    );
    request.fields['userName'] = accountData["userName"].toString();
    request.fields['accHolderName'] = accountData["accHolderName"].toString();
    request.fields['accountNum'] = accountData["accountNum"].toString();
    request.fields['accountConfirmNum'] = accountData["accountConfirmNum"].toString();
    request.fields['bankName'] = accountData["bankName"].toString();
    request.fields['city'] = accountData["city"].toString();
    request.fields['branch'] = accountData["branch"].toString();
    request.fields['ifscCode'] = accountData["ifscCode"].toString();
    request.fields['nameOfBusiness'] = accountData["nameOfBusiness"].toString();
    request.fields['legalEntityType'] = accountData["legalEntityType"].toString();
    request.fields['panNumber'] =accountData["panNumber"].toString();
    request.fields['gstNumber'] = accountData["gstNumber"].toString();

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
      result="Fail";
    }

    return result;

  }


  Future<String>addAccountDetails( Map<String,dynamic>accountData) async {

    String value="";
    try{
      Map data ={
        "user_id": userModel["id"],
        "account_holder_name": accountData["account_holder_name"],
        "account_number": accountData["account_number"],
        "bank_id": accountData["bank_id"],
        "city": accountData["city"],
        "branch": accountData["branch"],
        "ifsc_code": accountData["ifsc_code"]
      };

      String body = json.encode(data);
      var url = '$baseIp/api/account/add-account-details';
      var response = await http.post(
        Uri.parse(url),
        body: body,
        headers: {
          "Authorization":userToken.toString(),
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin": "*"
        },
      );
      print("......Add Account details address..${response.body}");
      print(response.statusCode);
      var result=jsonDecode(response.body);
      if(result["status"]=="success"){
        value="success";
      }
      else {
        value=result["message"];
      }
    }
    catch(error){
      value=error.toString();
    }


    return value;
  }
  Future<String>updateAccountDetails( Map<String,dynamic>accountData,String bankDetailId) async {

    String value="";
    try{
      Map data ={
        "bank_details_id":bankDetailId,
        "user_id": userModel["id"],
        "account_holder_name": accountData["account_holder_name"],
        "account_number": accountData["account_number"],
        "bank_id": accountData["bank_id"],
        "city": accountData["city"],
        "branch": accountData["branch"],
        "ifsc_code": accountData["ifsc_code"]
      };

      String body = json.encode(data);
      var url = '$baseIp/api/account/edit-account-details';
      var response = await http.post(
        Uri.parse(url),
        body: body,
        headers: {
          "Authorization":userToken.toString(),
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin": "*"
        },
      );
      print("bATANK id is $bankDetailId");
      print("......Add Account details address..${response.body}");
      print(response.statusCode);
      var result=jsonDecode(response.body);
      if(result["status"]=="success"){
        value="success";
      }
      else {
        value=result["message"];
      }
    }
    catch(error){
      value=error.toString();
    }


    return value;
  }

  Stream<http.Response> fetchBankName()  {

    String url= '$baseIp/api/bank/get-all-banks';

    return http.get(Uri.parse(url),headers: {
      "authorization":userToken
    }).asStream();
  }


  Future<List<dynamic>> fetchBankDetails()  async{

    String url= '$baseIp/api/account/get-user-account-details';
    final response = await http.get(Uri.parse(url),headers: {
      "authorization":userToken
    });
    if (response.statusCode == 200) {
      var data=json.decode(response.body);
      if(data["status"]=="success"){
        return data["data"];
      }
    } else {
      return [];
    }
    return [];
  }

  // for changing the password

  Future<String>loginAndSecurity(newPassword,confirmPassword ) async {

    String value="";

    try{


      var url = '$baseIp/api/auth/user-reset-password';
      var response = await http.post(
        Uri.parse(url),
        body: {
              "new_password":newPassword,
              "confirm_password":confirmPassword,
        },
        headers: {
          "Authorization":userToken.toString(),
          // "Content-Type": "application/json",
          // "Access-Control-Allow-Origin": "*"
        },
      );
      print("...${response.body}");
      var result=jsonDecode(response.body);
      if(result["status"]=="success"){
        value="success";
      }
      else {
        value=result["message"];
      }
    }
    catch(error){
      value=error.toString();
    }


    return value;

  }

  Future<String> removeDeviceToken() async {
    String loginValue = "";

    var url = '$baseIp/api/notification/remove-firebase-device-token';
    await http.post(
      Uri.parse(url),
      headers: {
        "authorization":userToken
      },
    ).then((value) {
      var result = jsonDecode(value.body);
      print(result);
      if (result["status"]=="success") {
        loginValue="success";
      } else{
          loginValue="Something went wrong.";
        }

    }).onError((error, stackTrace) {
      print("Server Error..... ${error.toString()}");
      loginValue="Bad request.";
    });
    return loginValue;
  }



}