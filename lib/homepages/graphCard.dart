import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../StateManagement/PageBloc.dart';
import '../StateManagement/PageEvent.dart';
import '../StateManagement/PageState.dart';
import 'lineargraph.dart';

class GraphCard extends StatefulWidget {
  const GraphCard({super.key});

  @override
  State<GraphCard> createState() => _GraphCardState();
}

class _GraphCardState extends State<GraphCard> {

  String dropdownvalue = 'Last 30 days';

  var items = [
    'Last 30 days',
    'Last 6 Months',
    'This year',
  ];


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Card(
      elevation: 0,
      color: Colors.purple.shade100,
      child: SizedBox(
        height: size.height * 0.29,
        width: size.width * 1,
        child: Padding(
          padding: EdgeInsets.only(top: size.height * 0.03),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AutoSizeText(
                    "Performance",
                    style: GoogleFonts.openSans(
                        color: Colors.black87,
                        fontSize: size.height * 0.018,
                        fontWeight: FontWeight.w500),
                  ),
                  BlocBuilder<GraphBlo,GraphState>(
                    builder: (context, state) {
                      return   Container(
                        height: size.height * 0.05,
                        width: size.width * 0.55,
                        decoration: BoxDecoration(
                            color: Colors.purple.shade300,
                            borderRadius: BorderRadius.all(
                                Radius.circular(size.height * 0.005))),
                        child: Padding(
                          padding:
                          EdgeInsets.only(left: size.height * 0.002),
                          child: DropdownButton(
                            underline: const SizedBox(),
                            value: dropdownvalue,
                            icon: Padding(
                              padding:
                              EdgeInsets.only(left: size.width * 0.18),
                              child: const Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.black87,
                              ),
                            ),
                            items: items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: AutoSizeText(
                                  items,
                                  style: GoogleFonts.openSans(
                                      color: Colors.black87,
                                      fontSize: size.height * 0.015,
                                      fontWeight: FontWeight.w500),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue!;
                              });

                              BlocProvider.of<GraphBlo>(context).add(UpdateGraphEvent());
                            },
                          ),
                        ),
                      );
                    },
                  ) ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: size.width * 0.05,
                  ),
                  AutoSizeText(
                    "Sales Trends",
                    style: GoogleFonts.openSans(
                        color: Colors.black87,
                        fontSize: size.height * 0.018,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),

              BlocBuilder<GraphBlo,GraphState>(builder: (context, state) {
                return SizedBox(
                    height: size.height*0.15,
                    width: size.width*0.9,
                    child:  LinearGraph(dropdownValue: dropdownvalue,));
              },)
            ],
          ),
        ),
      ),
    );
  }
}
