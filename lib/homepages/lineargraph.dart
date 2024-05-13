import 'dart:convert';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../Api/overviewapi.dart';
//
// class LinearGraph extends StatefulWidget {
//    LinearGraph({super.key,required this.dropdownvalue});
//   String dropdownvalue;
//
//   @override
//   State<LinearGraph> createState() => _LinearGraphState();
// }
//
// class _LinearGraphState extends State<LinearGraph> {
//   @override
//   Widget build(BuildContext context) {
//     Size size =MediaQuery.of(context).size;
//     return StreamBuilder(
//       stream:OverViewApi().overviewChartData(widget.dropdownvalue),
//       builder: (context, snapshot) {
//         if( snapshot.hasData ){
//           var overViewData=jsonDecode(snapshot.data!.body);
//
//           return snapshot.data?.statusCode==200 && overViewData["data"]["chart_data"].length >0 && overViewData["data"]["chart_data"][0]["count"]>0
//               ?
//           LineChart(
//             LineChartData(
//               gridData: FlGridData(
//                 show: true,
//                 drawVerticalLine: true,
//                 getDrawingVerticalLine: (value) {
//                   return FlLine(
//                     color: Colors.transparent,
//                     strokeWidth: 0,
//                   );
//                 },
//                 getDrawingHorizontalLine: (value) {
//                   return FlLine(
//                     color: Colors.transparent,
//                     strokeWidth: 0,
//                   );
//                 },
//               ),
//               minX: 0,
//               minY: 0,
//               backgroundColor: Colors.purple.shade100,
//               titlesData: FlTitlesData(
//                 leftTitles: SideTitles(
//                   showTitles: true,
//                   getTextStyles: (value) =>
//                   const TextStyle(color: Colors.black),
//                   interval: 2.0, // interval for left axis labels
//                 ),
//                 bottomTitles: SideTitles(
//                   showTitles: true,
//                   getTextStyles: (value) =>
//                   const TextStyle(color: Colors.black),
//                   interval: 2.0, // interval for bottom axis labels
//                 ),
//               ),
//               lineBarsData: [
//                 LineChartBarData(
//                   spots: spots,
//                   isCurved: true, // if you want curved line
//                   colors: [Colors.purple.shade300],
//                   barWidth: 2,
//                   isStrokeCapRound: true,
//                   belowBarData: BarAreaData(show: false),
//                 ),
//               ],
//             ),
//             swapAnimationDuration: const Duration(milliseconds: 150),
//           )
//               :
//           LineChart(
//             LineChartData(
//               gridData: FlGridData(
//                 show: true,
//                 drawVerticalLine: true,
//                 getDrawingVerticalLine:(value) {
//                   return FlLine(
//                     color: Colors.transparent,
//                     strokeWidth: 0,
//                   );
//                 } ,
//                 getDrawingHorizontalLine: (value) {
//                   return FlLine(
//                     color: Colors.transparent,
//                     strokeWidth: 0,
//                   );
//                 },
//               ),
//               maxY: 10,
//               maxX: 10,
//               minX: 0,
//               minY: 0,
//               backgroundColor: Colors.purple.shade100,
//               titlesData: FlTitlesData(
//                 leftTitles: SideTitles(
//                   showTitles: true,
//                   getTextStyles: (value) =>
//                   const TextStyle(color: Colors.black),
//                   interval: 2.0, // interval for left axis labels
//                 ),
//                 bottomTitles: SideTitles(
//                   showTitles: true,
//                   getTextStyles: (value) =>
//                   const TextStyle(color: Colors.black),
//                   interval: 2.0, // interval for bottom axis labels
//                 ),
//               ),
//               lineBarsData: [
//
//                 LineChartBarData(
//
//                   spots: [
//                     FlSpot(0, 0),
//                     FlSpot(0, 0),
//
//                   ],
//                   isCurved: true, // if you want curved line
//                   colors: [ Colors.purple.shade300],
//                   barWidth: 2,
//                   isStrokeCapRound: true,
//                   belowBarData: BarAreaData(show: false),
//                 ),
//
//               ],
//
//             ),
//             swapAnimationDuration: const Duration(milliseconds: 150),
//           );
//         }
//         else{
//           return   Center(
//             child: CircularProgressIndicator(
//               color: Colors.purple.shade200,
//             ),
//           );
//         }
//       },
//     );
//   }
// }




