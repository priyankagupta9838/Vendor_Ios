import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:vendor/Authentication/login.dart';
import 'package:vendor/storagestream.dart';

class CheckConnection extends StatelessWidget {
  const CheckConnection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: InternetCheck(),
    );
  }
}

class InternetCheck extends StatefulWidget {
  const InternetCheck({Key? key}) : super(key: key);

  @override
  State<InternetCheck> createState() => _InternetCheckState();
}

class _InternetCheckState extends State<InternetCheck> {
  late bool isConnected;
  late bool isBluetooth;

  @override
  void initState() {
    super.initState();
    checkConnectivity();
  }

  Future<void> checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        isConnected = false;
        isBluetooth = false;
      });
    } else if (connectivityResult == ConnectivityResult.bluetooth) {
      setState(() {
        isConnected = false;
        isBluetooth = true;
      });
    } else {
      setState(() {
        isConnected = true;
        isBluetooth = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!isConnected) {
      if (isBluetooth) {
        return const LogInPage();
      } else {
        return const LogInPage();
      }
    } else {
      return const StorageStream(); // Change this to the widget you want to display when connected
    }
  }
}
