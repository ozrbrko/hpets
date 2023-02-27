import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hpets/core/components/widgets/cards.dart';
import 'package:hpets/core/components/widgets/widgets.dart';
import 'package:hpets/core/extension/string_extension.dart';
import 'package:hpets/core/model/pets.dart';
import 'package:hpets/core/responsive/frame_size.dart';
import 'package:hpets/core/utils/alert_dialog.dart';
import 'package:hpets/view/notes/add_new_note.dart';
import '../../core/other/build_circular_indicator.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/fonts.dart';
import '../../core/model/notes.dart';
import '../../core/utils/config.dart';
import '../../main.dart';

class NotesPage extends StatefulWidget {

  Pets? pet;
  NotesPage({this.pet});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {

  var notePets = FirebaseDatabase.instance.ref().child("pets_table").child(Config.token).child(Config.petKey).child("notes");


  @override
  Widget build(BuildContext context) {
    FrameSize.init(context: context);
    String lower_pet_type = widget.pet!.pet_type!.toLowerCase();
    String lower_pet_gender = widget.pet!.pet_gender!.toLowerCase();

    return Scaffold(
      appBar: hpetsAppBar(context, true, "${widget.pet!.pet_name!.basHarfleriBuyut()}", false),
      body: Container(
        height: FrameSize.screenHeight,
        width: FrameSize.screenWidth,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    // not: Evcil hayvan bilgi kartı ->
                    child: cardContainerDetail(
                        FrameSize.screenHeight,
                        FrameSize.screenWidth,
                        lower_pet_type,
                        lower_pet_gender,
                        widget.pet!.pet_age!,
                        widget.pet!.pet_name!)),

                SizedBox(
                  height: 45,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    RichText(
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: widget.pet!.pet_name,
                            style: TextStyle(
                                fontFamily: themeFontSemiBold,
                                fontSize: 22,color: AppColors.blackThemeClr)),
                        TextSpan(
                          text: "_notes".tr,
                          style: TextStyle(
                              fontFamily: themeFontSemiBold,
                              fontSize: 22,color: AppColors.blackThemeClr),
                        ),
                      ]),
                    ),

                    // not: Yeni not ekleme ->
                    GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> AddNewNote(pet: widget.pet)));
                        },
                        child: Icon(
                          Icons.add_box,
                          color: AppColors.appThemeClr,
                          size: 40,
                        )),
                  ],
                ),
                Divider(),
                // not: Notlar liste ->
                SingleChildScrollView(

                  child: Container(
                    height: FrameSize.screenHeight/1.75,
                    child: StreamBuilder<DatabaseEvent>(
                      stream: notePets.onValue,
                      builder: (context, event) {
                        if (event.hasData) {
                          var noteList = <Notes>[];

                          var cameValue = event.data!.snapshot.value as dynamic;

                          if (cameValue != null) {
                            cameValue.forEach((key, nesne) {
                              var cameNote = Notes.fromJson(key, nesne);
                              noteList.add(cameNote);
                              // Config.key = key;
                            });
                          }

                          if(noteList.length!=0){
                            return ListView.builder(

                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: noteList.length,
                              itemBuilder: (context, indeks) {
                                var note = noteList[indeks];

                                return
                                  note.pet_id==widget.pet!.pet_id!?

                                  GestureDetector(
                                    onTap: () {

                                      logger.i("{${noteList[indeks].note_time.toString()} tıklandı");
                                      logger.e(note.pet_id);
                                      logger.e(widget.pet!.pet_id!);
                                      logger.e(note.note_id);

                                      AlertDialogFunctions.infoNoteDetail(context,note.note_title,note.note_content,indeks,note.note_id);
                                    },
                                    child: Column(
                                      children: [
                                        Card(
                                            color: Color(0xffE6E6E6),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10.0),
                                            ),
                                            child:

                                            Container(
                                              height: 74,
                                              width: FrameSize.screenWidth,
                                              child: Padding(
                                                padding: const EdgeInsets.all(15.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Center(
                                                      child: Container(
                                                        width: FrameSize.screenWidth/1.6,
                                                        // color:Colors.red,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.center,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [

                                                            RichText(
                                                              text: TextSpan(children: <TextSpan>[
                                                                TextSpan(
                                                                    text: "title".tr,
                                                                    style: TextStyle(
                                                                        color: AppColors.appThemeClr,fontFamily: themeFontRegular)),
                                                                TextSpan(
                                                                  text: " ${note.note_title!}".length > 25 ? '${" ${note.note_title!}".substring(0, 25)}...' : " ${note.note_title!}",

                                                                  style: TextStyle(
                                                                      color: AppColors.appThemeClr,fontFamily: themeFontBold),

                                                                ),
                                                              ]),
                                                            ),

                                                            SizedBox(height: 5,),

                                                            RichText(
                                                              text: TextSpan(children: <TextSpan>[
                                                                TextSpan(
                                                                    text: "content".tr,
                                                                    style: TextStyle(
                                                                        color: AppColors.appThemeClr,fontFamily: themeFontRegular)),
                                                                TextSpan(
                                                                  text: " ${note.note_content!}".length > 18 ? '${" ${note.note_content!}".substring(0, 18)}...' : " ${note.note_content!}",

                                                                  style: TextStyle(
                                                                      color: AppColors.appThemeClr,fontFamily: themeFontBold),

                                                                ),
                                                              ]),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    IconButton(
                                                      icon: Icon(
                                                        Icons.info_outline_rounded,
                                                        color: AppColors.appThemeClr,
                                                      ),
                                                      onPressed: () {
                                                        AlertDialogFunctions.infoNoteDetail(context,note.note_title,note.note_content,indeks,note.note_id);
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          // :Container()
                                        ),
                                      ],
                                    ),
                                  ): Container();
                              },
                            );

                          }else{
                            return  Center(child: Text("there_is_no".tr,style: TextStyle(fontSize: 17,fontFamily: themeFontLight),));
                          }
                        } else {
                          return BuildCircularIndicatorWidget();                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
