import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:hpets/core/utils/secure_storage.dart';

class Config {

  static bool _loading = false;
  static final SecureStorage secureStorage = SecureStorage();
  static String token = '';
  static String displayName = '';


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


  static String utf8FormatText(String text) {
    return utf8.decode(text.codeUnits).toString();
  }

  static String toUtf8(String text) {
    var encodedText = utf8.encode(text);
    return utf8.decode(encodedText);
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