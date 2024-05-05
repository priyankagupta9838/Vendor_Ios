import 'dart:io';

import 'package:flutter/material.dart';

class Image_viewer extends StatelessWidget {
  const Image_viewer({super.key, required this.path});
  final String  path ;
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black87,
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: CircleAvatar(
        radius: size.width*0.05,
        backgroundColor: Colors.black.withOpacity(0.5),
        child: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(Icons.clear),
        ),
      ),
      body: Center(
        child: Container(
          height: size.height*0.9,
          width: size.width,
          child: path.toString().contains("http")
          ?
          Image.network(path,fit: BoxFit.fill,)
          :
          Image.file(File(path,),fit: BoxFit.fill),
        ),
      ),
    );
  }
}
