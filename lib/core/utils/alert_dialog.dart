import 'dart:collection';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:hpets/core/components/widgets/widgets.dart';
import 'package:hpets/core/constants/fonts.dart';
import 'package:hpets/core/extension/string_extension.dart';
import 'package:hpets/core/responsive/frame_size.dart';
import '../../main.dart';
import '../constants/colors.dart';
import 'config.dart';

TextEditingController mailInputController = TextEditingController();
TextEditingController suggestionInputController = TextEditingController();

TextEditingController currentPasswordInputController = TextEditingController();
TextEditingController newPasswordInputController = TextEditingController();
TextEditingController restartNewPasswordInputController =
    TextEditingController();
TextEditingController vaccineNameInputController = TextEditingController();
TextEditingController veterinaryInfoInputController = TextEditingController();
TextEditingController vaccineDateInputController = TextEditingController();
TextEditingController vaccineTimeInputController = TextEditingController();

TextEditingController diseaseNameInputController = TextEditingController();
TextEditingController diseaseContentInputController = TextEditingController();
TextEditingController diseaseDateInputController = TextEditingController();
TextEditingController diseaseTimeInputController = TextEditingController();

TextEditingController foodNameInputController = TextEditingController();
TextEditingController amountFoodInputController = TextEditingController();
TextEditingController foodDateInputController = TextEditingController();
TextEditingController foodTimeInputController = TextEditingController();

TextEditingController noteTitleInputController = TextEditingController();
TextEditingController noteContentInputController = TextEditingController();

TextEditingController veterinaryInfoAppInputController =
    TextEditingController();
TextEditingController petNameInputController = TextEditingController();
TextEditingController appointmentDateInputController = TextEditingController();
TextEditingController appointmentTimeInputController = TextEditingController();
TextEditingController appointmentAddressInputController =
    TextEditingController();


TextEditingController  editPetNameInputController = TextEditingController();
TextEditingController  editPetTypeInputController = TextEditingController();
TextEditingController  editPetGenderInputController = TextEditingController();
TextEditingController  editPetRaceInputController = TextEditingController();
TextEditingController  editPetAgeInputController = TextEditingController();

var refPets =
    FirebaseDatabase.instance.ref().child("pets_table").child(Config.token);
var notePets = FirebaseDatabase.instance
    .ref()
    .child("pets_table")
    .child(Config.token)
    .child(Config.petKey)
    .child("notes");

var vaccinesPets = FirebaseDatabase.instance
    .ref()
    .child("pets_table")
    .child(Config.token)
    .child(Config.petKey)
    .child("vaccines");
var diseasePets = FirebaseDatabase.instance
    .ref()
    .child("pets_table")
    .child(Config.token)
    .child(Config.petKey)
    .child("diseases");
var nutritionPets = FirebaseDatabase.instance
    .ref()
    .child("pets_table")
    .child(Config.token)
    .child(Config.petKey)
    .child("nutritions");
var appointmentPets = FirebaseDatabase.instance
    .ref()
    .child("pets_table")
    .child("appointments")
    .child(Config.token);
final _formKey = GlobalKey<FormState>();

