import 'package:http/http.dart'as http;

import '../Constraints.dart';

class OverViewApi{


  Stream<http.Response>  overviewData() {

    String url= '$baseIp/api/overview/vendor';

    return http.get(Uri.parse(url),headers: {
      "authorization":userToken
    }).asStream();
  }
  Stream<http.Response>  overviewChartData(String dropdownvalue) {
   String value="";
   if(dropdownvalue=="Last 30 days"){
     value="LAST%2030%20DAYS";
   }
   else if(dropdownvalue=="Last 6 Months"){
     value="LAST%206%20MONTHS";
   }
   else{
     value="THIS%20YEAR";
   }
    String url= '$baseIp/api/overview/vendor?sales_trend_chart_duration=$value';

    return http.get(Uri.parse(url),headers: {
      "authorization":userToken
    }).asStream();
  }
}