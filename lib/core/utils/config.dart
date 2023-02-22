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

  static TextFormField DateTextFormField(BuildContext context, TextEditingController txtController) {

    return TextFormField(
      controller: txtController,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
              vertical: 17, horizontal: 32),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius:
              BorderRadius.all(Radius.circular(40.0))),
          filled: true,
          hintText: "date".tr,
          hintStyle: TextStyle(
              fontFamily: themeFontLight,
              color: AppColors.greyThemeClr,
              fontSize: 16.0)),
      onTap: () async {
        DateTime date = DateTime(1900);
        FocusScope.of(context)
            .requestFocus(new FocusNode());

        date = (await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2100),
            builder: (context, child) {
              return Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: ColorScheme.light(
                    primary: AppColors.appThemeClr,
                    // <-- SEE HERE
                    onPrimary: AppColors.whiteThemeClr,
                    // <-- SEE HERE
                    onSurface:
                    AppColors.blackThemeClr, // <-- SEE HERE
                  ),
                  textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(
                      primary: AppColors.appThemeClr, // button text color
                    ),
                  ),
                ),
                child: child!,
              );
            }))!;
        String dateSlug =
            "${date.year.toString()}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";

        txtController.text = dateSlug;
      },
    );
  }

  static TextFormField TimeTextFormField(BuildContext context, TextEditingController txtController) {

    return  TextFormField(
      controller: txtController,

      decoration: InputDecoration(

          contentPadding:
          const EdgeInsets.symmetric(vertical: 17, horizontal: 32),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(
                  Radius.circular(40.0))),
          filled: true,
          hintText: "time".tr,
          hintStyle: TextStyle(
              fontFamily: themeFontLight,
              color: AppColors.greyThemeClr,
              fontSize: 16.0)),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        showTimePicker(

          context: context,
          initialTime: TimeOfDay.now(),
          builder: (context, child) {
            return Theme(
              data: ThemeData.light().copyWith(
                colorScheme: ColorScheme.light(
                  // change the border color
                  primary: AppColors.appThemeClr,
                  // change the text color
                  onSurface: AppColors.appThemeClr,
                ),
                // button colors
                buttonTheme: ButtonThemeData(
                  colorScheme: ColorScheme.light(
                    primary: AppColors.appThemeClr,
                  ),
                ),
              ), child: child!,
            );
          },
        ).then((value) {

          txtController.text = value!.format(context);
          // setState(() {
          //   txtController.text = value!.format(context);
          // });
        });
      },
      // controller: TextEditingController(text: selectedTime.format(context)),
    );
  }


  static DropdownButtonFormField2 DropdownFormFieldPet (TextEditingController txtController) {
    return  DropdownButtonFormField2(

      decoration: InputDecoration(

          contentPadding:
          const EdgeInsets.symmetric(vertical: 17, horizontal: 15),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(40.0))),
          filled: true,
          hintText: "select_pet".tr,


          hintStyle: TextStyle(
              fontFamily: themeFontLight, color: AppColors.greyThemeClr, fontSize: 14.0)),
      isExpanded: true,
      hint:  Text(
        "select_pet".tr,
        style: TextStyle(fontSize: 16),
      ),

      dropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),

      items: Config.dropdownPetList
          .map((item) =>
          DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style:  TextStyle(
                fontSize: 16, color: AppColors.blackThemeClr,
              ),
            ),
          ))
          .toList(),
      validator: (value) {
        if (value == null) {
          return 'dropdown_required'.tr;
        }
      },
      onChanged: (value) {
        logger.i(value);
        txtController.text = value!;


      },
      onSaved: (value) {
        selectedValue = value.toString();
        logger.i(value);
        txtController.text = value!;

      },
    );

  }

  static DropdownButtonFormField2 DropdownFormFieldGender (TextEditingController txtController) {
    return DropdownButtonFormField2(

      decoration: InputDecoration(

          contentPadding:
          const EdgeInsets.symmetric(vertical: 17, horizontal: 15),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(40.0))),
          filled: true,
          hintText: "select_gender".tr,


          hintStyle: TextStyle(
              fontFamily: themeFontLight, color: AppColors.greyThemeClr, fontSize: 14.0)),
      isExpanded: true,
      hint:  Text(
        'select_gender'.tr,
        style: TextStyle(fontSize: 16),
      ),

      dropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),


      items: Config.dropdownGenderList
          .map((item) =>
          DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style:  TextStyle(
                fontSize: 16, color: AppColors.blackThemeClr,
              ),
            ),
          ))
          .toList(),
      validator: (value) {
        if (value == null) {
          return 'dropdown_required'.tr;
        }
      },
      onChanged: (value) {
        logger.i(value);
        txtController.text = value!;


      },
      onSaved: (value) {
        selectedValue = value.toString();
        logger.i(value);
        txtController.text = value!;

      },
    );


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
}