import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hpets/core/components/widgets/widgets.dart';
import 'package:hpets/core/model/diseases.dart';

import '../../core/components/build_circular_indicator.dart';
import '../../core/components/widgets/cards.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/fonts.dart';
import '../../core/model/pets.dart';
import '../../core/responsive/frame_size.dart';
import '../../core/utils/alert_dialog.dart';
import '../../core/utils/config.dart';
import '../../main.dart';
import 'add_new_disease.dart';

class DiseasesPage extends StatefulWidget {

  Pets? pet;
  DiseasesPage({this.pet});

  @override
  State<DiseasesPage> createState() => _DiseasesPageState();
}

class _DiseasesPageState extends State<DiseasesPage> {

  @override
  void initState() {
    //TODO: implement initState
    super.initState();
  }

  var refPets = FirebaseDatabase.instance.ref().child("pets_table").child(Config.token);
  var diseasePets = FirebaseDatabase.instance.ref().child("pets_table").child(Config.token).child(Config.petKey).child("diseases");



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
                        "${widget.pet!.pet_name!}'s Diseases",
                        style: TextStyle(
                            fontFamily: themeFontSemiBold, fontSize: 22),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> AddNewDisease(pet: widget.pet)));
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
                        stream: diseasePets.onValue,
                        builder: (context, event) {
                          if (event.hasData) {
                            var diseaseList = <Diseases>[];

                            var cameValue = event.data!.snapshot.value as dynamic;

                            if (cameValue != null) {
                              cameValue.forEach((key, nesne) {
                                var cameDisease = Diseases.fromJson(key, nesne);
                                diseaseList.add(cameDisease);
                                // Config.key = key;
                              });
                            }

                            if(diseaseList.length!=0){
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 58.0),
                                child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: diseaseList.length,
                                  itemBuilder: (context, indeks) {
                                    var disease = diseaseList[indeks];


                                    return
                                      disease.pet_id==widget.pet!.pet_id!?

                                      GestureDetector(
                                        onTap: () {

                                          logger.i("{${diseaseList[indeks].disease_content.toString()} tıklandı");
                                          logger.e(disease.pet_id);
                                          logger.e(widget.pet!.pet_id!);
                                          logger.e(disease.disease_id);


                                          AlertDialogFunctions.infoDiseaseDetail(context,disease.disease_title, disease.disease_date, disease.disease_time, disease.disease_content, disease.disease_id);                          // Navigator.pushNamed(context, "/petdetail");
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
                                                  height: 100,
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
                                                            // color: Colors.red,
                                                            child: Column(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment.center,
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Text(
                                                                  overflow: TextOverflow.ellipsis,

                                                                  "Disease Name: ${disease.disease_title}",
                                                                  style: TextStyle(
                                                                      color: AppColors.appThemeClr),
                                                                ),
                                                                SizedBox(height: 5,),
                                                                Text(
                                                                  overflow: TextOverflow.ellipsis,

                                                                  "Content: ${disease.disease_content}",
                                                                  style: TextStyle(
                                                                      color: AppColors.appThemeClr),
                                                                ),
                                                                SizedBox(height: 5,),

                                                                Text(
                                                                  "Date: ${disease.disease_date!} / ${disease.disease_time!}",
                                                                  style: TextStyle(
                                                                      color: AppColors.appThemeClr),
                                                                ),
                                                                SizedBox(height: 5,),


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
                                                            AlertDialogFunctions.infoDiseaseDetail(context,disease.disease_title, disease.disease_date, disease.disease_time, disease.disease_content, disease.disease_id);                          // Navigator.pushNamed(context, "/petdetail");

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
                            return BuildCircularIndicatorWidget();
                          }
                        },
                      ),
                    ),
                  ),

                ],

              ),
            ),
          ),


        ));
  }
}
