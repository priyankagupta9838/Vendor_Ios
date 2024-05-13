import 'dart:convert';

import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../Constraints.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

class CheckoutApi{




  Future<String> downloadInvoice(String orderId) async {
    String returnString="";
    if (Platform.isAndroid) {
      var status = await Permission.storage.status;
      if (!status.isGranted) {
        await Permission.storage.request();
        status = await Permission.storage.status;
        if (!status.isGranted) {
          // permision denied do something
        }
      }


    }
    Directory? downloadDir = Platform.isAndroid
        ? Directory('/storage/emulated/0/Download') // Use specific Downloads folder path
        : await getApplicationDocumentsDirectory();

    // Define the file path
    String filePath = '${downloadDir!.path}/invoice-$orderId.pdf';


    http.Response response = await http.get(
      Uri.parse("$baseIp/api/invoice/products/$orderId"),
      headers: {
        "authorization":userToken,
      },
    );
    if (response.statusCode == 200) {
      print(".................................");
      await File(filePath).writeAsBytes(response.bodyBytes).then((value) async {
        print(".......${value.toString()}");
        // await OpenFile.open(value.path).then((value){
        //
        // });
        returnString="success";
        return "success";
      }).onError((error, stackTrace) {
        print("Reeor is.... ${error.toString()}");
        return "";
      });
    }

    return "";
  }

  Future<String> checkoutPost(String email, String password) async {
    String loginValue = "";
    Map data = {
      "password": password,
      "userName": email,
    };
    print(data);

    String body = json.encode(data);
    var url = '$baseIp/auth/login';
    await http.post(
      Uri.parse(url),
      body: body,
      headers: {
        "Content-Type": "application/json",
        "accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      },
    ).then((value) {
      print(value.body);
      if (value.body != null) {
        var result = jsonDecode(value.body);
        if (result["token"] != null) {

        } else {
          loginValue=result["message"];
        }
      } else {
        loginValue="null";
        print("Error Occurred : Response body is null.");
      }
    }).onError((error, stackTrace) {
      print("Server Error..... ${error.toString()}");
    });
    return loginValue;
  }
  ///

  Stream<http.Response> getOngoingOrders()  {
    String urlForBuyer= '$baseIp/api/order?product_or_quote=PRODUCT&order_status=NEW%20ORDERS';

    // String urlForBuyer= '$baseIp/api/order?order_type_for_user=BUY&order_status=NEW%20ORDERS';

    return http.get(Uri.parse(urlForBuyer),headers: {
      "authorization":userToken
    }).asStream();
  }

  Stream<http.Response> acceptedOrders()  {

    String urlForBuyer= '$baseIp/api/order?product_or_quote=PRODUCT&order_status=ACCEPTED%20ORDERS';
    // String urlForBuyer= '$baseIp/api/order?order_status=ACCEPTED%20ORDERS';

    return http.get(Uri.parse(urlForBuyer),headers: {
      "authorization":userToken
    }).asStream();
  }

  Stream<http.Response> rejectedOrders()  {
    String urlForBuyer= '$baseIp/api/order?product_or_quote=PRODUCT&order_status=REJECTED%20ORDERS';
    // String urlForBuyer= '$baseIp/api/order?order_status=REJECTED%20ORDERS';

    return http.get(Uri.parse(urlForBuyer),headers: {
      "authorization":userToken
    }).asStream();
  }
  Stream<http.Response> deliveredOrders()  {

    String urlForBuyer= '$baseIp/api/order?order_status=COMPLETED%20ORDERS';

    return http.get(Uri.parse(urlForBuyer),headers: {
      "authorization":userToken
    }).asStream();
  }

  // Service order api
  Stream<http.Response> getOngoingServiceOrders()  {
    String urlForBuyer= '$baseIp/api/order?product_or_quote=QUOTE&order_status=NEW%20ORDERS';

    // String urlForBuyer= '$baseIp/api/order?order_type_for_user=BUY&order_status=NEW%20ORDERS';

    return http.get(Uri.parse(urlForBuyer),headers: {
      "authorization":userToken
    }).asStream();
  }
  Stream<http.Response> getAcceptedServiceOrders()  {
    String urlForBuyer= '$baseIp/api/order?product_or_quote=QUOTE&order_status=ACCEPTED%20ORDERS';

    // String urlForBuyer= '$baseIp/api/order?order_type_for_user=BUY&order_status=NEW%20ORDERS';

    return http.get(Uri.parse(urlForBuyer),headers: {
      "authorization":userToken
    }).asStream();
  }
  Stream<http.Response> getRejectedServiceOrders()  {
    String urlForBuyer= '$baseIp/api/order?product_or_quote=QUOTE&order_status=REJECTED%20ORDERS';

    // String urlForBuyer= '$baseIp/api/order?order_type_for_user=BUY&order_status=NEW%20ORDERS';

    return http.get(Uri.parse(urlForBuyer),headers: {
      "authorization":userToken
    }).asStream();
  }



  Stream<http.Response> getInvoice(String id)  {
    String urlForBuyer= '$baseIp/api/invoice/products/$id';
    return http.get(Uri.parse(urlForBuyer),headers: {
      "authorization":userToken
    }).asStream();
  }







}