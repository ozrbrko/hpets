import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hpets/core/components/widgets/widgets.dart';
import 'package:hpets/core/extension/string_extension.dart';
import 'package:hpets/core/model/diseases.dart';
import '../../core/components/widgets/cards.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/fonts.dart';
import '../../core/model/pets.dart';
import '../../core/other/build_circular_indicator.dart';
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

  var diseasePets = FirebaseDatabase.instance.ref().child("pets_table").child(Config.token).child(Config.petKey).child("diseases");

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
                  // not: evcil hayvan bilgi kartı ->
                  ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
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
                            text: "_diseases".tr,
                            style: TextStyle(
                                fontFamily: themeFontSemiBold,
                                fontSize: 22,color: AppColors.blackThemeClr),

                          ),
                        ]),
                      ),

                      // not: Yeni hastalık ekleme ->
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

                  // not: Hastalık listesi ->
                  SingleChildScrollView(

                    child: Container(
                      height: FrameSize.screenHeight/2.6,
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
                              return ListView.builder(

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
                                                height: 100,
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
                                                          // color: Colors.red,
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              RichText(
                                                                text: TextSpan(children: <TextSpan>[
                                                                  TextSpan(
                                                                      text: "disease_name".tr,
                                                                      style: TextStyle(
                                                                          color: AppColors.appThemeClr,fontFamily: themeFontRegular)),
                                                                  TextSpan(
                                                                    text: "${disease.disease_title!}".length > 20 ? '${"${disease.disease_title!}".substring(0, 20)}...' : "${disease.disease_title!}",

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

                                                                    text: "${disease.disease_content!}".length > 24 ? '${"${disease.disease_content!}".substring(0, 24)}...' : "${disease.disease_content!}",
                                                                    style: TextStyle(                                                                    overflow: TextOverflow.ellipsis,

                                                                        color: AppColors.appThemeClr,fontFamily: themeFontBold),

                                                                  ),
                                                                ]),
                                                              ),
                                                              SizedBox(height: 5,),

                                                              RichText(
                                                                text: TextSpan(children: <TextSpan>[
                                                                  TextSpan(
                                                                      text: "date".tr,
                                                                      style: TextStyle(
                                                                          color: AppColors.appThemeClr,fontFamily: themeFontRegular)),
                                                                  TextSpan(
                                                                    text: " ${disease.disease_date!} / ",
                                                                    style: TextStyle(
                                                                        color: AppColors.appThemeClr,fontFamily: themeFontBold),

                                                                  ),
                                                                  TextSpan(
                                                                    text: " ${disease.disease_time!}",
                                                                    style: TextStyle(
                                                                        color: AppColors.appThemeClr,fontFamily: themeFontBold),

                                                                  ),
                                                                ]),
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
                              );

                            }else{
                              return  Center(child: Text("there_is_no".tr,style: TextStyle(fontSize: 17,fontFamily: themeFontLight),));
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