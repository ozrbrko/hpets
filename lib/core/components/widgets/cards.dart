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

Container cardContainerDefault(double height) {
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
        Container(
          width: FrameSize.screenWidth / 1.9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 45,
              ),
              Text(
                overflow: TextOverflow.ellipsis,
                Config.toUtf8(
                  "${_auth.currentUser!.displayName}".basHarfleriBuyut(),
                ),
                style: TextStyle(fontFamily: themeFontBold, fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "${_auth.currentUser!.email!}",
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        )
      ],
    ),
  );
}

Container cardContainerDetail(double height, double width, String pet_type,
    String pet_gender, String pet_age, String pet_name) {
  return Container(
    height: height / 4,
    width: width,
    decoration: BoxDecoration(
      border: Border(
        top: BorderSide(
          width: 5.0,
          color: AppColors.appThemeClr,
        ),
      ),
      color: Color(0xffB1D1FF).withOpacity(0.1),
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16,
              ),
              Text(
                "Type",
                style: TextStyle(fontFamily: themeFontRegular),
              ),
              Text(
                "${pet_type}",
                style: TextStyle(fontFamily: themeFontBold, fontSize: 15),
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                "Gender",
                style: TextStyle(fontFamily: themeFontRegular),
              ),
              Text(
                "${pet_gender}",
                style: TextStyle(fontFamily: themeFontBold, fontSize: 15),
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                "Age",
                style: TextStyle(fontFamily: themeFontRegular),
              ),
              Text(
                "${pet_age}",
                style: TextStyle(fontFamily: themeFontBold, fontSize: 15),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: FrameSize.screenHeight / 8,
                  child: Image.asset(pet_type == "Dog"
                      ? "assets/images/guide_image_1.png"
                      : pet_type == "Cat"
                          ? "assets/images/guide_image_0.png"
                          : pet_type == "Fish"
                              ? "assets/images/guide_image_2.png"
                              : pet_type == "Rabbit"
                                  ? "assets/images/guide_image_3.png"
                                  : pet_type == "Bird"
                                      ? "assets/images/guide_image_4.png"
                                      : pet_type == "Turtle"
                                          ? "assets/images/guide_image_5.png"
                                          : pet_type == "Hamster"
                                              ? "assets/images/guide_image_6.png"
                                              : pet_type == "Horse"
                                                  ? "assets/images/guide_image_7.png"
                                                  : ""),
                ),
                SizedBox(
                  height: 7,
                ),
                Text("${pet_name}")
              ],
            ),
          )
        ],
      ),
    ),
  );
}
