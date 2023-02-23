import 'dart:convert';
import 'dart:math';
import 'package:connectivity/connectivity.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hpets/core/utils/secure_storage.dart';
import '../../main.dart';
import '../constants/colors.dart';
import '../constants/fonts.dart';
import '../model/pets.dart';
import '../responsive/frame_size.dart';

class Config {

  static bool _loading = false;
  static final SecureStorage secureStorage = SecureStorage();
  static String token = '';
  static String displayName = '';
  static String key ="";
  static String petKey ="";
  static String languageValue ="";
  static String notTitle= "";
  static String notContent= "";
  static String formattedTime= "";
  static String formattedDate= "";
  static var petListConfig = [];
  static String? selectedValue;
  static var dropdownGenderList = genderItems;
  static var dropdownPetList = petItems;

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
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("check_email".tr), ));

      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("E-mail veya şifre hatalı!"), ))
    } on FirebaseAuthException catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("not_registered".tr), ));

      logger.i("Mail Gönderilemedi");

    };

  }

  static final List<String> languageItems = [
    'TR',
    'EN',
  ];

  static List<String> genderItems = [
    'he'.tr,
    'she'.tr,
  ];

  static List<String> genderItemsTr = [
    'Erkek',
    'Dişi',
  ];

  static List<String> genderItemsEn = [
    'He',
    'She',
  ];

  static List<String> petItems = [
    'dog'.tr,
    'cat'.tr,
    'bird'.tr,
    'fish'.tr,
    'turtle'.tr,
    'horse'.tr
  ];

  static List<String> petItemsTr = [
    'Köpek',
    'Kedi',
    'Kuş',
    'Balık',
    'Kaplumbağa',
    'At'
  ];

  static List<String> petItemsEn = [
    'Dog',
    'Cat',
    'Bird',
    'Fish',
    'Turtle',
    'Horse'
  ];


  static Image petImage (String pet_type) {
    return Image.asset(pet_type ==
        "Dog"
        ? "assets/images/guide_image_1.png"
        : pet_type == "Cat"
        ? "assets/images/guide_image_0.png"
        : pet_type == "Fish"
        ? "assets/images/guide_image_2.png"
        : pet_type == "Rabbit"
        ? "assets/images/guide_image_3.png"
        : pet_type ==
        "Bird"
        ? "assets/images/guide_image_4.png"
        : pet_type ==
        "Turtle"
        ? "assets/images/guide_image_5.png"
        : pet_type ==
        "Hamster"
        ? "assets/images/guide_image_6.png"
        : pet_type ==
        "Horse"
        ? "assets/images/guide_image_7.png"
        : pet_type ==
        "Köpek"
        ? "assets/images/guide_image_1.png"
        : pet_type ==
        "Kedi"
        ? "assets/images/guide_image_0.png"
        : pet_type == "Balık"
        ? "assets/images/guide_image_2.png"
        : pet_type == "Tavşan"
        ? "assets/images/guide_image_3.png"
        : pet_type == "Kuş"
        ? "assets/images/guide_image_4.png"
        : pet_type == "Kaplumbağa"
        ? "assets/images/guide_image_5.png"
        : pet_type == "Hamster"
        ? "assets/images/guide_image_6.png"
        : pet_type == "At"
        ? "assets/images/guide_image_7.png"
        : "");

  }


}