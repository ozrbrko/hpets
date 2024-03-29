import 'dart:io';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:hpets/core/constants/images.dart';
import '../../../main.dart';
import '../../constants/colors.dart';
import '../../constants/fonts.dart';
import '../../responsive/frame_size.dart';
import '../../utils/config.dart';

List<File> imageList = [];
List<String> imageListPath = [];
String? selectedValue;

TextFormField hPetsTextFormField(
    String hinttext,
    TextEditingController txtcontroller,
    String required,
    TextInputType textType,
    bool obscure,
    String forValidation) {
  if (forValidation == "mail") {
    return TextFormField(
      controller: txtcontroller,
      onSaved: (deger) => txtcontroller.text = deger!,
      keyboardType: textType,

      // key: key1,

      validator: MultiValidator([
        RequiredValidator(errorText: required),
        EmailValidator(errorText: 'valid_email_address'.tr),
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
              fontFamily: themeFontLight,
              color: AppColors.greyThemeClr,
              fontSize: 16.0)),

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
        MinLengthValidator(8, errorText: 'password_must'.tr)
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
              fontFamily: themeFontLight,
              color: AppColors.greyThemeClr,
              fontSize: 16.0)),

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
              fontFamily: themeFontLight,
              color: AppColors.greyThemeClr,
              fontSize: 16.0)),



      obscureText: obscure,
    );
  }
}


TextFormField hPetsTextFormFieldPetName(
    String hinttext,
    TextEditingController txtcontroller,
    String required,
    TextInputType textType,
    bool obscure,
    String forValidation) {
  if (forValidation == "mail") {
    return TextFormField(
      controller: txtcontroller,
      onSaved: (deger) => txtcontroller.text = deger!,
      keyboardType: textType,

      // key: key1,

      validator: MultiValidator([
        RequiredValidator(errorText: required),
        EmailValidator(errorText: 'valid_email_address'.tr),
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
              fontFamily: themeFontLight,
              color: AppColors.greyThemeClr,
              fontSize: 16.0)),


    );
  } else if (forValidation == "password") {
    return TextFormField(
      controller: txtcontroller,
      onSaved: (deger) => txtcontroller.text = deger!,
      keyboardType: textType,

      // key: key1,

      validator: MultiValidator([
        RequiredValidator(errorText: required),
        MinLengthValidator(8, errorText: 'password_must'.tr)
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
              fontFamily: themeFontLight,
              color: AppColors.greyThemeClr,
              fontSize: 16.0)),

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
          counterText: '',

          contentPadding:
          const EdgeInsets.symmetric(vertical: 17, horizontal: 32),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(40.0))),
          filled: true,
          hintText: hinttext,
          hintStyle: TextStyle(
              fontFamily: themeFontLight,
              color: AppColors.greyThemeClr,
              fontSize: 16.0)),

      obscureText: obscure,
      maxLines: 1,
      maxLength: 15,
    );
  }
}


TextFormField hPetsTextFormFieldPetAge(
    String hinttext,
    TextEditingController txtcontroller,
    String required,
    TextInputType textType,
    bool obscure,
    String forValidation) {
  if (forValidation == "mail") {
    return TextFormField(
      controller: txtcontroller,
      onSaved: (deger) => txtcontroller.text = deger!,
      keyboardType: textType,

      // key: key1,

      validator: MultiValidator([
        RequiredValidator(errorText: required),
        EmailValidator(errorText: 'valid_email_address'.tr),
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
              fontFamily: themeFontLight,
              color: AppColors.greyThemeClr,
              fontSize: 16.0)),


    );
  } else if (forValidation == "password") {
    return TextFormField(
      controller: txtcontroller,
      onSaved: (deger) => txtcontroller.text = deger!,
      keyboardType: textType,

      // key: key1,

      validator: MultiValidator([
        RequiredValidator(errorText: required),
        MinLengthValidator(8, errorText: 'password_must'.tr)
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
              fontFamily: themeFontLight,
              color: AppColors.greyThemeClr,
              fontSize: 16.0)),

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
          counterText: '',

          contentPadding:
          const EdgeInsets.symmetric(vertical: 17, horizontal: 32),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(40.0))),
          filled: true,
          hintText: hinttext,
          hintStyle: TextStyle(
              fontFamily: themeFontLight,
              color: AppColors.greyThemeClr,
              fontSize: 16.0)),

      obscureText: obscure,
      maxLines: 1,
      maxLength: 2,
    );
  }
}

ElevatedButton hPetsElevatedButton(String text, Color btnColor, Color textColor,
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
          TextStyle(fontFamily: fontFamily, fontSize: 18.0, color: textColor),
    ),
  );
}

