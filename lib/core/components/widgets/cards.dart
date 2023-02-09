import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hpets/core/extension/string_extension.dart';

import '../../constants/colors.dart';
import '../../constants/fonts.dart';
import '../../constants/images.dart';
import '../../responsive/frame_size.dart';
import '../../utils/config.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

Container
cardContainerDefault(double height){
  return Container(

    height: height,

    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: Color(0xffB1D1FF).withOpacity(0.1),
    ),
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Image.asset(Images.logo_hpets),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 45,
            ),
            Text(
              Config.toUtf8(
                "${_auth.currentUser!.displayName}"
                    .basHarfleriBuyut(),
              ),
              style: TextStyle(
                  fontFamily: themeFontBold, fontSize: 16),
            ),
            SizedBox(
              height: 10,
            ),
            Text(_auth.currentUser!.email!),
          ],
        )
      ],
    ),
  );
}


Container cardContainerDetail(double height, double width){
  return Container(

    height: height/5,
    width: width,

    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: Color(0xffB1D1FF).withOpacity(0.1),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
              height: height/8,
              child: Image.asset("assets/images/guide_image_1.png")),
          SizedBox(height: 10,),
          Text("Tony",style: TextStyle(
              color: AppColors.appThemeClr, fontFamily: themeFontBold,fontSize: 18),)
        ],
      ),
    )
  );
}


