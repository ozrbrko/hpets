import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hpets/core/components/widgets/widgets.dart';
import 'package:hpets/core/responsive/frame_size.dart';
import 'package:hpets/core/services/firebase_services.dart';
import 'package:hpets/core/utils/config.dart';
import 'package:hpets/main.dart';
import 'package:intl/intl.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/fonts.dart';
import '../../core/model/pets.dart';

class AddNewNote extends StatefulWidget {
  Pets? pet;
  AddNewNote({this.pet});

  @override
  State<AddNewNote> createState() => _AddNewNoteState();
}

class _AddNewNoteState extends State<AddNewNote> {

  TextEditingController  noteTitleInputController = TextEditingController();
  TextEditingController  noteContentInputController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    FrameSize.init(context: context);

    return Scaffold(
        appBar: hpetsAppBar(context, true, "new_note".tr,false),
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

                    hPetsTextFormField("title".tr, noteTitleInputController, "title_required".tr, TextInputType.text, false, "false"),

                    SizedBox(height: 10,),

                    ContentTextFormField(noteContentInputController,"content_required".tr,"content".tr),

                    SizedBox(
                      height: 25,
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                            width: FrameSize.screenWidth,
                            height: FrameSize.screenHeight/ 14,
                            child: hPetsElevatedButton("save".tr, AppColors.appThemeClr,AppColors.whiteThemeClr, 40, themeFontSemiBold,
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
                                      NoteService.addNote(Config.notTitle, Config.notContent, Config.formattedTime, Config.formattedDate, widget.pet!.pet_id!)
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
}