DropdownButtonFormField2 DropdownFormFieldGender(
    TextEditingController txtController) {
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
            fontFamily: themeFontLight,
            color: AppColors.greyThemeClr,
            fontSize: 14.0)),
    isExpanded: true,
    hint: Text(
      'select_gender'.tr,
      style: TextStyle(fontSize: 16),
    ),
    dropdownDecoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
    ),
    items: Config.dropdownGenderList
        .map((item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.blackThemeClr,
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

DropdownButtonFormField2 DropdownFormFieldPet(
    TextEditingController txtController) {
  return DropdownButtonFormField2(
    decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 17, horizontal: 15),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(40.0))),
        filled: true,
        hintText: "select_pet".tr,
        hintStyle: TextStyle(
            fontFamily: themeFontLight,
            color: AppColors.greyThemeClr,
            fontSize: 14.0)),
    isExpanded: true,
    hint: Text(
      "select_pet".tr,
      style: TextStyle(fontSize: 16),
    ),
    dropdownDecoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
    ),
    items: Config.dropdownPetList
        .map((item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.blackThemeClr,
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

TextFormField TimeTextFormField(
    BuildContext context, TextEditingController txtController) {
  return TextFormField(
    controller: txtController,

    decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 17, horizontal: 32),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(40.0))),
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
            ),
            child: child!,
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

TextFormField DateTextFormField(
    BuildContext context, TextEditingController txtController) {
  return TextFormField(
    controller: txtController,
    decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 17, horizontal: 32),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(40.0))),
        filled: true,
        hintText: "date".tr,
        hintStyle: TextStyle(
            fontFamily: themeFontLight,
            color: AppColors.greyThemeClr,
            fontSize: 16.0)),
    onTap: () async {
      DateTime date = DateTime(1900);
      FocusScope.of(context).requestFocus(new FocusNode());

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
                  onSurface: AppColors.blackThemeClr, // <-- SEE HERE
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

ElevatedButton hPetsElevatedButtonwithLogo(
    String text,
    Color btnColor,
    Color textColor,
    double btnRadius,
    String fontFamily,
    Function()? onPressed) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(btnColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(btnRadius),
        ))),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 20, child: Image.asset(Images.google_logo)),
        SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: TextStyle(
              fontFamily: fontFamily, fontSize: 18.0, color: textColor),
        ),
      ],
    ),
  );
}

DropdownButtonFormField2 hPetsDropdownFormField(String hinttext,
    List dropdownList, TextEditingController petGenderInputController) {
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
            fontFamily: themeFontLight,
            color: AppColors.greyThemeClr,
            fontSize: 14.0)),
    isExpanded: true,
    hint: Text(
      hinttext,
      style: TextStyle(fontSize: 16),
    ),
    dropdownDecoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
    ),
    items: dropdownList
        .map((item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.blackThemeClr,
                ),
              ),
            ))
        .toList(),
    validator: (value) {
      if (value == null) {
        return '     Please select pet !';
      }
    },
    onChanged: (value) {
      logger.i(value);
      petGenderInputController.text;
    },
    onSaved: (value) {
      selectedValue = value.toString();
      logger.i(value);
    },
  );
}

