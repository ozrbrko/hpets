import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class Config {

  static bool _loading = false;

  static Future <Widget> loading() async{
    return Center(
      child: SizedBox(
        child: CircularProgressIndicator(
          strokeWidth: 2.5,
        ),
        height: 26.0,
        width: 26.0,
      ),
    );
  }

  static Future<bool> check() async {
    final Connectivity _connectivity = Connectivity();
    var connectivityResult =  await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {

      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }


}