class AlertDialogFunctions {
  static Object exitApp(BuildContext context) {
    const storage = FlutterSecureStorage();

    mailInputController.clear();
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "exit".tr,
                              style: TextStyle(
                                  fontFamily: themeFontBold, fontSize: 19),
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(Icons.close)),
                          ],
                        ),

                        Divider(
                          endIndent: 0,
                          indent: 0,
                        ),
                        // const Divider(
                        //   height: 15,
                        //   thickness: 0.5,
                        //   indent: 0,
                        //   endIndent: 0,
                        //   color: appThemeClr,
                        // ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "sure_want_exit".tr,
                          style: TextStyle(
                              fontSize: 14, fontFamily: themeFontRegular),
                        ),
                        SizedBox(
                          height: 35,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              flex: 1,
                              child: SizedBox(
                                  height: FrameSize.screenHeight / 14,
                                  child: hPetsElevatedButton(
                                      "no".tr,
                                      AppColors.appThemeClr,
                                      AppColors.whiteThemeClr,
                                      40,
                                      themeFontSemiBold,
                                      () => {
                                            Navigator.pop(context),
                                          })),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 1,
                              child: SizedBox(
                                  height: FrameSize.screenHeight / 14,
                                  child: hPetsElevatedButton(
                                      "yes".tr,
                                      AppColors.redThemeClr,
                                      AppColors.whiteThemeClr,
                                      40,
                                      themeFontSemiBold,
                                      () async => {
                                            await storage.delete(
                                                key: "remem_token"),
                                            Navigator.of(context)
                                                .pushReplacementNamed('/login'),
                                          })),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  static Object deletePet(BuildContext context) {
    const storage = FlutterSecureStorage();

    mailInputController.clear();
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "delete_pet".tr,
                              style: TextStyle(
                                  fontFamily: themeFontBold, fontSize: 19),
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(Icons.close)),
                          ],
                        ),

                        Divider(
                          endIndent: 0,
                          indent: 0,
                        ),
                        // const Divider(
                        //   height: 15,
                        //   thickness: 0.5,
                        //   indent: 0,
                        //   endIndent: 0,
                        //   color: appThemeClr,
                        // ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "are_you_sure_delete".tr,
                          style: TextStyle(
                              fontSize: 14, fontFamily: themeFontRegular),
                        ),
                        SizedBox(
                          height: 35,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              flex: 1,
                              child: SizedBox(
                                  height: FrameSize.screenHeight / 14,
                                  child: hPetsElevatedButton(
                                      "no".tr,
                                      AppColors.appThemeClr,
                                      AppColors.whiteThemeClr,
                                      40,
                                      themeFontSemiBold,
                                      () => {
                                            Navigator.pop(context),
                                          })),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 1,
                              child: SizedBox(
                                  height: FrameSize.screenHeight / 14,
                                  child: hPetsElevatedButton(
                                      "yes".tr,
                                      AppColors.redThemeClr,
                                      AppColors.whiteThemeClr,
                                      40,
                                      themeFontSemiBold,
                                      () async => {
                                            logger.i(Config.petKey),
                                            refPets
                                                .child(Config.petKey)
                                                .remove(),
                                            Navigator.pushNamed(
                                                context, '/bottomnav'),
                                          })),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  static Future forgotPassword(BuildContext context) {
    mailInputController.clear();
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'have_you_forgotten_your_password'.tr,
                          style: TextStyle(
                              fontFamily: themeFontBold, fontSize: 19),
                        ),
                        Divider(
                          endIndent: 0,
                          indent: 0,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "dont_worry".tr,
                          style: TextStyle(
                              fontSize: 14, fontFamily: themeFontRegular),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        hPetsTextFormField(
                            "email".tr,
                            mailInputController,
                            "email_required".tr,
                            TextInputType.text,
                            false,
                            "mail"),
                        SizedBox(
                          height: 25,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                                width: FrameSize.screenWidth,
                                height: FrameSize.screenHeight / 14,
                                child: hPetsElevatedButton(
                                    "send".tr,
                                    AppColors.appThemeClr,
                                    AppColors.whiteThemeClr,
                                    40,
                                    themeFontSemiBold,
                                    () => {
                                          if (_formKey.currentState!.validate())
                                            {
                                              print("Validated"),
                                              Config.resetPassword(
                                                  context, mailInputController)
                                            }
                                          else
                                            {
                                              print("Not Validated"),
                                            }
                                        })),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  static Future changePassword(BuildContext context) {
    mailInputController.clear();
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "change_password".tr,
                              style: TextStyle(
                                  fontFamily: themeFontBold, fontSize: 19),
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(Icons.close)),
                          ],
                        ),

                        Divider(
                          endIndent: 0,
                          indent: 0,
                        ),
                        // const Divider(
                        //   height: 15,
                        //   thickness: 0.5,
                        //   indent: 0,
                        //   endIndent: 0,
                        //   color: appThemeClr,
                        // ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "change_password_detail".tr,
                          style: TextStyle(
                              fontSize: 14, fontFamily: themeFontRegular),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        hPetsTextFormField(
                            "email".tr,
                            mailInputController,
                            "email_required".tr,
                            TextInputType.text,
                            false,
                            "mail"),
                        SizedBox(
                          height: 25,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                                width: FrameSize.screenWidth,
                                height: FrameSize.screenHeight / 14,
                                child: hPetsElevatedButton(
                                    "send".tr,
                                    AppColors.appThemeClr,
                                    AppColors.whiteThemeClr,
                                    40,
                                    themeFontSemiBold,
                                    () => {
                                          if (_formKey.currentState!.validate())
                                            {
                                              print("Validated"),
                                              Config.resetPassword(
                                                  context, mailInputController)
                                            }
                                          else
                                            {
                                              print("Not Validated"),
                                            }
                                        })),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  static Future infoAlert(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Registration is successful",
                          style: TextStyle(
                              fontFamily: themeFontBold, fontSize: 19),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Go to login and enjoy app !",
                          style: TextStyle(
                              fontSize: 16, fontFamily: themeFontRegular),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                                width: FrameSize.screenWidth,
                                height: FrameSize.screenHeight / 14,
                                child: hPetsElevatedButton(
                                    "Login",
                                    AppColors.appThemeClr,
                                    AppColors.whiteThemeClr,
                                    40,
                                    themeFontSemiBold,
                                    () => {
                                          Navigator.pushNamed(
                                            context,
                                            '/login',
                                          ),
                                        })),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  static Future opinionSuggestion(BuildContext context) {
    suggestionInputController.clear();
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "opinions_and_suggestions".tr,
                              style: TextStyle(
                                  fontFamily: themeFontBold, fontSize: 19),
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(Icons.close)),
                          ],
                        ),
                        Divider(
                          endIndent: 0,
                          indent: 0,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "let_us_know".tr,
                          style: TextStyle(
                              fontSize: 14, fontFamily: themeFontRegular),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        hPetsTextFormField("", suggestionInputController, "",
                            TextInputType.text, false, "else"),
                        SizedBox(
                          height: 25,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                                width: FrameSize.screenWidth,
                                height: FrameSize.screenHeight / 14,
                                child: hPetsElevatedButton(
                                    "send".tr,
                                    AppColors.appThemeClr,
                                    AppColors.whiteThemeClr,
                                    40,
                                    themeFontSemiBold,
                                    () => {
                                          Navigator.pop(context),
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text("it_was_send".tr),
                                          )),
                                        })),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  static Future languageSettings(BuildContext context) {
    suggestionInputController.clear();
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "language_settings".tr,
                              style: TextStyle(
                                  fontFamily: themeFontBold, fontSize: 19),
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(Icons.close)),
                          ],
                        ),
                        Divider(
                          endIndent: 0,
                          indent: 0,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "you_can_change_language".tr,
                          style: TextStyle(
                              fontSize: 14, fontFamily: themeFontRegular),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        DropdownButtonFormField2(
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 17, horizontal: 15),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40.0))),
                              filled: true,
                              hintText: "select_language".tr,
                              hintStyle: TextStyle(
                                  fontFamily: themeFontLight,
                                  color: AppColors.greyThemeClr,
                                  fontSize: 14.0)),
                          isExpanded: true,
                          hint: Text(
                            'select_language'.tr,
                            style: TextStyle(fontSize: 16),
                          ),
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          items: languageItems
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
                            Config.languageValue = value!;
                          },
                          onSaved: (value) {
                            selectedValue = value.toString();
                            logger.i(value);
                            Config.languageValue = value!;
                          },
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                                width: FrameSize.screenWidth,
                                height: FrameSize.screenHeight / 14,
                                child: hPetsElevatedButton(
                                    "update".tr,
                                    AppColors.appThemeClr,
                                    AppColors.whiteThemeClr,
                                    40,
                                    themeFontSemiBold,
                                    () => {
                                          if (Config.languageValue == "TR")
                                            {
                                              Get.updateLocale(
                                                  Locale("tr", "TR")),
                                            }
                                          else if (Config.languageValue == "EN")
                                            {
                                              Get.updateLocale(
                                                  Locale("en", "US")),
                                            },
                                          Navigator.pop(context),
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text("change_success".tr),
                                          )),
                                        })),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  static Future infoNoteDetail(BuildContext context, String? note_title,
      String? note_content, int indeks, String? note_id) {
    noteTitleInputController.text = note_title!;
    noteContentInputController.text = note_content!;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "note_detail".tr,
                              style: TextStyle(
                                  fontFamily: themeFontBold, fontSize: 19),
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(Icons.close)),
                          ],
                        ),
                        Divider(),
                        SizedBox(
                          height: 15,
                        ),
                        hPetsTextFormField(
                            "title".tr,
                            noteTitleInputController,
                            "title_required".tr,
                            TextInputType.text,
                            false,
                            "else"),
                        SizedBox(
                          height: 11,
                        ),
                        ContentTextFormField(noteContentInputController,
                            "content_required".tr, "content".tr),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              flex: 1,
                              child: SizedBox(
                                height: FrameSize.screenHeight / 14,
                                child: hPetsElevatedButton(
                                    "delete".tr,
                                    AppColors.redThemeClr,
                                    AppColors.whiteThemeClr,
                                    40,
                                    themeFontSemiBold,
                                    () => {
                                          if (_formKey.currentState!.validate())
                                            {
                                              print("Validated"),
                                              notePets.child(note_id!).remove(),
                                              Navigator.pop(context),
                                            }
                                          else
                                            {
                                              print("Not Validated"),
                                            }
                                        }),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 1,
                              child: SizedBox(
                                  height: FrameSize.screenHeight / 14,
                                  child: hPetsElevatedButton(
                                      "update".tr,
                                      AppColors.appThemeClr,
                                      AppColors.whiteThemeClr,
                                      40,
                                      themeFontSemiBold,
                                      () => {
                                            if (_formKey.currentState!
                                                .validate())
                                              {
                                                print("Validated"),
                                                updateNote(
                                                    noteTitleInputController
                                                        .text,
                                                    noteContentInputController
                                                        .text,
                                                    note_id!),
                                                Navigator.pop(context),
                                              }
                                            else
                                              {
                                                print("Not Validated"),
                                              }
                                          })),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  static Future infoVaccineDetail(
      BuildContext context,
      String? vaccine_name,
      String? vaccine_date,
      String? vaccine_time,
      String? veterinary_info,
      String? vaccine_id) {
    vaccineNameInputController.text = vaccine_name!;
    veterinaryInfoInputController.text = veterinary_info!;
    vaccineDateInputController.text = vaccine_date!;
    vaccineTimeInputController.text = vaccine_time!;

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "vaccine_detail".tr,
                              style: TextStyle(
                                  fontFamily: themeFontBold, fontSize: 19),
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(Icons.close)),
                          ],
                        ),
                        Divider(),
                        SizedBox(
                          height: 15,
                        ),
                        hPetsTextFormField(
                            "vaccine_name".tr,
                            vaccineNameInputController,
                            "Vaccine Name is required !",
                            TextInputType.text,
                            false,
                            "false"),
                        SizedBox(
                          height: 12,
                        ),

                        hPetsTextFormField(
                            "veterinary".tr,
                            veterinaryInfoInputController,
                            "Veterinary Info is required !",
                            TextInputType.text,
                            false,
                            "false"),

                        // hPetsTextFormField("Type", petTypeInputController, "required", TextInputType.text, false, "false"),

                        SizedBox(
                          height: 12,
                        ),

                        TextFormField(
                          controller: vaccineDateInputController,
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
                                lastDate: DateTime(2100)))!;
                            String dateSlug =
                                "${date.year.toString()}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";

                            vaccineDateInputController.text = dateSlug;
                          },
                        ),
                        SizedBox(
                          height: 12,
                        ),

                        TextFormField(
                          controller: vaccineTimeInputController,

                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 17, horizontal: 32),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40.0))),
                              filled: true,
                              hintText: "time".tr,
                              hintStyle: TextStyle(
                                  fontFamily: themeFontLight,
                                  color: AppColors.greyThemeClr,
                                  fontSize: 16.0)),
                          onTap: () {
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                            showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            ).then((value) {
                              vaccineTimeInputController.text =
                                  value!.format(context);
                            });
                          },
                          // controller: TextEditingController(text: selectedTime.format(context)),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              flex: 1,
                              child: SizedBox(
                                height: FrameSize.screenHeight / 14,
                                child: hPetsElevatedButton(
                                    "delete".tr,
                                    AppColors.redThemeClr,
                                    AppColors.whiteThemeClr,
                                    40,
                                    themeFontSemiBold,
                                    () => {
                                          if (_formKey.currentState!.validate())
                                            {
                                              print("Validated"),
                                              vaccinesPets
                                                  .child(vaccine_id!)
                                                  .remove(),
                                              vaccinesPets
                                                  .child(vaccine_id!)
                                                  .remove(),
                                              Navigator.pop(context),
                                            }
                                          else
                                            {
                                              print("Not Validated"),
                                            }
                                        }),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 1,
                              child: SizedBox(
                                  height: FrameSize.screenHeight / 14,
                                  child: hPetsElevatedButton(
                                      "update".tr,
                                      AppColors.appThemeClr,
                                      AppColors.whiteThemeClr,
                                      40,
                                      themeFontSemiBold,
                                      () => {
                                            if (_formKey.currentState!
                                                .validate())
                                              {
                                                print("Validated"),
                                                vaccine_name =
                                                    vaccineNameInputController
                                                        .text,
                                                vaccine_date =
                                                    vaccineDateInputController
                                                        .text,
                                                vaccine_time =
                                                    vaccineTimeInputController
                                                        .text,
                                                veterinary_info =
                                                    veterinaryInfoInputController
                                                        .text,
                                                updateVaccine(
                                                    vaccine_name!,
                                                    veterinary_info!,
                                                    vaccine_date!,
                                                    vaccine_time!,
                                                    vaccine_id!),
                                                Navigator.pop(context),
                                              }
                                            else
                                              {
                                                print("Not Validated"),
                                              }
                                          })),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  static Future infoDiseaseDetail(
      BuildContext context,
      String? disease_title,
      String? disease_date,
      String? disease_time,
      String? disease_content,
      String? disease_id) {
    diseaseNameInputController.text = disease_title!;
    diseaseContentInputController.text = disease_content!;
    diseaseDateInputController.text = disease_date!;
    diseaseTimeInputController.text = disease_time!;

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "disease_detail".tr,
                              style: TextStyle(
                                  fontFamily: themeFontBold, fontSize: 19),
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(Icons.close)),
                          ],
                        ),
                        Divider(),
                        SizedBox(
                          height: 15,
                        ),
                        hPetsTextFormField(
                            "disease_name".tr,
                            diseaseNameInputController,
                            "disease_name_required".tr,
                            TextInputType.text,
                            false,
                            "false"),
                        SizedBox(
                          height: 12,
                        ),

                        hPetsTextFormField(
                            "content".tr,
                            diseaseContentInputController,
                            "content_required".tr,
                            TextInputType.text,
                            false,
                            "false"),

                        // hPetsTextFormField("Type", petTypeInputController, "required", TextInputType.text, false, "false"),

                        SizedBox(
                          height: 12,
                        ),

                        TextFormField(
                          controller: diseaseDateInputController,
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
                                lastDate: DateTime(2100)))!;
                            String dateSlug =
                                "${date.year.toString()}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";

                            diseaseDateInputController.text = dateSlug;
                          },
                        ),
                        SizedBox(
                          height: 12,
                        ),

                        TextFormField(
                          controller: diseaseTimeInputController,

                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 17, horizontal: 32),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40.0))),
                              filled: true,
                              hintText: "time".tr,
                              hintStyle: TextStyle(
                                  fontFamily: themeFontLight,
                                  color: AppColors.greyThemeClr,
                                  fontSize: 16.0)),
                          onTap: () {
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                            showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            ).then((value) {
                              diseaseTimeInputController.text =
                                  value!.format(context);
                            });
                          },
                          // controller: TextEditingController(text: selectedTime.format(context)),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              flex: 1,
                              child: SizedBox(
                                height: FrameSize.screenHeight / 14,
                                child: hPetsElevatedButton(
                                    "delete".tr,
                                    AppColors.redThemeClr,
                                    AppColors.whiteThemeClr,
                                    40,
                                    themeFontSemiBold,
                                    () => {
                                          if (_formKey.currentState!.validate())
                                            {
                                              print("Validated"),
                                              diseasePets
                                                  .child(disease_id!)
                                                  .remove(),
                                              Navigator.pop(context),
                                            }
                                          else
                                            {
                                              print("Not Validated"),
                                            }
                                        }),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 1,
                              child: SizedBox(
                                  height: FrameSize.screenHeight / 14,
                                  child: hPetsElevatedButton(
                                      "update".tr,
                                      AppColors.appThemeClr,
                                      AppColors.whiteThemeClr,
                                      40,
                                      themeFontSemiBold,
                                      () => {
                                            if (_formKey.currentState!
                                                .validate())
                                              {
                                                print("Validated"),
                                                disease_title =
                                                    diseaseNameInputController
                                                        .text,
                                                disease_date =
                                                    diseaseDateInputController
                                                        .text,
                                                disease_time =
                                                    diseaseTimeInputController
                                                        .text,
                                                disease_content =
                                                    diseaseContentInputController
                                                        .text,
                                                updateDisease(
                                                    disease_title!,
                                                    disease_content!,
                                                    disease_date!,
                                                    disease_time!,
                                                    disease_id!),
                                                Navigator.pop(context),
                                              }
                                            else
                                              {
                                                print("Not Validated"),
                                              }
                                          })),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  static Future infoAppointmentDetail(
      BuildContext context,
      String? veterinaryInfo,
      String? petName,
      String? appointmentDate,
      String? appointmentTime,
      String? veterinary_address,
      String? appointment_id) {
    veterinaryInfoAppInputController.text = veterinaryInfo!;
    petNameInputController.text = petName!;
    appointmentDateInputController.text = appointmentDate!;
    appointmentTimeInputController.text = appointmentTime!;
    appointmentAddressInputController.text = veterinary_address!;

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "appointment_detail".tr,
                              style: TextStyle(
                                  fontFamily: themeFontBold, fontSize: 19),
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(Icons.close)),
                          ],
                        ),
                        Divider(),
                        SizedBox(
                          height: 15,
                        ),
                        DropdownButtonFormField2(
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 17, horizontal: 15),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40.0))),
                              filled: true,
                              hintText: "Select Type",
                              hintStyle: TextStyle(
                                  fontFamily: themeFontLight,
                                  color: AppColors.greyThemeClr,
                                  fontSize: 14.0)),
                          isExpanded: true,
                          hint: Text(
                            'select_pet'.tr,
                            style: TextStyle(fontSize: 16),
                          ),

                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),

                          items: Config.petListConfig
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
                          // validator: (value) {
                          //   if (value == null) {
                          //     return '     Please select pet !';
                          //   }
                          // },
                          onChanged: (value) {
                            // logger.i(value);
                            petNameInputController.text = value!;
                          },
                          onSaved: (value) {
                            selectedValue = value.toString();
                            // logger.i(value);
                            petNameInputController.text = value!;
                          },
                        ),

                        SizedBox(
                          height: 12,
                        ),

                        TextFormField(
                          controller: appointmentDateInputController,
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
                                lastDate: DateTime(2100)))!;
                            String dateSlug =
                                "${date.year.toString()}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";

                            appointmentDateInputController.text = dateSlug;
                          },
                        ),
                        SizedBox(
                          height: 12,
                        ),

                        TextFormField(
                          controller: appointmentTimeInputController,

                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 17, horizontal: 32),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40.0))),
                              filled: true,
                              hintText: "time".tr,
                              hintStyle: TextStyle(
                                  fontFamily: themeFontLight,
                                  color: AppColors.greyThemeClr,
                                  fontSize: 16.0)),
                          onTap: () {
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                            showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            ).then((value) {
                              appointmentTimeInputController.text =
                                  value!.format(context);
                            });
                          },
                          // controller: TextEditingController(text: selectedTime.format(context)),
                        ),

                        // hPetsTextFormField("Type", petTypeInputController, "required", TextInputType.text, false, "false"),

                        SizedBox(
                          height: 12,
                        ),

                        hPetsTextFormField(
                            "veterinary".tr,
                            veterinaryInfoAppInputController,
                            "veterinary_required".tr,
                            TextInputType.text,
                            false,
                            "false"),

                        SizedBox(
                          height: 12,
                        ),

                        ContentTextFormField(appointmentAddressInputController,
                            "address_required".tr, "address".tr),

                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              flex: 1,
                              child: SizedBox(
                                height: FrameSize.screenHeight / 14,
                                child: hPetsElevatedButton(
                                    "delete".tr,
                                    AppColors.redThemeClr,
                                    AppColors.whiteThemeClr,
                                    40,
                                    themeFontSemiBold,
                                    () => {
                                          if (_formKey.currentState!.validate())
                                            {
                                              print("Validated"),
                                              appointmentPets
                                                  .child(appointment_id!)
                                                  .remove(),
                                              Navigator.pop(context),
                                            }
                                          else
                                            {
                                              print("Not Validated"),
                                            }
                                        }),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 1,
                              child: SizedBox(
                                  height: FrameSize.screenHeight / 14,
                                  child: hPetsElevatedButton(
                                      "update".tr,
                                      AppColors.appThemeClr,
                                      AppColors.whiteThemeClr,
                                      40,
                                      themeFontSemiBold,
                                      () => {
                                            if (_formKey.currentState!
                                                .validate())
                                              {
                                                print("Validated"),
                                                veterinaryInfo =
                                                    veterinaryInfoAppInputController
                                                        .text,
                                                petName =
                                                    petNameInputController.text,
                                                appointmentDate =
                                                    appointmentDateInputController
                                                        .text,
                                                appointmentTime =
                                                    appointmentTimeInputController
                                                        .text,
                                                veterinary_address =
                                                    appointmentAddressInputController
                                                        .text,
                                                updateAppointment(
                                                    veterinaryInfo,
                                                    petName,
                                                    appointmentDate,
                                                    appointmentTime,
                                                    veterinary_address,
                                                    appointment_id),
                                                Navigator.pop(context),
                                              }
                                            else
                                              {
                                                print("Not Validated"),
                                              }
                                          })),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }



  static Future infoPetEdit(
      BuildContext context,
      String? petName,
      String? petType,
      String? petGender,
      String? petRace,
      String? petAge) {
    editPetNameInputController.text = petName!;
    editPetTypeInputController.text = petType!;
    editPetGenderInputController.text = petGender!;
    editPetRaceInputController.text = petRace!;
    editPetAgeInputController.text = petAge!;

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "pet_edit".tr,
                              style: TextStyle(
                                  fontFamily: themeFontBold, fontSize: 19),
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(Icons.close)),
                          ],
                        ),
                        Divider(),
                        SizedBox(
                          height: 15,
                        ),
                        hPetsTextFormField("name".tr, editPetNameInputController, "name_required".tr, TextInputType.text, false, "false"),

                        SizedBox(
                          height: 12,
                        ),

                        DropdownButtonFormField2(

                          decoration: InputDecoration(

                              contentPadding:
                              const EdgeInsets.symmetric(vertical: 17, horizontal: 15),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.all(Radius.circular(40.0))),
                              filled: true,
                              hintText: "select_pet",


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

                          items: petItems
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
                            editPetTypeInputController.text = value!;


                          },
                          onSaved: (value) {
                            selectedValue = value.toString();
                            logger.i(value);
                            editPetTypeInputController.text = value!;

                          },
                        ),
                        SizedBox(
                          height: 12,
                        ),

                        DropdownButtonFormField2(

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

                          items: genderItems
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
                            editPetGenderInputController.text = value!;


                          },
                          onSaved: (value) {
                            selectedValue = value.toString();
                            logger.i(value);
                            editPetGenderInputController.text = value!;

                          },
                        ),

                        // hPetsTextFormField("Type", petTypeInputController, "required", TextInputType.text, false, "false"),

                        SizedBox(
                          height: 12,
                        ),

                        hPetsTextFormField("race".tr, editPetRaceInputController, "race_required".tr, TextInputType.text, false, "false"),

                        SizedBox(
                          height: 12,
                        ),

                        hPetsTextFormField("age".tr, editPetAgeInputController, "age_required".tr, TextInputType.number, false, "false"),


                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [

                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 1,
                              child: SizedBox(
                                  height: FrameSize.screenHeight / 14,
                                  child: hPetsElevatedButton(
                                      "update".tr,
                                      AppColors.appThemeClr,
                                      AppColors.whiteThemeClr,
                                      40,
                                      themeFontSemiBold,
                                          () => {
                                        if (_formKey.currentState!
                                            .validate())
                                          {
                                            print("Validated"),
                                            petName = editPetNameInputController.text,
                                            petType = editPetTypeInputController.text,
                                            petGender = editPetGenderInputController.text,
                                            petRace = editPetRaceInputController.text,
                                            petAge = editPetAgeInputController.text,

                                            updatePet(petName!, petAge!, petRace!, petGender!, petType!),


                                            Navigator.pushNamed(
                                                context, '/bottomnav'),                                          }
                                        else
                                          {
                                            print("Not Validated"),
                                          }
                                      })),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }


  static Future infoNutritionDetail(
      BuildContext context,
      String? food_name,
      String? food_date,
      String? food_time,
      String? amount_of_food,
      String? food_id) {
    foodNameInputController.text = food_name!;
    amountFoodInputController.text = amount_of_food!;
    foodDateInputController.text = food_date!;
    foodTimeInputController.text = food_time!;

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "nutrition_detail".tr,
                              style: TextStyle(
                                  fontFamily: themeFontBold, fontSize: 19),
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(Icons.close)),
                          ],
                        ),
                        Divider(),
                        SizedBox(
                          height: 15,
                        ),
                        hPetsTextFormField(
                            "food_name".tr,
                            foodNameInputController,
                            "food_name_required".tr,
                            TextInputType.text,
                            false,
                            "false"),
                        SizedBox(
                          height: 12,
                        ),

                        hPetsTextFormField(
                            "amount_of_food".tr,
                            amountFoodInputController,
                            "amount_of_food_required".tr,
                            TextInputType.text,
                            false,
                            "false"),

                        // hPetsTextFormField("Type", petTypeInputController, "required", TextInputType.text, false, "false"),

                        SizedBox(
                          height: 12,
                        ),

                        TextFormField(
                          controller: foodDateInputController,
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
                                lastDate: DateTime(2100)))!;
                            String dateSlug =
                                "${date.year.toString()}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";

                            foodDateInputController.text = dateSlug;
                          },
                        ),
                        SizedBox(
                          height: 12,
                        ),

                        TextFormField(
                          controller: foodTimeInputController,

                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 17, horizontal: 32),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40.0))),
                              filled: true,
                              hintText: "time".tr,
                              hintStyle: TextStyle(
                                  fontFamily: themeFontLight,
                                  color: AppColors.greyThemeClr,
                                  fontSize: 16.0)),
                          onTap: () {
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                            showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            ).then((value) {
                              foodTimeInputController.text =
                                  value!.format(context);
                            });
                          },
                          // controller: TextEditingController(text: selectedTime.format(context)),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              flex: 1,
                              child: SizedBox(
                                height: FrameSize.screenHeight / 14,
                                child: hPetsElevatedButton(
                                    "delete".tr,
                                    AppColors.redThemeClr,
                                    AppColors.whiteThemeClr,
                                    40,
                                    themeFontSemiBold,
                                    () => {
                                          if (_formKey.currentState!.validate())
                                            {
                                              print("Validated"),
                                              nutritionPets
                                                  .child(food_id!)
                                                  .remove(),
                                              Navigator.pop(context),
                                            }
                                          else
                                            {
                                              print("Not Validated"),
                                            }
                                        }),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 1,
                              child: SizedBox(
                                  height: FrameSize.screenHeight / 14,
                                  child: hPetsElevatedButton(
                                      "update".tr,
                                      AppColors.appThemeClr,
                                      AppColors.whiteThemeClr,
                                      40,
                                      themeFontSemiBold,
                                      () => {
                                            if (_formKey.currentState!
                                                .validate())
                                              {
                                                print("Validated"),
                                                food_name = foodNameInputController.text,
                                                food_date = foodDateInputController.text,
                                                food_time = foodTimeInputController.text,
                                                amount_of_food = amountFoodInputController.text,
                                                updateNutrition(food_name!, amount_of_food!, food_time!, food_date!, food_id!),
                                                Navigator.pop(context),
                                              }
                                            else
                                              {
                                                print("Not Validated"),
                                              }
                                          })),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  static Future<void> updateNote(
      String note_title, String note_content, String note_id) async {
    var info = HashMap<String, dynamic>();
    info["note_title"] = note_title.basHarfleriBuyut();
    info["note_content"] = note_content;

    notePets.child(note_id).update(info);
  }

  static Future<void> updateDisease(
      String disease_title,
      String disease_content,
      String disease_date,
      String disease_time,
      String disease_id) async {
    var info = HashMap<String, dynamic>();
    info["disease_title"] = disease_title.basHarfleriBuyut();
    info["disease_content"] = disease_content;
    info["disease_date"] = disease_date;
    info["disease_time"] = disease_time;

    logger.i(disease_title);
    logger.i(disease_content);
    logger.i(disease_time);
    logger.i(disease_date);
    logger.i(disease_id);
    diseasePets.child(disease_id).update(info);
  }

  static Future<void> updateAppointment(
      String? veterinaryInfo,
      String? petName,
      String? appointmentDate,
      String? appointmentTime,
      String? veterinary_address,
      String? appointment_id) async {
    var info = HashMap<String, dynamic>();
    info["veterinary_info"] = veterinaryInfo!.basHarfleriBuyut();
    info["pet_name"] = petName;
    info["appointment_date"] = appointmentDate;
    info["appointment_time"] = appointmentTime;
    info["veterinary_address"] = veterinary_address;

    appointmentPets.child(appointment_id!).update(info);
  }

  static Future<void> updatePet(String pet_name, String pet_age, String pet_race, String pet_gender, String pet_type) async {
    // await FirebaseFirestore.instance
    //     .collection('Pets')
    //     .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid);


    var info = HashMap<String,dynamic>();
    info["pet_name"] = pet_name;
    info["pet_age"] = pet_age;
    info["pet_race"] = pet_race;
    info["pet_gender"] = pet_gender;
    info["pet_type"] = pet_type;
    info["pet_key"] = "";

    // logger.e(_auth.currentUser!.uid);
    refPets.child(Config.petKey).update(info);

  }


  static Future<void> updateNutrition(String foodName, String amonutFood,
      String foodTime, String foodDate, String food_id) async {
    var info = HashMap<String, dynamic>();
    info["food_name"] = foodName.basHarfleriBuyut();
    info["amount_of_food"] = amonutFood;
    info["food_date"] = foodDate;
    info["food_time"] = foodTime.basHarfleriBuyut();

    nutritionPets.child(food_id).update(info);
  }

  static Future<void> updateVaccine(String vaccine_name, String veterinary_info,
      String vaccine_date, String vaccine_time, String vaccine_id) async {
    var infoVacc = HashMap<String, dynamic>();
    infoVacc["vaccine_name"] = vaccine_name.basHarfleriBuyut();
    infoVacc["veterinary"] = veterinary_info;
    infoVacc["vaccine_date"] = vaccine_date;
    infoVacc["vaccine_time"] = vaccine_time;

    logger.i(vaccine_name);
    logger.i(veterinary_info);
    logger.i(vaccine_time);
    logger.i(vaccine_date);
    logger.i(vaccine_id);
    vaccinesPets.child(vaccine_id).update(infoVacc);
    // allVaccinesPets.child(vaccine_id).update(infoVacc);
  }
}

final List<String> languageItems = [
  'TR',
  'EN',
];


final List<String> genderItems = [
  'he'.tr,
  'she'.tr,
];

final List<String> petItems = [
  'dog'.tr,
  'cat'.tr,
  'bird'.tr,
  'fish'.tr,
  'turtle'.tr,
  'horse'.tr
];