Container guideDetailContainer(int index) {
  if (index == 0) {
    return Container(
      child: Column(
        children: [
          Container(
            height: FrameSize.screenHeight / 5,
            decoration: BoxDecoration(
              color: Color(0xffB1D1FF).withOpacity(0.1),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Image.asset("assets/images/guide_image_$index.png"),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 45,
                    ),
                    Text(
                      "cat".tr,
                      style: TextStyle(fontFamily: themeFontBold, fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("cat_life".tr),
                  ],
                )
              ],
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Divider(),
                  SizedBox(
                    height: 20,
                  ),
                  Text("cat_detail".tr)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  } else if (index == 1) {
    return Container(
      child: Column(
        children: [
          Container(
            height: FrameSize.screenHeight / 5,
            decoration: BoxDecoration(
              color: Color(0xffB1D1FF).withOpacity(0.1),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Image.asset("assets/images/guide_image_$index.png"),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 45,
                    ),
                    Text(
                      "dog".tr,
                      style: TextStyle(fontFamily: themeFontBold, fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("cat_life".tr),
                  ],
                )
              ],
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Divider(),
                  SizedBox(
                    height: 20,
                  ),
                  Text("dog_detail".tr)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  } else if (index == 2) {
    return Container(
      child: Column(
        children: [
          Container(
            height: FrameSize.screenHeight / 5,
            decoration: BoxDecoration(
              color: Color(0xffB1D1FF).withOpacity(0.1),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Image.asset("assets/images/guide_image_$index.png"),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 45,
                    ),
                    Text(
                      "fish".tr,
                      style: TextStyle(fontFamily: themeFontBold, fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("fish_life".tr),
                  ],
                )
              ],
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Divider(),
                  SizedBox(
                    height: 20,
                  ),
                  Text("fish_detail".tr)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  } else if (index == 3) {
    return Container(
      child: Column(
        children: [
          Container(
            height: FrameSize.screenHeight / 5,
            decoration: BoxDecoration(
              color: Color(0xffB1D1FF).withOpacity(0.1),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Image.asset("assets/images/guide_image_$index.png"),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 45,
                    ),
                    Text(
                      "rabbit".tr,
                      style: TextStyle(fontFamily: themeFontBold, fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("rabbit_life".tr),
                  ],
                )
              ],
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Divider(),
                  SizedBox(
                    height: 20,
                  ),
                  Text("rabbit_detail".tr)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  } else if (index == 4) {
    return Container(
      child: Column(
        children: [
          Container(
            height: FrameSize.screenHeight / 5,
            decoration: BoxDecoration(
              color: Color(0xffB1D1FF).withOpacity(0.1),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Image.asset("assets/images/guide_image_$index.png"),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 45,
                    ),
                    Text(
                      "bird".tr,
                      style: TextStyle(fontFamily: themeFontBold, fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("bird_life".tr),
                  ],
                )
              ],
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Divider(),
                  SizedBox(
                    height: 20,
                  ),
                  Text("bird_detail".tr)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  } else if (index == 5) {
    return Container(
      child: Column(
        children: [
          Container(
            height: FrameSize.screenHeight / 5,
            decoration: BoxDecoration(
              color: Color(0xffB1D1FF).withOpacity(0.1),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Image.asset("assets/images/guide_image_$index.png"),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 45,
                    ),
                    Text(
                      "turtle".tr,
                      style: TextStyle(fontFamily: themeFontBold, fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("turtle_life".tr),
                  ],
                )
              ],
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Divider(),
                  SizedBox(
                    height: 20,
                  ),
                  Text("turtle_detail".tr)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  } else if (index == 6) {
    return Container(
      child: Column(
        children: [
          Container(
            height: FrameSize.screenHeight / 5,
            decoration: BoxDecoration(
              color: Color(0xffB1D1FF).withOpacity(0.1),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Image.asset("assets/images/guide_image_$index.png"),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 45,
                    ),
                    Text(
                      "hamster".tr,
                      style: TextStyle(fontFamily: themeFontBold, fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("hamster_life".tr),
                  ],
                )
              ],
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Divider(),
                  SizedBox(
                    height: 20,
                  ),
                  Text("hamster_detail".tr)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  } else if (index == 7) {
    return Container(
      child: Column(
        children: [
          Container(
            height: FrameSize.screenHeight / 5,
            decoration: BoxDecoration(
              color: Color(0xffB1D1FF).withOpacity(0.1),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Image.asset("assets/images/guide_image_$index.png"),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 45,
                    ),
                    Text(
                      "horse".tr,
                      style: TextStyle(fontFamily: themeFontBold, fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("horse_life".tr),
                  ],
                )
              ],
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Divider(),
                  SizedBox(
                    height: 20,
                  ),
                  Text("horse_detail".tr)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  } else {
    return Container();
  }
}

AppBar hpetsAppBar(
    BuildContext context, bool backButton, String appText, bool profileIcon) {
  return AppBar(
    automaticallyImplyLeading: backButton,
    centerTitle: true,
    title: Text(
      appText,
      style: TextStyle(
          color: AppColors.whiteThemeClr,
          letterSpacing: 1,
          fontFamily: themeFontRegular),
    ),
    actions: [
      profileIcon
          ? InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
              child: Container(
                  width: FrameSize.screenWidth / 6, child: Icon(Icons.person)))
          : Container(width: 0, height: 0),
      SizedBox(
        width: 15,
      )
    ],
    backgroundColor: AppColors.appThemeClr,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(25),
      ),
    ),
  );
}

TextFormField ContentTextFormField(
    TextEditingController txtcntrller, String required, String textHint) {
  return TextFormField(
    controller: txtcntrller,
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
        hintText: textHint,
        hintStyle: TextStyle(
            fontFamily: themeFontLight,
            color: AppColors.greyThemeClr,
            fontSize: 16.0)),
    maxLines: 6,
    maxLength: 170,
  );
}
