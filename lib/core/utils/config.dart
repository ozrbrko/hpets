import 'dart:convert';
import 'dart:math';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hpets/core/utils/secure_storage.dart';
import '../../main.dart';
import '../model/pets.dart';

class Config {


  static bool _loading = false;
  static final SecureStorage secureStorage = SecureStorage();
  static String token = '';
  static String displayName = '';
  static String key ="";
  static String notTitle= "";
  static String notContent= "";
  static String formattedTime= "";
  static String formattedDate= "";
  static var petListConfig = [];
  // logger.i(Config.petListConfig[1].pet_name

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


  static String generateRandomId() {
    final random = Random.secure();
    return random.nextInt(100000000).toString();
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
  TextEditingController mailInputController = TextEditingController();
  static Future resetPassword(BuildContext context,TextEditingController textEditingController) async{
    try {



      await FirebaseAuth.instance.sendPasswordResetEmail(email: textEditingController.text.trim());
      logger.i("Mail Gönderildi}");
      Navigator.pop(context);
      // mailInputController.clear();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(" Check your email address please !"), ));

      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("E-mail veya şifre hatalı!"), ))
    } on FirebaseAuthException catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(" This email is not registered in the system !"), ));

      logger.i("Mail Gönderilemedi");

    };

  }


}