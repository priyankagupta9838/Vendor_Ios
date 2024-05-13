import 'dart:convert';
import 'dart:io';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:vendor/Constraints.dart';



class Authentication {

  Future<String> signUpNewUser(String name, String email,
      String password, String confirmPassword,) async {
    String value="";
    bool isPhoneNumber=false;
    try{

      if (email == null) {
        isPhoneNumber = false;
      }
      else {
        isPhoneNumber = double.tryParse(email) != null;
      }
      Map data = {
        "fullname": name,
        "username":
        isPhoneNumber
            ?
        "91$email"
            :
        email,
        "password": password,
        "role": {
          "role_id": 3,
          "role_name": "VENDOR"
        },
        "confirm_password": confirmPassword
      };

      String body = json.encode(data);
      var url = '$baseIp/api/auth/register';
      var response = await http.post(
        Uri.parse(url),
        body: body,
        headers: {
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
        final box = GetStorage();
        box.write("user_id", result["created_user"]["id"]);
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
      value="null";
    }


    return value;
  }

/*  Future<String> loginUser(String email, String password) async {
    String loginValue = "";

    bool isPhoneNumber=false;
    if (email == null) {
      isPhoneNumber = false;
    }
    else {
      isPhoneNumber = double.tryParse(email) != null;
    }
    Map data = {
      "role_id": 3,
      "username":
      isPhoneNumber
          ?
      "91$email"
          :
      email,
      "password": password
    };

    String body = json.encode(data);
    var url = '$baseIp/api/auth/user-login';
    await http.post(
      Uri.parse(url),
      body: body,
      headers: {
        "Content-Type": "application/json",
        "accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      },
    ).then((value) {
      var result = jsonDecode(value.body);

      print('"Login responce ...${result}');

      if (result["status"]=="success") {
        final box = GetStorage();
        box.remove("UserToken");
        box.write("UserToken", result["token"]);
        box.write("refreshToken", result["refreshToken"]);
        loginValue="success";
      } else {
        loginValue=result["message"];
      }
    }
    ).onError((error, stackTrace) {
      loginValue="Server Error.";
    }) ;
    return loginValue;
  }*/

  Future<String> loginUser(String email, String password) async {
    String loginValue = "";

    bool isPhoneNumber = false;
    if (email == null) {
      isPhoneNumber = false;
    } else {
      isPhoneNumber = double.tryParse(email) != null;
    }
    Map data = {
      "role_id": 3,
      "username": isPhoneNumber ? "91$email" : email,
      "password": password
    };

    String body = json.encode(data);
    var url = '$baseIp/api/auth/user-login';

    try {
      var response = await http.post(
        Uri.parse(url),
        body: body,
        headers: {
          "Content-Type": "application/json",
          "accept": "application/json",
          "Access-Control-Allow-Origin": "*"
        },
      );

      var result = jsonDecode(response.body);
      print('Login response: $result');

      if (result["status"] == "success") {
        final box = GetStorage();
        box.remove("UserToken");
        box.write("UserToken", result["token"]);
        box.write("refreshToken", result["refreshToken"]);
        loginValue = "success";
        userToken=result["token"];
      } else {
        loginValue = result["message"];
      }
    } on SocketException catch (e) {
      print('SocketException: $e');
      loginValue = "Please check your internet.";
    } catch (e) {
      print('Error: $e');
      loginValue = "An error occurred.";
    }

    return loginValue;
  }


  Future<String> getUser() async {
    String loginValue = "";
    var url = '$baseIp/api/auth/get-user';
    await http.get(
      Uri.parse(url),
      headers: {
        "authorization":userToken,
        "Content-Type": "application/json",
        "accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      },
    ).then((value) {
      var response=json.decode(value.body);
      if(response["message"]=="Session expired"){
        loginValue="Session expired";
      }
      else if(response["status"]=="success"){
        loginValue="success";
        userModel=response["data"];
      }

    }).onError((error, stackTrace) {
      print("Server Error..... ${error.toString()}");
    });
    return loginValue;
  }

  Future<String> otpVerification(String userOtp) async {
    String loginValue = "";
    final box = GetStorage();
    String userId=box.read("user_id").toString();
    Map data = {
      "user_id": userId,
      "otp": userOtp
    };
    String body = json.encode(data);
    var url = '$baseIp/api/auth/verify-otp';
    await http.post(
      Uri.parse(url),
      body: body,
      headers: {
        "Content-Type": "application/json",
        "accept": "application/json",
        "Access-Control-Allow-Origin": "*",

      },
    ).then((value) {
      var result = jsonDecode(value.body);
      print(result);
      if (result["status"]=="success") {
        loginValue="success";
      } else {
        if(result["message"]=="Username already registered. Try logging in."){
          loginValue="Username already registered. Try logging in.";
        }
        else{
          loginValue="Something went wrong.";
        }
      }
    }).onError((error, stackTrace) {
      print("Server Error..... ${error.toString()}");
      loginValue="Bad request.";
    });
    return loginValue;
  }


  Future<String> postVendorDetails() async {
    String result="";
    final box = GetStorage();
    String userId=box.read("user_id").toString();
    String url='$baseIp/api/user/vendor-update';
    var request = http.MultipartRequest('POST', Uri.parse(url),);

  request.headers["Content-Type"]="multipart/form-data; boundary=<calculated when request is sent>";
    request.headers["Accept"]="*/*";



    // Add text fields to the request
   request.fields['user_id'] = userId;
    request.fields['service_type'] = userRegisterData["serviceType"];
    request.fields['first_name'] = userRegisterData["firstName"];
    request.fields['last_name'] = userRegisterData["lastName"];
    request.fields['mobile'] = userRegisterData["mobileNumber"];
    request.fields['alt_mobile'] = userRegisterData["alternativeMobile"];
    request.fields['email'] = userRegisterData["email"];
    request.fields['city'] = userRegisterData["city1"];
    request.fields['address'] =userRegisterData["address1"];
    request.fields['pincode'] = userRegisterData["pincode1"];
    request.fields['shop_name'] = userRegisterData["shopName"];
    request.fields['shop_location'] = userRegisterData["shopLocation"];
    request.fields['shop_unique_desc'] = userRegisterData["uniquesness"];
    request.fields['bussiness_name'] = userRegisterData["nameOfBusiness"];
    request.fields['entity_type'] = userRegisterData["legalEntityType"];
    request.fields['pan'] = userRegisterData["panNumber"];
    request.fields['aadhar'] = userRegisterData["adharNumber"];
    request.fields['gstin'] = userRegisterData["gstin"];
    request.fields['cin'] = userRegisterData["cin"];

   if( userRegisterData["shop_n_establishment"].toString().trim().isNotEmpty){
     request.fields['shop_n_establishment'] =userRegisterData["shop_n_establishment"];
   }
   else{
     request.fields['shop_n_establishment'] = "null";
   }
   request.fields['portfolio_images'] = userRegisterData["portfolioShop"].length.toString();

      request.files.add(await http.MultipartFile.fromPath(
        'shop_image',
        userRegisterData["shopCoverPhoto"].toString(),
      ));

    request.files.add(await http.MultipartFile.fromPath(
      'pan_image',
      userRegisterData["panCardImage"].toString(),
    ));

    request.files.add(await http.MultipartFile.fromPath(
      'aadhar_image',
      userRegisterData["adharCardImage"].toString(),
    ));
   if(userRegisterData["gstinImage"].toString().isNotEmpty){
     request.files.add(await http.MultipartFile.fromPath(
       'gstin_image',
       userRegisterData["gstinImage"].toString(),
     ));
   }
   if( userRegisterData["cinImage"].toString().isNotEmpty){
     request.files.add(await http.MultipartFile.fromPath(
       'cin_image',
       userRegisterData["cinImage"].toString(),
     ));
   }

    if( userRegisterData["shop_n_establishment_image"].toString().isNotEmpty){
      request.files.add(await http.MultipartFile.fromPath(
        'shop_n_establishment_image',
        userRegisterData["shop_n_establishment_image"].toString(),
      ));
    }

    request.files.add(await http.MultipartFile.fromPath(
      'image_1',
      userRegisterData["portfolioShop"][0],
    ));
    request.files.add(await http.MultipartFile.fromPath(
      'image_2',
      userRegisterData["portfolioShop"][1],
    ));
    request.files.add(await http.MultipartFile.fromPath(
      'image_3',
      userRegisterData["portfolioShop"][2],
    ));
    request.files.add(await http.MultipartFile.fromPath(
      'image_4',
      userRegisterData["portfolioShop"][3],
    ));


    try {
      var response = await request.send().timeout(const Duration( seconds: 60));
      var responseMessage = await response.stream.bytesToString();
      var responseData = jsonDecode(responseMessage);
          print(responseData);
      if (responseData["status"]=="success") {
        result="success";
      } else {
        result=responseData["message"];
      }
    } catch (error) {
      print("Error...$error");
      result="something went wrong";
    }

    return result;
  }

  Future<String> forgetPassword(String username) async {
    String loginValue = "";
    bool isPhoneNumber=false;
    if (username == null) {
      isPhoneNumber = false;
    }
    else {
      isPhoneNumber = double.tryParse(username) != null;
    }
    Map data = {
      "username":  isPhoneNumber
          ?
      "91$username"
          :
      username,
    };
    String body = json.encode(data);
    var url = '$baseIp/api/auth/forgot-password?type=VENDOR';
    await http.post(
      Uri.parse(url),
      body: body,
      headers: {
        "Content-Type": "application/json",
        "accept": "application/json",
        "Access-Control-Allow-Origin": "*",
      },
    ).then((value) {
      var result = jsonDecode(value.body);
      print(result);
      if (result["status"]=="success") {
        loginValue="success";
      } else {
        if(result["message"]=="User not NotFound."){
          loginValue="user not found.";
        }
        else{
          loginValue="Something went wrong.";
        }
      }
    }).onError((error, stackTrace) {
      print("Server Error..... ${error.toString()}");
      loginValue="Bad request.";
    });
    return loginValue;
  }

  Future<String> newPassword(String newPassword ,String otp , String username) async {
    String loginValue = "";

    bool isPhoneNumber=false;
    if (username == null) {
      isPhoneNumber = false;
    }
    else {
      isPhoneNumber = double.tryParse(username) != null;
    }
    Map data = {
      "username":
      isPhoneNumber
          ?
      "91$username"
      :
      username,
      "otp":otp,
      "new_password": newPassword,
      "confirm_password": newPassword
    };
    String body = json.encode(data);
    var url = '$baseIp/api/auth/new-password?type=VENDOR';
    await http.post(
      Uri.parse(url),
      body: body,
      headers: {
        "Content-Type": "application/json",
        "accept": "application/json",
        "Access-Control-Allow-Origin": "*",

      },
    ).then((value) {
      var result = jsonDecode(value.body);
      print(result);
      if (result["status"]=="success") {
        loginValue="success";
      }
        else{
          loginValue=result["message"];
          print("...${result["message"]}");
        }

    }).onError((error, stackTrace) {
      print("Server Error..... ${error.toString()}");
      loginValue="Bad request.";
    });
    return loginValue;
  }


  Future<String> loginWithOtp(String username) async {
    String loginValue = "";

    bool isPhoneNumber=false;
    if (username == null) {
      isPhoneNumber = false;
    }
    else {
      isPhoneNumber = double.tryParse(username) != null;
    }
    Map data = {
      "role_id": 3,
      "username":
      isPhoneNumber
          ?
      "91$username"
          :
      username,
    };

    String body = json.encode(data);
    var url = '$baseIp/api/auth/send-otp-using-username';
    await http.post(
      Uri.parse(url),
      body: body,
      headers: {
        "Content-Type": "application/json",
        "accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      },
    ).then((value) {
      var result = jsonDecode(value.body);

      print('"Login responce ...${result}');

      if (result["status"]=="success") {
        // final box = GetStorage();
        // box.remove("UserToken");
        // box.write("UserToken", result["token"]);
        // box.write("refreshToken", result["refreshToken"]);
        loginValue="success";
      } else {
        loginValue=result["message"];
      }
    }).onError((error, stackTrace) {
      loginValue="Server Error.";
    });
    return loginValue;
  }
  Future<String> loginWithOtpVerification(String username, String otp) async {
    String loginValue = "";

    bool isPhoneNumber=false;
    if (username == null) {
      isPhoneNumber = false;
    }
    else {
      isPhoneNumber = double.tryParse(username) != null;
    }
    Map data = {
      "role_id": 3,
      "username":
      isPhoneNumber
          ?
      "91$username"
          :
      username,
      "otp": otp
    };

    String body = json.encode(data);
    var url = '$baseIp/api/auth/user-login-otp';
    await http.post(
      Uri.parse(url),
      body: body,
      headers: {
        "Content-Type": "application/json",
        //"accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      },
    ).then((value) {
      var result = jsonDecode(value.body);

      print('"Login responce ...${result}');

      if (result["status"]=="success") {
        final box = GetStorage();
        box.remove("UserToken");
        box.write("UserToken", result["token"]);
        box.write("refreshToken", result["refreshToken"]);
        loginValue="success";
      } else {
        loginValue=result["message"];
      }
    }).onError((error, stackTrace) {
      loginValue="Server Error.";
    });
    return loginValue;
  }

  Stream<http.Response> termsAndConditions()  {

    String urlForBuyer= '$baseIp/api/static-properties?q=TERMS%20AND%20CONDITIONS';

    return http.get(Uri.parse(urlForBuyer),

    //     headers: {
    //   "authorization":userToken
    // }

    ).asStream();
  }
  Stream<http.Response> privacyAndPolicy()  {

    String urlForBuyer= '$baseIp/api/static-properties?q=PRIVACY%20POLICY';

    return http.get(Uri.parse(urlForBuyer),
    //     headers: {
    //   "authorization":userToken
    // }

    ).asStream();
  }


  Future<String> sendDeviceToken(String deviceToken) async {
    String loginValue = "";

    Map data = {
      "device_token": deviceToken
    };
    String body = json.encode(data);
    var url = '$baseIp/api/notification/save-firebase-device-token';
    await http.post(
      Uri.parse(url),
      body: body,
      headers: {
        "Content-Type": "application/json",
        "accept": "application/json",
        "Access-Control-Allow-Origin": "*",
        "Authorization":userToken
      },
    ).then((value) {
      var result = jsonDecode(value.body);
      print(result);
      if (result["status"] == "success") {
        loginValue = "success";
      } else {


      }
    }).onError((error, stackTrace) {
      loginValue = "Bad request.";
    });
    return loginValue;
  }






  // login and sequruty
  Future<String> sentRequestForDeleteAccount() async {
    String loginValue = "";
    //
    // Map data = {
    //   "device_token": deviceToken
    // };
    // String body = json.encode(data);
    var url = '$baseIp/api/account/delete-account-request';
    await http.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        "accept": "application/json",
        "Access-Control-Allow-Origin": "*",
        "Authorization":userToken
      },
    ).then((value) {
      var result = jsonDecode(value.body);
      print(result);
      if (result["status"] == "success") {
        loginValue = "success";
      } else {
        loginValue=result["message"].toString();
      }
    }).onError((error, stackTrace) {
      loginValue = "Bad request.";
    });
    return loginValue;
  }

}