class LinearGraph extends StatefulWidget {
  const LinearGraph({Key? key, required this.dropdownValue}) : super(key: key);
  final String dropdownValue;

  @override
  _LinearGraphState createState() => _LinearGraphState();
}

class _LinearGraphState extends State<LinearGraph> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StreamBuilder(
      stream: OverViewApi().overviewChartData(widget.dropdownValue),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          double max=5;
          var overViewData = jsonDecode(snapshot.data!.body);
          if (snapshot.data?.statusCode == 200 &&
              overViewData["data"]["chart_data"].length > 0 &&
              overViewData["data"]["chart_data"][0]["count"] > 0) {
            List<FlSpot> spots = [];

            for (int i=0;i<overViewData["data"]["chart_data"].length;i++) {

              double x = double.parse(overViewData["data"]["chart_data"][i]["count"].toString());
              double y = double.parse(overViewData["data"]["chart_data"][i]["count"].toString());
              max=max>x ? max : x;
              if(i==0){
                spots.add(FlSpot(0, 0));
                spots.add(FlSpot(x, y));
              }
              else{
                spots.add(FlSpot(x, y));
              }
            }

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: size.width*0.9,
                child: LineChart(
                  LineChartData(
                    borderData: FlBorderData(
                      border: const Border(
                        top: BorderSide.none,
                        right: BorderSide.none,
                        left: BorderSide(color: Colors.black),
                          bottom: BorderSide( color: Colors.black)
                      )
                    ),
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: true,
                      getDrawingVerticalLine: (value) {
                        return FlLine(
                          color: Colors.transparent,
                          strokeWidth: 0,
                        );
                      },
                      getDrawingHorizontalLine: (value) {
                        return FlLine(
                          color: Colors.transparent,
                          strokeWidth: 0,
                        );
                      },
                    ),
                    maxY: max+5,
                    maxX: max+5,
                     minX: 0,
                     minY: 0,
                    backgroundColor: Colors.purple.shade100,
                    titlesData: FlTitlesData(
                      leftTitles: SideTitles(
                        showTitles: true,
                        getTextStyles: (value) =>
                        const TextStyle(color: Colors.black),
                        interval: 10, // interval for left axis labels
                      ),
                      bottomTitles: SideTitles(
                        showTitles: true,
                        getTextStyles: (value) =>
                        const TextStyle(color: Colors.black),
                        interval:2, // interval for bottom axis labels
                      ),
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        spots: spots,
                        isCurved: true, // if you want curved line
                        colors: [Colors.purple.shade300],
                        barWidth: 2,
                        isStrokeCapRound: true,
                        belowBarData: BarAreaData(show: false),
                      ),
                    ],
                  ),
                  swapAnimationDuration: const Duration(milliseconds: 150),
                ),
              ),
            );
          } else {
            return  LineChart(
              LineChartData(
                borderData: FlBorderData(
                    border: const Border(
                        top: BorderSide.none,
                        right: BorderSide.none,
                        left: BorderSide(color: Colors.black),
                        bottom: BorderSide( color: Colors.black)
                    )
                ),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: true,
                  getDrawingVerticalLine:(value) {
                    return FlLine(
                      color: Colors.transparent,
                      strokeWidth: 0,
                    );
                  } ,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: Colors.transparent,
                      strokeWidth: 0,
                    );
                  },
                ),
                maxY: 10,
                maxX: 10,
                minX: 0,
                minY: 0,
                backgroundColor: Colors.purple.shade100,
                titlesData: FlTitlesData(
                  leftTitles: SideTitles(
                    showTitles: true,
                    getTextStyles: (value) =>
                    const TextStyle(color: Colors.black),
                    interval: 2.0, // interval for left axis labels
                  ),
                  bottomTitles: SideTitles(
                    showTitles: true,
                    getTextStyles: (value) =>
                    const TextStyle(color: Colors.black),
                    interval: 2.0, // interval for bottom axis labels
                  ),
                ),
                lineBarsData: [

                  LineChartBarData(

                    spots: [
                      FlSpot(0, 0),
                      FlSpot(0, 0),

                    ],
                    isCurved: true, // if you want curved line
                    colors: [ Colors.purple.shade300],
                    barWidth: 2,
                    isStrokeCapRound: true,
                    belowBarData: BarAreaData(show: false),
                  ),

                ],

              ),
              swapAnimationDuration: const Duration(milliseconds: 150),
            );
          }
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.purple.shade200,
            ),
          );
        }
      },
    );
  }
}



