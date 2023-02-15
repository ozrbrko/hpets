import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hpets/core/components/widgets/cards.dart';
import 'package:hpets/core/components/widgets/widgets.dart';
import 'package:hpets/core/model/pets.dart';
import 'package:hpets/core/responsive/frame_size.dart';
import 'package:hpets/core/utils/alert_dialog.dart';
import 'package:hpets/view/notes/add_new_note.dart';
import '../../core/components/build_circular_indicator.dart';
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
  @override
  void initState() {
    //TODO: implement initState
    super.initState();
  }
  var refPets = FirebaseDatabase.instance.ref().child("pets_table").child(Config.token);
  var notePets = FirebaseDatabase.instance.ref().child("pets_table").child(Config.token).child(Config.petKey).child("notes");


  @override
  Widget build(BuildContext context) {
    FrameSize.init(context: context);
    return Scaffold(
      appBar: hpetsAppBar(context, true, "${widget.pet!.pet_name!}", false),
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
                    child: cardContainerDetail(
                        FrameSize.screenHeight,
                        FrameSize.screenWidth,
                        widget.pet!.pet_type!,
                        widget.pet!.pet_gender!,
                        widget.pet!.pet_age!,
                        widget.pet!.pet_name!)),

                SizedBox(
                  height: 45,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${widget.pet!.pet_name!}'s Notes",
                      style: TextStyle(
                          fontFamily: themeFontSemiBold, fontSize: 22),
                    ),
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
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 58.0),
                              child: ListView.builder(
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


                                        // Navigator.pushNamed(context, "/petdetail");
                                        // Navigator.push(context, MaterialPageRoute(builder: (context) => PetDetailPage(pet:pet)));
                                      },
                                      child: Column(
                                        children: [
                                          Card(
                                              color: Color(0xffE6E6E6),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10.0),
                                              ),
                                              child:

                                              // note.pet_id==widget.pet!.pet_id!?

                                              Container(
                                                height: 74,
                                                width: FrameSize.screenWidth,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(15.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      // Image.asset(pet.pet_type=="Dog"? "assets/images/guide_image_1.png" : pet.pet_type=="Cat"? "assets/images/guide_image_0.png" : pet.pet_type=="Fish"? "assets/images/guide_image_2.png" :pet.pet_type=="Rabbit"? "assets/images/guide_image_3.png": pet.pet_type=="Bird"? "assets/images/guide_image_4.png": pet.pet_type=="Turtle"? "assets/images/guide_image_5.png": pet.pet_type=="Hamster"? "assets/images/guide_image_6.png": pet.pet_type=="Horse"? "assets/images/guide_image_7.png": ""),


                                                      Center(
                                                        child: Container(
                                                          width: FrameSize.screenWidth/1.5,
                                                          // color:Colors.red,
                                                          child: Column(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment.center,
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Text(
                                                                overflow: TextOverflow.ellipsis,

                                                                note.note_title!,
                                                                style: TextStyle(
                                                                    color: AppColors.appThemeClr),
                                                              ),
                                                              SizedBox(height: 5,),

                                                              Text(
                                                                overflow: TextOverflow.ellipsis,

                                                                note.note_content!,
                                                                style: TextStyle(
                                                                    color: AppColors.appThemeClr),
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
                              ),
                            );

                          }else{
                            return  Center(child: Text("There is no recorded data in the list.",style: TextStyle(fontSize: 17,fontFamily: themeFontLight),));

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


  Future<void> deleteNote(String pet_id,int indeks) async {
    notePets.child(pet_id).remove();
  }

}
