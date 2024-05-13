/*
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

import 'App sections/Order Pages/Home Page.dart';
import 'Authentication/login.dart';

class StorageStream extends StatelessWidget {
   StorageStream({Key? key}) : super(key: key);
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {

    return StreamBuilder(
      stream:box.read("UserToken"),
      builder: (context, snapshot) {
        return snapshot.hasData && snapshot.data!=null
            ?
        const MainHomePage()
            :
        const LogInPage();
      },);
  }
}
*/



import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'Api/Authentication Api.dart';
import 'Authentication/login.dart';
import 'Constraints.dart';
import 'navigationbar.dart';

class StorageStream extends StatefulWidget {
  const StorageStream({Key? key}) : super(key: key);

  @override
  _StorageStreamState createState() => _StorageStreamState();
}

class _StorageStreamState extends State<StorageStream> {
  final box = GetStorage();
  bool dataFetched=false;
  bool loginValue=false;
  @override
  void initState() {
    super.initState();
    userToken=box.read("UserToken").toString();
    whereToGo();
    print("User token is : $userToken");

  }

  @override
  Widget build(BuildContext context) {
    return  loginValue
        ?
    const Navigation()
        :
    const LogInPage();
  }

  Future<void> whereToGo() async{
    if(userToken!="null"){
      Authentication().getUser().then((value){
        if(value=="Session expired"){
          setState(() {
            loginValue=false;
          });
        }
        else{
          if(value=="success"){
            setState(() {
              loginValue=true;
            });
          }
        }
      });

    }
    else{
      setState(() {
        loginValue=false;
      });
    }

  }

}

