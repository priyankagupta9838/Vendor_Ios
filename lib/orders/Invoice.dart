import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Api/checkoutApi.dart';
import '../utilityfunctions.dart';


class DownloadInvoice extends StatefulWidget {
  DownloadInvoice({Key? key,required this.orderId}) : super(key: key);
  String orderId="";
  @override
  State<DownloadInvoice> createState() => _DownloadInvoiceState();
}

class _DownloadInvoiceState extends State<DownloadInvoice> {

  String? systemPath='';
  bool downloadingStart=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return  GestureDetector(
      onTap: () async {
        downloadingStart=true;
        setState(() {

        });
        await CheckoutApi().downloadInvoice(widget.orderId,).then((value) {

          downloadingStart=false;
          setState(() {

          });
          UtilityFunctions().successToast("Invoice downloaded successfully");

        });

      },
      child: Container(
        height: size.height*0.046,
        width: size.width*0.9,
        decoration: BoxDecoration(
            color: const Color.fromRGBO(174, 144, 194, 1),
            borderRadius: BorderRadius.all(Radius.circular(size.width*0.025))
        ),
        child:
        downloadingStart
            ?
        Center(
          child: SizedBox(
            height: size.height*0.03,
            width: size.height*0.03,
            child: const CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
        )
            :
        Center(
          child: AutoSizeText("Download Invoice",
            style:GoogleFonts.openSans(
                color: Colors.white,
                fontSize: size.height*0.017,
                fontWeight: FontWeight.w600
            ),),
        ),
      ),
    );
  }
/* Future<bool> checkPermissions() async {
    bool granted=false;
    if(Platform.isAndroid){
      granted=  await Permission.manageExternalStorage.isGranted;
      print("..........$granted");
      if(!granted){
        await Permission.manageExternalStorage.request().then((value) {
          print("........${value.isDenied}....${value.isPermanentlyDenied}");
        });
      }
      granted = await Permission.accessMediaLocation.isGranted;
      if(!granted){
        await Permission.accessMediaLocation.request();
      }
      return (await Permission.manageExternalStorage.isGranted && await Permission.accessMediaLocation.isGranted);
    }
    if(Platform.isIOS){
      granted=  await Permission.mediaLibrary.isGranted;
      if(!granted){
        await Permission.mediaLibrary.request();
      }
      return await Permission.mediaLibrary.isGranted;
    }


 */
/*   final permissionStatus = await Permission.storage.status;
    if (permissionStatus.isDenied) {
      // Here just ask for the permission for the first time
      await Permission.storage.request();

      // I noticed that sometimes popup won't show after user press deny
      // so I do the check once again but now go straight to appSettings
      if (permissionStatus.isDenied) {
        await openAppSettings();
      }
    } else if (permissionStatus.isPermanentlyDenied) {
      // Here open app settings for user to manually enable permission in case
      // where permission was permanently denied
      await openAppSettings();
    } else {
      // Do stuff that require permission here
    }


    return permissionStatus.isGranted;//
    return false;
  }*/
/*Future<void> setSystemPath() async {
    Directory? directory;
    if(Platform.isAndroid){
      Directory? directory = await getExternalStorageDirectory();
      systemPath = directory?.path.toString().substring(0, 19);
      print("System path is : ${directory?.path.toString()}");
    }
    if(Platform.isIOS){
      directory= await getApplicationDocumentsDirectory();
      systemPath = directory.path;
    }
  }*/
/*check(){
    File file=File("$systemPath${widget.path}/${widget.pdfName}");
    if(file.existsSync()){
      setState(() {
        isDownloaded=false;
      });
    }
  }*/
}