import 'dart:collection';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hpets/core/components/widgets/widgets.dart';
import 'package:hpets/core/constants/fonts.dart';
import 'package:hpets/core/extension/string_extension.dart';
import 'package:hpets/core/responsive/frame_size.dart';
import 'package:hpets/view/bottom_navigation_bar/all_vaccines_bottom.dart';
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


TextEditingController  diseaseNameInputController = TextEditingController();
TextEditingController  diseaseContentInputController = TextEditingController();
TextEditingController  diseaseDateInputController = TextEditingController();
TextEditingController  diseaseTimeInputController = TextEditingController();


TextEditingController foodNameInputController = TextEditingController();
TextEditingController amountFoodInputController = TextEditingController();
TextEditingController foodDateInputController = TextEditingController();
TextEditingController foodTimeInputController = TextEditingController();

TextEditingController noteTitleInputController = TextEditingController();
TextEditingController noteContentInputController = TextEditingController();

TextEditingController veterinaryInfoAppInputController = TextEditingController();
TextEditingController petNameInputController = TextEditingController();
TextEditingController appointmentDateInputController = TextEditingController();
TextEditingController appointmentTimeInputController = TextEditingController();
TextEditingController appointmentAddressInputController = TextEditingController();

var refPets =
FirebaseDatabase.instance.ref().child("pets_table").child(Config.token);
var notePets = FirebaseDatabase.instance.ref().child("pets_table").child(Config.token).child(Config.petKey).child("notes");


var vaccinesPets = FirebaseDatabase.instance.ref().child("pets_table").child(Config.token).child(Config.petKey).child("vaccines");
var diseasePets = FirebaseDatabase.instance.ref().child("pets_table").child(Config.token).child(Config.petKey).child("diseases");
var nutritionPets = FirebaseDatabase.instance.ref().child("pets_table").child(Config.token).child(Config.petKey).child("nutritions");

