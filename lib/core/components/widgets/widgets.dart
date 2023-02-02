import 'dart:io';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '../../../main.dart';
import '../../constants/colors.dart';
import '../../constants/fonts.dart';

List<File> imageList = [];
List<String> imageListPath = [];
String? selectedValue;

TextFormField hPetsTextFormField(String hinttext, TextEditingController txtcontroller, String required, TextInputType textType, bool obscure, String forValidation) {

  if(forValidation == "mail"){

    return TextFormField(
      controller: txtcontroller,
      onSaved: (deger) => txtcontroller.text = deger!,
      keyboardType: textType,

      // key: key1,

      validator: MultiValidator([
        RequiredValidator(errorText: required),
        EmailValidator(
            errorText: 'Please write a valid email address !'),

      ]),
      decoration: InputDecoration(

          contentPadding:
          const EdgeInsets.symmetric(vertical: 17, horizontal: 32),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(40.0))),
          filled: true,

          hintText: hinttext,
          hintStyle: TextStyle(
              fontFamily: themeFontLight, color: AppColors.greyThemeClr, fontSize: 16.0)),

      obscureText: obscure,
    );
  } else if (forValidation == "password") {

    return TextFormField(
      controller: txtcontroller,
      onSaved: (deger) => txtcontroller.text = deger!,
      keyboardType: textType,

      // key: key1,

      validator: MultiValidator([
        RequiredValidator(errorText: required),
        MinLengthValidator(8, errorText: 'The password must consist of at least 8 elements !')

      ]),
      decoration: InputDecoration(

          contentPadding:
          const EdgeInsets.symmetric(vertical: 17, horizontal: 32),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(40.0))),
          filled: true,

          hintText: hinttext,
          hintStyle: TextStyle(
              fontFamily: themeFontLight, color: AppColors.greyThemeClr, fontSize: 16.0)),

      obscureText: obscure,
    );


  } else {
    return TextFormField(
      controller: txtcontroller,
      onSaved: (deger) => txtcontroller.text = deger!,
      keyboardType: textType,

      // key: key1,

      validator: MultiValidator([
        RequiredValidator(errorText: required),


      ]),
      decoration: InputDecoration(

          contentPadding:
          const EdgeInsets.symmetric(vertical: 17, horizontal: 32),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(40.0))),
          filled: true,

          hintText: hinttext,
          hintStyle: TextStyle(
              fontFamily: themeFontLight, color: AppColors.greyThemeClr, fontSize: 16.0)),

      obscureText: obscure,
    );

  }

}

ElevatedButton hPetsElevatedButton(String text, Color btnColor,
    double btnRadius, String fontFamily, Function()? onPressed) {
  return ElevatedButton(

    onPressed: onPressed,
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(btnColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(btnRadius),
        ))),

    child: Text(
      text,
      style:
          TextStyle(fontFamily: fontFamily, fontSize: 18.0, color: AppColors.whiteThemeClr),
    ),
  );
}






DropdownButtonFormField2 hPetsDropdownFormField(String hinttext, List dropdownList) {


    return DropdownButtonFormField2(

      decoration: InputDecoration(

          contentPadding:
          const EdgeInsets.symmetric(vertical: 17, horizontal: 15),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(40.0))),
          filled: true,
          hintText: "Select Type",


          hintStyle: TextStyle(
              fontFamily: themeFontLight, color: AppColors.greyThemeClr, fontSize: 14.0)),
      isExpanded: true,
      hint:  Text(
        hinttext,
        style: TextStyle(fontSize: 16),
      ),

      dropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),

      items: dropdownList
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
          return 'Please select pet.';
        }
      },
      onChanged: (value) {
        logger.i(value);
      },
      onSaved: (value) {
        selectedValue = value.toString();
        logger.i(value);
      },
    );


}

