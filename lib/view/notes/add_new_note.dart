import 'dart:collection';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hpets/core/components/widgets/widgets.dart';
import 'package:hpets/core/extension/string_extension.dart';
import 'package:hpets/core/responsive/frame_size.dart';
import 'package:hpets/core/utils/config.dart';
import 'package:hpets/main.dart';
import 'package:intl/intl.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/fonts.dart';
import '../../core/model/pets.dart';
import '../../core/utils/alert_dialog.dart';






class AddNewNote extends StatefulWidget {
  Pets? pet;
  AddNewNote({this.pet});

  @override
  State<AddNewNote> createState() => _AddNewNoteState();
}

class _AddNewNoteState extends State<AddNewNote> {

  var refPets = FirebaseDatabase.instance.ref().child("pets_table").child(Config.token);
  var notePets = FirebaseDatabase.instance.ref().child("pets_table").child("notes").child(Config.token);

  // var refPets = FirebaseDatabase.instance.ref().child("pets_table");

  // final databaseReference = FirebaseDatabase.instance.reference().child("pets_table");

  final FirebaseAuth _auth = FirebaseAuth.instance;
  var user =  FirebaseAuth.instance.currentUser;
  final String? uid = Config.token;


  final FirebaseDatabase database = FirebaseDatabase.instance;

  DateTime? selectedDate;
  @override
  initState() {
    super.initState();
    selectedDate = DateTime.now();
  }


  TextEditingController  noteTitleInputController = TextEditingController();
  TextEditingController  noteContentInputController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String? selectedValue;


  @override
  Widget build(BuildContext context) {

    FrameSize.init(context: context);

    return Scaffold(
        appBar: hpetsAppBar(context, true, "New Note",false),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [


                    SizedBox(
                      height: 45,
                    ),


                    hPetsTextFormField("Title", noteTitleInputController, "Title is required !",
                        TextInputType.text, false, "false"),

                    SizedBox(height: 10,),

                    TextFormField(

                      controller: noteContentInputController,


                      decoration: InputDecoration(

                          contentPadding:
                          const EdgeInsets.symmetric(vertical: 17, horizontal: 32),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(Radius.circular(40.0))),
                          filled: true,
                          hintText: "Content",

                          hintStyle: TextStyle(
                              fontFamily: themeFontLight,
                              color: AppColors.greyThemeClr,


                              fontSize: 16.0)),
                      maxLines: 6,
                      maxLength: 170,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                            width: FrameSize.screenWidth,
                            height: FrameSize.screenHeight/ 14,
                            child: hPetsElevatedButton(
                                "Save",
                                AppColors.appThemeClr,
                                40,
                                themeFontSemiBold,
                                    () => {

                                  if (_formKey.currentState!
                                      .validate())
                                    {
                                      print("Validated"),
                                      Config.notTitle= noteTitleInputController.text,
                                      Config.notContent= noteContentInputController.text,
                                      Config.formattedTime= DateFormat('kk:mm').format(DateTime.now()),
                                      Config.formattedDate= DateFormat('EEE d MMM').format(DateTime.now()),

                                      logger.e(Config.formattedDate),
                                      logger.e(Config.formattedTime),

                                      Navigator.pop(context),
                                      addNote(Config.notTitle, Config.notContent, Config.formattedTime, Config.formattedDate, "note_id", widget.pet!.pet_id!)



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
        )
    );
  }

  Future<void> addNote(String note_title, String note_content, String note_time, String note_date, String note_id, String pet_id) async {
    // await FirebaseFirestore.instance
    //     .collection('Pets')
    //     .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid);


    var info = HashMap<String,dynamic>();
    info["note_title"] = note_title.basHarfleriBuyut();
    info["note_content"] = note_content;
    info["note_time"] = note_time;
    info["note_date"] = note_date.basHarfleriBuyut();
    info["note_id"] = note_id;
    info["pet_id"] = pet_id;
    logger.e(_auth.currentUser!.uid);
    notePets.push().set(info);

  }


}

final List<String> genderItems = [
  'He',
  'She',
];

final List<String> petItems = [
  'Dog',
  'Cat',
  'Bird',
  'Fish',
  'Turtle',
  'Horse'
];