var appointmentPets = FirebaseDatabase.instance.ref().child("pets_table").child(Config.token).child(
    "appointments");
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
                              "Exit App",
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
                          "Are you sure you want to exit?",
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
                                      "No",
                                      AppColors.appThemeClr,
                                      40,
                                      themeFontSemiBold,
                                          () =>
                                      {
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
                                      "Yes",
                                      AppColors.redThemeClr,
                                      40,
                                      themeFontSemiBold,
                                          () async =>
                                      {
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
                              "Delete Pet",
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
                          "Are you sure you want to delete?",
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
                                      "No",
                                      AppColors.appThemeClr,
                                      40,
                                      themeFontSemiBold,
                                          () =>
                                      {
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
                                      "Yes",
                                      AppColors.redThemeClr,
                                      40,
                                      themeFontSemiBold,
                                          () async =>
                                      {
                                          logger.i(Config.petKey),
                                          refPets.child(Config.petKey).remove(),
                                          Navigator.pushNamed(context, '/bottomnav'),
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
                          "Have you forgotten your password?",
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
                          "Don't worry, write the email with which you are registered and we will send you the steps you must follow to change your password.",
                          style: TextStyle(
                              fontSize: 14, fontFamily: themeFontRegular),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        hPetsTextFormField(
                            "Email",
                            mailInputController,
                            "Email is required !",
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
                                    "Send Email",
                                    AppColors.appThemeClr,
                                    40,
                                    themeFontSemiBold,
                                        () =>
                                    {
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
                              "Change Password",
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
                          "You can change your password by incoming mail.",
                          style: TextStyle(
                              fontSize: 14, fontFamily: themeFontRegular),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        hPetsTextFormField(
                            "Email",
                            mailInputController,
                            "Email is required !",
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
                                    "Send Email",
                                    AppColors.appThemeClr,
                                    40,
                                    themeFontSemiBold,
                                        () =>
                                    {
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
                                    40,
                                    themeFontSemiBold,
                                        () =>
                                    {
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
                              "Opinion and Suggestions",
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
                          "Let us know your comments and suggestions !",
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
                                    "Send",
                                    AppColors.appThemeClr,
                                    40,
                                    themeFontSemiBold,
                                        () =>
                                    {
                                      Navigator.pop(context),
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                            " It was sent with success. Thank you !"),
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
                              "Note Detail",
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
                            "Title",
                            noteTitleInputController,
                            "Title is required !",
                            TextInputType.text,
                            false,
                            "else"),
                        SizedBox(
                          height: 11,
                        ),
                        ContentTextFormField(noteContentInputController,
                            "Content is required !","Content"),
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
                                    "Delete",
                                    AppColors.redThemeClr,
                                    40,
                                    themeFontSemiBold,
                                        () =>
                                    {
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
                                      "Update",
                                      AppColors.appThemeClr,
                                      40,
                                      themeFontSemiBold,
                                          () =>
                                      {
                                        if (_formKey.currentState!
                                            .validate())
                                          {
                                            print("Validated"),
                                            updateNote(
                                                noteTitleInputController.text,
                                                noteContentInputController.text,
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


  static Future infoVaccineDetail(BuildContext context, String? vaccine_name,
      String? vaccine_date, String? vaccine_time, String? veterinary_info,
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
                              "Vaccine Detail",
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
                            "Vaccine Name", vaccineNameInputController,
                            "Vaccine Name is required !", TextInputType.text,
                            false, "false"),
                        SizedBox(height: 12,),

                        hPetsTextFormField(
                            "Veterinary Info", veterinaryInfoInputController,
                            "Veterinary Info is required !", TextInputType.text,
                            false, "false"),

                        // hPetsTextFormField("Type", petTypeInputController, "required", TextInputType.text, false, "false"),

                        SizedBox(height: 12,),


                        TextFormField(
                          controller: vaccineDateInputController,
                          decoration: InputDecoration(

                              contentPadding:
                              const EdgeInsets.symmetric(
                                  vertical: 17, horizontal: 32),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(40.0))),
                              filled: true,
                              hintText: "Vaccine Date",
                              hintStyle: TextStyle(
                                  fontFamily: themeFontLight,
                                  color: AppColors.greyThemeClr,
                                  fontSize: 16.0)),
                          onTap: () async {
                            DateTime date = DateTime(1900);
                            FocusScope.of(context).requestFocus(
                                new FocusNode());

                            date = (await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100)))!;
                            String dateSlug = "${date.year.toString()}-${date
                                .month.toString().padLeft(2, '0')}-${date.day
                                .toString().padLeft(2, '0')}";

                            vaccineDateInputController.text = dateSlug;
                          },),
                        SizedBox(height: 12,),

                        TextFormField(
                          controller: vaccineTimeInputController,

                          decoration: InputDecoration(

                              contentPadding:
                              const EdgeInsets.symmetric(
                                  vertical: 17, horizontal: 32),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(40.0))),
                              filled: true,
                              hintText: "Vaccine Time",
                              hintStyle: TextStyle(
                                  fontFamily: themeFontLight,
                                  color: AppColors.greyThemeClr,
                                  fontSize: 16.0)),
                          onTap: () {
                            FocusScope.of(context).requestFocus(
                                new FocusNode());
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
                                    "Delete",
                                    AppColors.redThemeClr,
                                    40,
                                    themeFontSemiBold,
                                        () =>
                                    {
                                      if (_formKey.currentState!.validate())
                                        {
                                          print("Validated"),
                                          vaccinesPets.child(vaccine_id!)
                                              .remove(),
                                          vaccinesPets.child(vaccine_id!)
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
                                      "Update",
                                      AppColors.appThemeClr,
                                      40,
                                      themeFontSemiBold,
                                          () =>
                                      {
                                        if (_formKey.currentState!
                                            .validate())
                                          {
                                            print("Validated"),

                                            vaccine_name = vaccineNameInputController.text,
                                            vaccine_date = vaccineDateInputController.text,
                                            vaccine_time = vaccineTimeInputController.text,
                                            veterinary_info = veterinaryInfoInputController.text,


                                            updateVaccine(
                                                vaccine_name!, veterinary_info!,
                                                vaccine_date!, vaccine_time!,
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

  static Future infoDiseaseDetail(BuildContext context, String? disease_title,
      String? disease_date, String? disease_time, String? disease_content,
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
                              "Disease Detail",
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
                            "Disease Name", diseaseNameInputController,
                            "Disease Name is required !", TextInputType.text,
                            false, "false"),
                        SizedBox(height: 12,),

                        hPetsTextFormField(
                            "Disease Content", diseaseContentInputController,
                            "Disease Content is required !", TextInputType.text,
                            false, "false"),

                        // hPetsTextFormField("Type", petTypeInputController, "required", TextInputType.text, false, "false"),

                        SizedBox(height: 12,),


                        TextFormField(
                          controller: diseaseDateInputController,
                          decoration: InputDecoration(

                              contentPadding:
                              const EdgeInsets.symmetric(
                                  vertical: 17, horizontal: 32),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(40.0))),
                              filled: true,
                              hintText: "Disease Date",
                              hintStyle: TextStyle(
                                  fontFamily: themeFontLight,
                                  color: AppColors.greyThemeClr,
                                  fontSize: 16.0)),
                          onTap: () async {
                            DateTime date = DateTime(1900);
                            FocusScope.of(context).requestFocus(
                                new FocusNode());

                            date = (await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100)))!;
                            String dateSlug = "${date.year.toString()}-${date
                                .month.toString().padLeft(2, '0')}-${date.day
                                .toString().padLeft(2, '0')}";

                            diseaseDateInputController.text = dateSlug;
                          },),
                        SizedBox(height: 12,),

                        TextFormField(
                          controller: diseaseTimeInputController,

                          decoration: InputDecoration(

                              contentPadding:
                              const EdgeInsets.symmetric(
                                  vertical: 17, horizontal: 32),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(40.0))),
                              filled: true,
                              hintText: "Disease Time",
                              hintStyle: TextStyle(
                                  fontFamily: themeFontLight,
                                  color: AppColors.greyThemeClr,
                                  fontSize: 16.0)),
                          onTap: () {
                            FocusScope.of(context).requestFocus(
                                new FocusNode());
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
                                    "Delete",
                                    AppColors.redThemeClr,
                                    40,
                                    themeFontSemiBold,
                                        () =>
                                    {
                                      if (_formKey.currentState!.validate())
                                        {
                                          print("Validated"),
                                          diseasePets.child(disease_id!)
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
                                      "Update",
                                      AppColors.appThemeClr,
                                      40,
                                      themeFontSemiBold,
                                          () =>
                                      {
                                        if (_formKey.currentState!
                                            .validate())
                                          {
                                            print("Validated"),

                                            disease_title = diseaseNameInputController.text,
                                            disease_date = diseaseDateInputController.text,
                                            disease_time = diseaseTimeInputController.text,
                                            disease_content = diseaseContentInputController.text,


                                            updateDisease(
                                                disease_title!, disease_content!,
                                                disease_date!, disease_time!,
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

  static Future infoAppointmentDetail(BuildContext context, String? veterinaryInfo,
      String? petName, String? appointmentDate, String? appointmentTime,
      String? veterinary_address,String? appointment_id) {

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
                              "Appointment Detail",
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
                          hint: const Text(
                            'Select Your Pet',
                            style: TextStyle(fontSize: 16),
                          ),

                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),

                          items: Config.petListConfig
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

                        SizedBox(height: 12,),

                        TextFormField(
                          controller: appointmentDateInputController,
                          decoration: InputDecoration(

                              contentPadding:
                              const EdgeInsets.symmetric(vertical: 17, horizontal: 32),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(40.0))),
                              filled: true,
                              hintText: "Appointment Date",
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
                                lastDate: DateTime(2100)))!;
                            String dateSlug = "${date.year.toString()}-${date.month
                                .toString().padLeft(2, '0')}-${date.day.toString()
                                .padLeft(2, '0')}";

                            appointmentDateInputController.text = dateSlug;
                          },),
                        SizedBox(height: 12,),

                        TextFormField(
                          controller: appointmentTimeInputController,

                          decoration: InputDecoration(

                              contentPadding:
                              const EdgeInsets.symmetric(vertical: 17, horizontal: 32),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(40.0))),
                              filled: true,
                              hintText: "Appointment Time",
                              hintStyle: TextStyle(
                                  fontFamily: themeFontLight,
                                  color: AppColors.greyThemeClr,
                                  fontSize: 16.0)),
                          onTap: () {
                            FocusScope.of(context).requestFocus(new FocusNode());
                            showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            ).then((value) {

                                appointmentTimeInputController.text = value!.format(context);

                            });
                          },
                          // controller: TextEditingController(text: selectedTime.format(context)),
                        ),


                        // hPetsTextFormField("Type", petTypeInputController, "required", TextInputType.text, false, "false"),

                        SizedBox(height: 12,),

                        hPetsTextFormField("Veterinary Info", veterinaryInfoAppInputController,
                            "Veterinary Info is required !", TextInputType.text, false,
                            "false"),

                        SizedBox(height: 12,),

                        ContentTextFormField(appointmentAddressInputController,"Veterinary Address is required !","Veterinary Address"),


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
                                    "Delete",
                                    AppColors.redThemeClr,
                                    40,
                                    themeFontSemiBold,
                                        () =>
                                    {
                                      if (_formKey.currentState!.validate())
                                        {
                                          print("Validated"),
                                          appointmentPets.child(appointment_id!)
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
                                      "Update",
                                      AppColors.appThemeClr,
                                      40,
                                      themeFontSemiBold,
                                          () =>
                                      {
                                        if (_formKey.currentState!
                                            .validate())
                                          {
                                            print("Validated"),


                              veterinaryInfo = veterinaryInfoAppInputController.text,
                                  petName = petNameInputController.text,
                                  appointmentDate = appointmentDateInputController.text,
                                  appointmentTime = appointmentTimeInputController.text,
                                  veterinary_address = appointmentAddressInputController.text,


                                            updateAppointment(veterinaryInfo, petName, appointmentDate, appointmentTime, veterinary_address, appointment_id),
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

  static Future infoNutritionDetail(BuildContext context, String? food_name,
      String? food_date, String? food_time, String? amount_of_food,
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
                              "Nutrition Detail",
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
                            "Nutrition Name", foodNameInputController,
                            "Nutrition Name is required !", TextInputType.text,
                            false, "false"),
                        SizedBox(height: 12,),

                        hPetsTextFormField(
                            "Amount of Food", amountFoodInputController,
                            "Amount of Food is required !", TextInputType.text,
                            false, "false"),

                        // hPetsTextFormField("Type", petTypeInputController, "required", TextInputType.text, false, "false"),

                        SizedBox(height: 12,),


                        TextFormField(
                          controller: foodDateInputController,
                          decoration: InputDecoration(

                              contentPadding:
                              const EdgeInsets.symmetric(
                                  vertical: 17, horizontal: 32),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(40.0))),
                              filled: true,
                              hintText: "Food Date",
                              hintStyle: TextStyle(
                                  fontFamily: themeFontLight,
                                  color: AppColors.greyThemeClr,
                                  fontSize: 16.0)),
                          onTap: () async {
                            DateTime date = DateTime(1900);
                            FocusScope.of(context).requestFocus(
                                new FocusNode());

                            date = (await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100)))!;
                            String dateSlug = "${date.year.toString()}-${date
                                .month.toString().padLeft(2, '0')}-${date.day
                                .toString().padLeft(2, '0')}";

                            foodDateInputController.text = dateSlug;
                          },),
                        SizedBox(height: 12,),

                        TextFormField(
                          controller: foodTimeInputController,

                          decoration: InputDecoration(

                              contentPadding:
                              const EdgeInsets.symmetric(
                                  vertical: 17, horizontal: 32),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(40.0))),
                              filled: true,
                              hintText: "Food Time",
                              hintStyle: TextStyle(
                                  fontFamily: themeFontLight,
                                  color: AppColors.greyThemeClr,
                                  fontSize: 16.0)),
                          onTap: () {
                            FocusScope.of(context).requestFocus(
                                new FocusNode());
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
                                    "Delete",
                                    AppColors.redThemeClr,
                                    40,
                                    themeFontSemiBold,
                                        () =>
                                    {
                                      if (_formKey.currentState!.validate())
                                        {
                                          print("Validated"),
                                          nutritionPets.child(food_id!)
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
                                      "Update",
                                      AppColors.appThemeClr,
                                      40,
                                      themeFontSemiBold,
                                          () =>
                                      {
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


  static Future<void> updateNote(String note_title, String note_content,
      String note_id) async {
    var info = HashMap<String, dynamic>();
    info["note_title"] = note_title.basHarfleriBuyut();
    info["note_content"] = note_content;

    notePets.child(note_id).update(info);
  }

  static Future<void> updateDisease(String disease_title, String disease_content,
      String disease_date, String disease_time, String disease_id) async {
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


  static Future<void> updateAppointment(String? veterinaryInfo,
      String? petName, String? appointmentDate, String? appointmentTime,
      String? veterinary_address,String? appointment_id) async {
    var info = HashMap<String, dynamic>();
    info["veterinary_info"] = veterinaryInfo!.basHarfleriBuyut();
    info["pet_name"] = petName;
    info["appointment_date"] = appointmentDate;
    info["appointment_time"] = appointmentTime;
    info["veterinary_address"] = veterinary_address;

    appointmentPets.child(appointment_id!).update(info);
  }


  static Future<void> updateNutrition(String foodName, String amonutFood, String foodTime,
      String foodDate, String food_id) async {
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
