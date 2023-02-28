import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hpets/core/other/build_circular_indicator.dart';
import 'package:hpets/core/components/widgets/widgets.dart';
import 'package:hpets/core/extension/string_extension.dart';
import 'package:hpets/core/model/vaccines.dart';
import 'package:hpets/view/vaccines/add_new_vaccine.dart';
import '../../core/components/widgets/cards.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/fonts.dart';
import '../../core/model/pets.dart';
import '../../core/responsive/frame_size.dart';
import '../../core/utils/alert_dialog.dart';
import '../../core/utils/config.dart';
import '../../main.dart';

class VaccinesPage extends StatefulWidget {
  Pets? pet;
  VaccinesPage({this.pet});

  @override
  State<VaccinesPage> createState() => _VaccinesPageState();
}

class _VaccinesPageState extends State<VaccinesPage> {

  var vaccinesPets = FirebaseDatabase.instance.ref().child("pets_table").child(Config.token).child(Config.petKey).child("vaccines");

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
                              text: "_vaccines".tr,
                              style: TextStyle(
                                  fontFamily: themeFontSemiBold,
                                  fontSize: 22,color: AppColors.blackThemeClr),

                              ),
                        ]),
                      ),

                      // not: Yeni aşı ekleme ->
                      GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> AddNewVaccine(pet: widget.pet,)));
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
                      height: FrameSize.screenHeight/2.6,
                      child: StreamBuilder<DatabaseEvent>(
                        stream: vaccinesPets.onValue,
                        builder: (context, event) {
                          if (event.hasData) {
                            var vaccineList = <Vaccines>[];

                            var cameValue = event.data!.snapshot.value as dynamic;

                            if (cameValue != null) {
                              cameValue.forEach((key, nesne) {
                                var cameNote = Vaccines.fromJson(key, nesne);
                                vaccineList.add(cameNote);
                                // Config.key = key;
                              });
                            }

                            // not: Aşılar liste ->

                            if(vaccineList.length!=0){
                              return ListView.builder(

                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: vaccineList.length,
                                itemBuilder: (context, indeks) {
                                  var  vaccine = vaccineList[indeks];
                                  // not: sadece ilgili hayvanın aşıları görüntülenecek.
                                  return
                                    vaccine.pet_id==widget.pet!.pet_id!?

                                    GestureDetector(
                                      onTap: () {

                                        logger.i("{${vaccineList[indeks].vaccine_name.toString()} tıklandı");
                                        logger.e(vaccine.pet_id);
                                        logger.e(widget.pet!.pet_id!);
                                        logger.e(vaccine.vaccine_id);

                                        AlertDialogFunctions.infoVaccineDetail(context,vaccine.vaccine_name, vaccine.vaccine_date, vaccine.vaccine_time, vaccine.veterinary, vaccine.vaccine_id);                          // Navigator.pushNamed(context, "/petdetail");
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
                                                height: 95,
                                                width: FrameSize.screenWidth,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(15.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                    children: [

                                                      Center(
                                                        child: Container(
                                                          width: FrameSize.screenWidth/1.55,
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [

                                                              RichText(
                                                                text: TextSpan(children: <TextSpan>[
                                                                  TextSpan(
                                                                      text: "vaccine_name".tr,
                                                                      style: TextStyle(
                                                                          color: AppColors.appThemeClr,fontFamily: themeFontRegular)),
                                                                  TextSpan(
                                                                    text: " ${vaccine.vaccine_name!}".length > 21 ? '${" ${vaccine.vaccine_name!}".substring(0, 21)}...' : " ${vaccine.vaccine_name!}",

                                                                    style: TextStyle(
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
                                                                    text: " ${vaccine.vaccine_date!} / ${vaccine.vaccine_time!}",
                                                                    style: TextStyle(
                                                                        color: AppColors.appThemeClr,fontFamily: themeFontBold),
                                                                  ),
                                                                ]),
                                                              ),

                                                              SizedBox(height: 5,),
                                                              RichText(
                                                                text: TextSpan(children: <TextSpan>[
                                                                  TextSpan(
                                                                      text: "veterinary".tr,
                                                                      style: TextStyle(
                                                                          color: AppColors.appThemeClr,fontFamily: themeFontRegular)),
                                                                  TextSpan(
                                                                    text: " ${vaccine.veterinary!}".length > 22 ? '${" ${vaccine.veterinary!}".substring(0, 22)}...' : " ${vaccine.veterinary!}",

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
                                                          AlertDialogFunctions.infoVaccineDetail(context,vaccine.vaccine_name, vaccine.vaccine_date, vaccine.vaccine_time, vaccine.veterinary, vaccine.vaccine_id);
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
