import 'dart:io';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '../../constants/fonts.dart';

List<File> imageList = [];
List<String> imageListPath = [];

TextFormField hPetsTextFormField(
    String hinttext,
    TextEditingController txtcontroller,
    String required,
    TextInputType textType,
    bool obscure
    ) {
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
              const EdgeInsets.symmetric(vertical: 19, horizontal: 19),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(40.0))),
          filled: true,

          hintText: hinttext,
          hintStyle: TextStyle(
              fontFamily: themeFontLight, color: Colors.grey, fontSize: 14.0)),

  obscureText: obscure,
  );
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
          TextStyle(fontFamily: fontFamily, fontSize: 18.0, color: Colors.white),
    ),
  );
}
