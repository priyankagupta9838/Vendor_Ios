import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LowerBodyMeasurement extends StatefulWidget {
   LowerBodyMeasurement({Key? key,required this.measurement}) : super(key: key);
   Map<String ,dynamic> measurement;
  @override
  State<LowerBodyMeasurement> createState() => _LowerBodyMeasurementState();
}

class _LowerBodyMeasurementState extends State<LowerBodyMeasurement> {

 TextEditingController neckController=TextEditingController();
 TextEditingController shoulderController=TextEditingController();
 TextEditingController upperArmLenController=TextEditingController();
 TextEditingController bicepController=TextEditingController();
 TextEditingController middleArmController=TextEditingController();
 TextEditingController wristController=TextEditingController();
 TextEditingController shoulderToWristFrontController=TextEditingController();
 TextEditingController shoulderToWristBackController=TextEditingController();
 TextEditingController upperTopLenController=TextEditingController();
 TextEditingController upperFullLenController=TextEditingController();
 TextEditingController lowerBottomLenController=TextEditingController();
 TextEditingController lowerFullLenController=TextEditingController();
 TextEditingController bustController=TextEditingController();
 TextEditingController bustSeparationController=TextEditingController();
 TextEditingController underBustController=TextEditingController();
 TextEditingController bustHeightController=TextEditingController();
 TextEditingController backWidthController=TextEditingController();
 TextEditingController hipHeightController=TextEditingController();
 TextEditingController calfController=TextEditingController();
 TextEditingController thighController=TextEditingController();
 TextEditingController inseamController=TextEditingController();
 TextEditingController outSemController=TextEditingController();






 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.measurement);
    neckController.text=widget.measurement["neck"].toString();
    shoulderController.text=widget.measurement["shoulder"].toString();
    upperArmLenController.text=widget.measurement["upper_arm_length"].toString();
    bicepController.text=widget.measurement["bicep"].toString();
    middleArmController.text=widget.measurement["middle_arm_length"].toString();
    wristController.text=widget.measurement["wrist"].toString();
    shoulderToWristFrontController.text=widget.measurement["shoulder_to_waist_front"].toString();
    shoulderToWristBackController.text=widget.measurement["shoulder_to_waist_back"].toString();
    upperTopLenController.text=widget.measurement["upper_body_top_length"].toString();
    upperFullLenController.text=widget.measurement["upper_body_full_length"].toString();
    lowerBottomLenController.text=widget.measurement["lower_body_bottom_length"].toString();
    lowerFullLenController.text=widget.measurement["lower_body_full_length"].toString();
    bustController.text=widget.measurement["bust"].toString();
    bustSeparationController.text=widget.measurement["bust_separation"].toString();
    underBustController.text=widget.measurement["under_bust"].toString();
    bustHeightController.text=widget.measurement["bust_height"].toString();
    backWidthController.text=widget.measurement["back_width"].toString();
    hipHeightController.text=widget.measurement["hip_height"].toString();
    calfController.text=widget.measurement["calf"].toString();
    thighController.text=widget.measurement["thigh"].toString();
    inseamController.text=widget.measurement["inseam"].toString();
    outSemController.text=widget.measurement["outseam"].toString();





  }


  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const AutoSizeText("Measurement Detail"),
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: size.height*0.02,
              ),
              SizedBox(
                height: size.height*0.056,
                child: Padding(
                  padding: EdgeInsets.only(left:size.width*0.035,right:size.width*0.035),
                  child: TextField(
                 controller: neckController,
                    readOnly: true,
                    onChanged: (value) {
                      //  measurement["hip_height"]=value.toString();

                    },
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: size.height*0.02,
                    ),
                    decoration: InputDecoration(
                        labelText: "Neck",
                        labelStyle: GoogleFonts.openSans(
                            fontWeight: FontWeight.w500,
                            fontSize: size.height*0.018,
                            color:  const Color.fromRGBO(73, 69, 79, 1)
                        ),

                        disabledBorder: OutlineInputBorder(

                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(

                                color: Colors.black45,
                                width: 1
                            )
                        ),
                        enabledBorder: OutlineInputBorder(

                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(

                                color: Colors.black45,
                                width: 1
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(
                                color: Colors.black,
                                width: 1
                            )
                        ),
                        contentPadding: EdgeInsets.all(size.height*0.01)
                    ),
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.number,

                  ),
                ),
              ),
              SizedBox(
                height: size.height*0.022,
              ),
              SizedBox(
                height: size.height*0.056,
                child: Padding(
                  padding: EdgeInsets.only(left:size.width*0.035,right:size.width*0.035),
                  child: TextField(
                    controller:shoulderController ,
                    readOnly: true,
                    onChanged: (value) {
                      //calf.text=measurement["calf"]=value.toString();
                    },
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: size.height*0.02,
                    ),
                    decoration: InputDecoration(
                        labelText: "Shoulder",
                        labelStyle: GoogleFonts.openSans(
                            fontWeight: FontWeight.w500,
                            fontSize: size.height*0.018,
                            color:  const Color.fromRGBO(73, 69, 79, 1)
                        ),

                        disabledBorder: OutlineInputBorder(

                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(

                                color: Colors.black45,
                                width: 1
                            )
                        ),
                        enabledBorder: OutlineInputBorder(

                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(

                                color: Colors.black45,
                                width: 1
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(
                                color: Colors.black,
                                width: 1
                            )
                        ),
                        contentPadding: EdgeInsets.all(size.height*0.01)
                    ),
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.number,

                  ),
                ),
              ),
              SizedBox(
                height: size.height*0.022,
              ),
              SizedBox(
                height: size.height*0.056,
                child: Padding(
                  padding: EdgeInsets.only(left:size.width*0.035,right:size.width*0.035),
                  child: TextField(
                        controller: upperArmLenController,
                    readOnly: true,
                    onChanged: (value) {
                      //  thigh.text=measurement["thigh"]=value.toString();

                    },
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: size.height*0.02,
                    ),
                    decoration: InputDecoration(
                        labelText: "Upper Arm Length",
                        labelStyle: GoogleFonts.openSans(
                            fontWeight: FontWeight.w500,
                            fontSize: size.height*0.018,
                            color:  const Color.fromRGBO(73, 69, 79, 1)
                        ),
                        disabledBorder: OutlineInputBorder(

                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(

                                color: Colors.black45,
                                width: 1
                            )
                        ),
                        enabledBorder: OutlineInputBorder(

                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(

                                color: Colors.black45,
                                width: 1
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(
                                color: Colors.black,
                                width: 1
                            )
                        ),
                        contentPadding: EdgeInsets.all(size.height*0.01)
                    ),
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.number,

                  ),
                ),
              ),
              SizedBox(
                height: size.height*0.02,
              ),
              SizedBox(
                height: size.height*0.056,
                child: Padding(
                  padding: EdgeInsets.only(left:size.width*0.035,right:size.width*0.035),
                  child: TextField(
                    controller:bicepController ,
                    readOnly: true,
                    onChanged: (value) {
                      //  measurement["hip_height"]=value.toString();

                    },
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: size.height*0.02,
                    ),
                    decoration: InputDecoration(
                        labelText: "Bicep",
                        labelStyle: GoogleFonts.openSans(
                            fontWeight: FontWeight.w500,
                            fontSize: size.height*0.018,
                            color:  const Color.fromRGBO(73, 69, 79, 1)
                        ),

                        disabledBorder: OutlineInputBorder(

                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(

                                color: Colors.black45,
                                width: 1
                            )
                        ),
                        enabledBorder: OutlineInputBorder(

                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(

                                color: Colors.black45,
                                width: 1
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(
                                color: Colors.black,
                                width: 1
                            )
                        ),
                        contentPadding: EdgeInsets.all(size.height*0.01)
                    ),
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.number,

                  ),
                ),
              ),
              SizedBox(
                height: size.height*0.022,
              ),
              SizedBox(
                height: size.height*0.056,
                child: Padding(
                  padding: EdgeInsets.only(left:size.width*0.035,right:size.width*0.035),
                  child: TextField(
                    controller: middleArmController,
                    readOnly: true,
                    onChanged: (value) {
                      //calf.text=measurement["calf"]=value.toString();
                    },
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: size.height*0.02,
                    ),
                    decoration: InputDecoration(
                        labelText: "Middle Arm Length",
                        labelStyle: GoogleFonts.openSans(
                            fontWeight: FontWeight.w500,
                            fontSize: size.height*0.018,
                            color:  const Color.fromRGBO(73, 69, 79, 1)
                        ),

                        disabledBorder: OutlineInputBorder(

                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(

                                color: Colors.black45,
                                width: 1
                            )
                        ),
                        enabledBorder: OutlineInputBorder(

                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(

                                color: Colors.black45,
                                width: 1
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(
                                color: Colors.black,
                                width: 1
                            )
                        ),
                        contentPadding: EdgeInsets.all(size.height*0.01)
                    ),
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.number,

                  ),
                ),
              ),
              SizedBox(
                height: size.height*0.022,
              ),
              SizedBox(
                height: size.height*0.056,
                child: Padding(
                  padding: EdgeInsets.only(left:size.width*0.035,right:size.width*0.035),
                  child: TextField(
                    controller: wristController,
                    readOnly: true,
                    onChanged: (value) {
                      //  thigh.text=measurement["thigh"]=value.toString();

                    },
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: size.height*0.02,
                    ),
                    decoration: InputDecoration(
                        labelText: "Wrist",
                        labelStyle: GoogleFonts.openSans(
                            fontWeight: FontWeight.w500,
                            fontSize: size.height*0.018,
                            color:  const Color.fromRGBO(73, 69, 79, 1)
                        ),
                        disabledBorder: OutlineInputBorder(

                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(

                                color: Colors.black45,
                                width: 1
                            )
                        ),
                        enabledBorder: OutlineInputBorder(

                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(

                                color: Colors.black45,
                                width: 1
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(
                                color: Colors.black,
                                width: 1
                            )
                        ),
                        contentPadding: EdgeInsets.all(size.height*0.01)
                    ),
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.number,

                  ),
                ),
              ),
              SizedBox(
                height: size.height*0.022,
              ),
              SizedBox(
                height: size.height*0.056,
                child: Padding(
                  padding: EdgeInsets.only(left:size.width*0.035,right:size.width*0.035),
                  child: TextField(
                    controller:shoulderToWristFrontController ,
                    readOnly: true,
                    onChanged: (value) {
                      // measurement["inseam"]=value.toString();

                    },
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: size.height*0.02,
                    ),
                    decoration: InputDecoration(
                        labelText: "Shoulder to waist front",
                        labelStyle: GoogleFonts.openSans(
                            fontWeight: FontWeight.w500,
                            fontSize: size.height*0.018,
                            color:  const Color.fromRGBO(73, 69, 79, 1)
                        ),

                        disabledBorder: OutlineInputBorder(

                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(

                                color: Colors.black45,
                                width: 1
                            )
                        ),
                        enabledBorder: OutlineInputBorder(

                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(

                                color: Colors.black45,
                                width: 1
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(
                                color: Colors.black,
                                width: 1
                            )
                        ),
                        contentPadding: EdgeInsets.all(size.height*0.01)
                    ),
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.number,

                  ),
                ),
              ),
              SizedBox(
                height: size.height*0.022,
              ),
              SizedBox(
                height: size.height*0.056,
                child: Padding(
                  padding: EdgeInsets.only(left:size.width*0.035,right:size.width*0.035),
                  child: TextField(
                    controller: shoulderToWristBackController,
                    readOnly: true,
                    onChanged: (value) {
                    },
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: size.height*0.02,
                    ),
                    decoration: InputDecoration(
                        labelText: "Shoulder to waist back",
                        labelStyle: GoogleFonts.openSans(
                            fontWeight: FontWeight.w500,
                            fontSize: size.height*0.018,
                            color:  const Color.fromRGBO(73, 69, 79, 1)
                        ),
                        disabledBorder: OutlineInputBorder(

                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(

                                color: Colors.black45,
                                width: 1
                            )
                        ),
                        enabledBorder: OutlineInputBorder(

                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(

                                color: Colors.black45,
                                width: 1
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(
                                color: Colors.black,
                                width: 1
                            )
                        ),
                        contentPadding: EdgeInsets.all(size.height*0.01)
                    ),
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.number,

                  ),
                ),
              ),
              SizedBox(
                height: size.height*0.022,
              ),
              SizedBox(
                height: size.height*0.056,
                child: Padding(
                  padding: EdgeInsets.only(left:size.width*0.035,right:size.width*0.035),
                  child: TextField(
                    controller: upperTopLenController,
                    readOnly: true,
                    onChanged: (value) {
                      //calf.text=measurement["calf"]=value.toString();
                    },
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: size.height*0.02,
                    ),
                    decoration: InputDecoration(
                        labelText: "Upper body top length",
                        labelStyle: GoogleFonts.openSans(
                            fontWeight: FontWeight.w500,
                            fontSize: size.height*0.018,
                            color:  const Color.fromRGBO(73, 69, 79, 1)
                        ),

                        disabledBorder: OutlineInputBorder(

                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(

                                color: Colors.black45,
                                width: 1
                            )
                        ),
                        enabledBorder: OutlineInputBorder(

                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(

                                color: Colors.black45,
                                width: 1
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(
                                color: Colors.black,
                                width: 1
                            )
                        ),
                        contentPadding: EdgeInsets.all(size.height*0.01)
                    ),
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.number,

                  ),
                ),
              ),
              SizedBox(
                height: size.height*0.022,
              ),
              SizedBox(
                height: size.height*0.056,
                child: Padding(
                  padding: EdgeInsets.only(left:size.width*0.035,right:size.width*0.035),
                  child: TextField(
                    controller: upperFullLenController,
                    readOnly: true,
                    onChanged: (value) {
                      //  thigh.text=measurement["thigh"]=value.toString();

                    },
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: size.height*0.02,
                    ),
                    decoration: InputDecoration(
                        labelText: "Upper body full length",
                        labelStyle: GoogleFonts.openSans(
                            fontWeight: FontWeight.w500,
                            fontSize: size.height*0.018,
                            color:  const Color.fromRGBO(73, 69, 79, 1)
                        ),
                        disabledBorder: OutlineInputBorder(

                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(

                                color: Colors.black45,
                                width: 1
                            )
                        ),
                        enabledBorder: OutlineInputBorder(

                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(

                                color: Colors.black45,
                                width: 1
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(
                                color: Colors.black,
                                width: 1
                            )
                        ),
                        contentPadding: EdgeInsets.all(size.height*0.01)
                    ),
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.number,

                  ),
                ),
              ),
              SizedBox(
                height: size.height*0.022,
              ),
              SizedBox(
                height: size.height*0.056,
                child: Padding(
                  padding: EdgeInsets.only(left:size.width*0.035,right:size.width*0.035),
                  child: TextField(
                    controller:lowerBottomLenController,
                    readOnly: true,
                    onChanged: (value) {
                      // measurement["inseam"]=value.toString();

                    },
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: size.height*0.02,
                    ),
                    decoration: InputDecoration(
                        labelText: "Lower body bottom length",
                        labelStyle: GoogleFonts.openSans(
                            fontWeight: FontWeight.w500,
                            fontSize: size.height*0.018,
                            color:  const Color.fromRGBO(73, 69, 79, 1)
                        ),

                        disabledBorder: OutlineInputBorder(

                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(

                                color: Colors.black45,
                                width: 1
                            )
                        ),
                        enabledBorder: OutlineInputBorder(

                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(

                                color: Colors.black45,
                                width: 1
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(
                                color: Colors.black,
                                width: 1
                            )
                        ),
                        contentPadding: EdgeInsets.all(size.height*0.01)
                    ),
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.number,

                  ),
                ),
              ),
              SizedBox(
                height: size.height*0.022,
              ),
              SizedBox(
                height: size.height*0.056,
                child: Padding(
                  padding: EdgeInsets.only(left:size.width*0.035,right:size.width*0.035),
                  child: TextField(
                    controller: lowerFullLenController,
                    readOnly: true,
                    onChanged: (value) {
                    },
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: size.height*0.02,
                    ),
                    decoration: InputDecoration(
                        labelText: "Lower body full length",
                        labelStyle: GoogleFonts.openSans(
                            fontWeight: FontWeight.w500,
                            fontSize: size.height*0.018,
                            color:  const Color.fromRGBO(73, 69, 79, 1)
                        ),
                        disabledBorder: OutlineInputBorder(

                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(

                                color: Colors.black45,
                                width: 1
                            )
                        ),
                        enabledBorder: OutlineInputBorder(

                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(

                                color: Colors.black45,
                                width: 1
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(
                                color: Colors.black,
                                width: 1
                            )
                        ),
                        contentPadding: EdgeInsets.all(size.height*0.01)
                    ),
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.number,

                  ),
                ),
              ),
              SizedBox(
                height: size.height*0.022,
              ),
              SizedBox(
                height: size.height*0.056,
                child: Padding(
                  padding: EdgeInsets.only(left:size.width*0.035,right:size.width*0.035),
                  child: TextField(
                    controller: bustController,
                    readOnly: true,
                    onChanged: (value) {
                      //calf.text=measurement["calf"]=value.toString();
                    },
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: size.height*0.02,
                    ),
                    decoration: InputDecoration(
                        labelText: "Bust",
                        labelStyle: GoogleFonts.openSans(
                            fontWeight: FontWeight.w500,
                            fontSize: size.height*0.018,
                            color:  const Color.fromRGBO(73, 69, 79, 1)
                        ),

                        disabledBorder: OutlineInputBorder(

                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(

                                color: Colors.black45,
                                width: 1
                            )
                        ),
                        enabledBorder: OutlineInputBorder(

                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(

                                color: Colors.black45,
                                width: 1
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(
                                color: Colors.black,
                                width: 1
                            )
                        ),
                        contentPadding: EdgeInsets.all(size.height*0.01)
                    ),
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.number,

                  ),
                ),
              ),

              SizedBox(
                height: size.height*0.022,
              ),

              SizedBox(
                height: size.height*0.056,
                child: Padding(
                  padding: EdgeInsets.only(left:size.width*0.035,right:size.width*0.035),
                  child: TextField(
                    controller: bustSeparationController,
                    readOnly: true,
                    onChanged: (value) {
                      //  thigh.text=measurement["thigh"]=value.toString();

                    },
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: size.height*0.02,
                    ),
                    decoration: InputDecoration(
                        labelText: "Bust separation",
                        labelStyle: GoogleFonts.openSans(
                            fontWeight: FontWeight.w500,
                            fontSize: size.height*0.018,
                            color:  const Color.fromRGBO(73, 69, 79, 1)
                        ),
                        disabledBorder: OutlineInputBorder(

                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(

                                color: Colors.black45,
                                width: 1
                            )
                        ),
                        enabledBorder: OutlineInputBorder(

                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(

                                color: Colors.black45,
                                width: 1
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(
                                color: Colors.black,
                                width: 1
                            )
                        ),
                        contentPadding: EdgeInsets.all(size.height*0.01)
                    ),
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.number,

                  ),
                ),
              ),
              SizedBox(
                height: size.height*0.022,
              ),
              SizedBox(
                height: size.height*0.056,
                child: Padding(
                  padding: EdgeInsets.only(left:size.width*0.035,right:size.width*0.035),
                  child: TextField(
                    controller: underBustController,
                    readOnly: true,
                    onChanged: (value) {
                    },
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: size.height*0.02,
                    ),
                    decoration: InputDecoration(
                        labelText: 'Under bust',
                        labelStyle: GoogleFonts.openSans(
                            fontWeight: FontWeight.w500,
                            fontSize: size.height*0.018,
                            color:  const Color.fromRGBO(73, 69, 79, 1)
                        ),
                        disabledBorder: OutlineInputBorder(

                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(

                                color: Colors.black45,
                                width: 1
                            )
                        ),
                        enabledBorder: OutlineInputBorder(

                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(

                                color: Colors.black45,
                                width: 1
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(
                                color: Colors.black,
                                width: 1
                            )
                        ),
                        contentPadding: EdgeInsets.all(size.height*0.01)
                    ),
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.number,

                  ),
                ),
              ),
              SizedBox(
                height: size.height*0.022,
              ),
              SizedBox(
                height: size.height*0.056,
                child: Padding(
                  padding: EdgeInsets.only(left:size.width*0.035,right:size.width*0.035),
                  child: TextField(
                    controller: bustHeightController,
                    readOnly: true,
                    onChanged: (value) {
                      // measurement["inseam"]=value.toString();

                    },
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: size.height*0.02,
                    ),
                    decoration: InputDecoration(
                        labelText: "Bust height",
                        labelStyle: GoogleFonts.openSans(
                            fontWeight: FontWeight.w500,
                            fontSize: size.height*0.018,
                            color:  const Color.fromRGBO(73, 69, 79, 1)
                        ),

                        disabledBorder: OutlineInputBorder(

                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(

                                color: Colors.black45,
                                width: 1
                            )
                        ),
                        enabledBorder: OutlineInputBorder(

                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(

                                color: Colors.black45,
                                width: 1
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(
                                color: Colors.black,
                                width: 1
                            )
                        ),
                        contentPadding: EdgeInsets.all(size.height*0.01)
                    ),
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.number,

                  ),
                ),
              ),
              SizedBox(
                height: size.height*0.022,
              ),
              SizedBox(
                height: size.height*0.056,
                child: Padding(
                  padding: EdgeInsets.only(left:size.width*0.035,right:size.width*0.035),
                  child: TextField(
                    controller: backWidthController,
                    readOnly: true,
                    onChanged: (value) {
                    },
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: size.height*0.02,
                    ),
                    decoration: InputDecoration(
                        labelText: "Back Width",
                        labelStyle: GoogleFonts.openSans(
                            fontWeight: FontWeight.w500,
                            fontSize: size.height*0.018,
                            color:  const Color.fromRGBO(73, 69, 79, 1)
                        ),
                        disabledBorder: OutlineInputBorder(

                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(

                                color: Colors.black45,
                                width: 1
                            )
                        ),
                        enabledBorder: OutlineInputBorder(

                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(

                                color: Colors.black45,
                                width: 1
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(
                                color: Colors.black,
                                width: 1
                            )
                        ),
                        contentPadding: EdgeInsets.all(size.height*0.01)
                    ),
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.number,

                  ),
                ),
              ),
              SizedBox(
                height: size.height*0.022,
              ),
              SizedBox(
                height: size.height*0.056,
                child: Padding(
                  padding: EdgeInsets.only(left:size.width*0.035,right:size.width*0.035),
                  child: TextField(
                    controller: hipHeightController,
                    readOnly: true,
                    onChanged: (value) {
                      //  thigh.text=measurement["thigh"]=value.toString();

                    },
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: size.height*0.02,
                    ),
                    decoration: InputDecoration(
                        labelText: "Hip height",
                        labelStyle: GoogleFonts.openSans(
                            fontWeight: FontWeight.w500,
                            fontSize: size.height*0.018,
                            color:  const Color.fromRGBO(73, 69, 79, 1)
                        ),
                        disabledBorder: OutlineInputBorder(

                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(

                                color: Colors.black45,
                                width: 1
                            )
                        ),
                        enabledBorder: OutlineInputBorder(

                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(

                                color: Colors.black45,
                                width: 1
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(
                                color: Colors.black,
                                width: 1
                            )
                        ),
                        contentPadding: EdgeInsets.all(size.height*0.01)
                    ),
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.number,

                  ),
                ),
              ),

              SizedBox(
                height: size.height*0.022,
              ),
              SizedBox(
                height: size.height*0.056,
                child: Padding(
                  padding: EdgeInsets.only(left:size.width*0.035,right:size.width*0.035),
                  child: TextField(
                    controller: calfController,
                    readOnly: true,
                    onChanged: (value) {
                    },
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: size.height*0.02,
                    ),
                    decoration: InputDecoration(
                        labelText: 'Calf',
                        labelStyle: GoogleFonts.openSans(
                            fontWeight: FontWeight.w500,
                            fontSize: size.height*0.018,
                            color:  const Color.fromRGBO(73, 69, 79, 1)
                        ),
                        disabledBorder: OutlineInputBorder(

                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(

                                color: Colors.black45,
                                width: 1
                            )
                        ),
                        enabledBorder: OutlineInputBorder(

                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(

                                color: Colors.black45,
                                width: 1
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(
                                color: Colors.black,
                                width: 1
                            )
                        ),
                        contentPadding: EdgeInsets.all(size.height*0.01)
                    ),
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.number,

                  ),
                ),
              ),
              SizedBox(
                height: size.height*0.022,
              ),
              SizedBox(
                height: size.height*0.056,
                child: Padding(
                  padding: EdgeInsets.only(left:size.width*0.035,right:size.width*0.035),
                  child: TextField(
                    controller: thighController,
                    readOnly: true,
                    onChanged: (value) {
                      // measurement["inseam"]=value.toString();

                    },
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: size.height*0.02,
                    ),
                    decoration: InputDecoration(
                        labelText: "Thigh",
                        labelStyle: GoogleFonts.openSans(
                            fontWeight: FontWeight.w500,
                            fontSize: size.height*0.018,
                            color:  const Color.fromRGBO(73, 69, 79, 1)
                        ),

                        disabledBorder: OutlineInputBorder(

                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(

                                color: Colors.black45,
                                width: 1
                            )
                        ),
                        enabledBorder: OutlineInputBorder(

                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(

                                color: Colors.black45,
                                width: 1
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(
                                color: Colors.black,
                                width: 1
                            )
                        ),
                        contentPadding: EdgeInsets.all(size.height*0.01)
                    ),
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.number,

                  ),
                ),
              ),
              SizedBox(
                height: size.height*0.022,
              ),
              SizedBox(
                height: size.height*0.056,
                child: Padding(
                  padding: EdgeInsets.only(left:size.width*0.035,right:size.width*0.035),
                  child: TextField(
                    controller: inseamController,
                    readOnly: true,

                    onChanged: (value) {
                    },
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: size.height*0.02,
                    ),
                    decoration: InputDecoration(
                        labelText: "Inseam",
                        labelStyle: GoogleFonts.openSans(
                            fontWeight: FontWeight.w500,
                            fontSize: size.height*0.018,
                            color:  const Color.fromRGBO(73, 69, 79, 1)
                        ),
                        disabledBorder: OutlineInputBorder(

                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(

                                color: Colors.black45,
                                width: 1
                            )
                        ),
                        enabledBorder: OutlineInputBorder(

                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(

                                color: Colors.black45,
                                width: 1
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(
                                color: Colors.black,
                                width: 1
                            )
                        ),
                        contentPadding: EdgeInsets.all(size.height*0.01)
                    ),
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.number,

                  ),
                ),
              ),
              SizedBox(
                height: size.height*0.022,
              ),
              SizedBox(
                height: size.height*0.056,
                child: Padding(
                  padding: EdgeInsets.only(left:size.width*0.035,right:size.width*0.035),
                  child: TextField(
                    controller: outSemController,
                    readOnly: true,
                    onChanged: (value) {
                    },
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: size.height*0.02,
                    ),
                    decoration: InputDecoration(
                        labelText: 'Outsem',
                        labelStyle: GoogleFonts.openSans(
                            fontWeight: FontWeight.w500,
                            fontSize: size.height*0.018,
                            color:  const Color.fromRGBO(73, 69, 79, 1)
                        ),
                        disabledBorder: OutlineInputBorder(

                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(

                                color: Colors.black45,
                                width: 1
                            )
                        ),
                        enabledBorder: OutlineInputBorder(

                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(

                                color: Colors.black45,
                                width: 1
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(size.width*0.02)),
                            borderSide: const BorderSide(
                                color: Colors.black,
                                width: 1
                            )
                        ),
                        contentPadding: EdgeInsets.all(size.height*0.01)
                    ),
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.number,

                  ),
                ),
              ),
              SizedBox(
                height: size.height*0.022,
              ),

              SizedBox(
                child: AutoSizeText("View Size Chart",
                  style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w600,
                      fontSize: size.height*0.023
                  ),),
              ),
              SizedBox(
                height: size.height*0.022,
              ),
              Container(
                height: size.height*0.67,
                width: size.width*0.98,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/viewSizeImage.png"),
                        fit: BoxFit.contain
                    )
                ),

              ),
              SizedBox(
                height: size.height*0.02,
              ),




              SizedBox(
                height: size.height*0.02,
              ),
            ],
          ),
        ),

      ),
    );
  }
}
