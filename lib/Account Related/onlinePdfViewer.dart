import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class OnlinePdfViewer extends StatefulWidget {

  const OnlinePdfViewer({super.key, required this.url,});
  final String url;

  @override
  State<OnlinePdfViewer> createState() => _OnlinePdfViewerState();
}

class _OnlinePdfViewerState extends State<OnlinePdfViewer> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.8,
      width: size.width * 1,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: size.height*.8,
          width: size.width*1,
          color: Colors.transparent,

          child:  const PDF(enableSwipe: true,swipeHorizontal: false,fitEachPage: true,autoSpacing: false,).fromUrl(
              widget.url,
              placeholder: (error)=>const Center(child: Text("loading...",
              ),
              )
          ),
        ),
      ),
    );
  }
}
