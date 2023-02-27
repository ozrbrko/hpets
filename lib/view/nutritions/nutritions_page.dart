import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hpets/core/components/widgets/widgets.dart';
import 'package:hpets/core/extension/string_extension.dart';
import 'package:hpets/core/model/nutritions.dart';
import 'package:hpets/core/responsive/frame_size.dart';
import 'package:hpets/view/nutritions/add_new_nutrition.dart';
import '../../core/other/build_circular_indicator.dart';
import '../../core/components/widgets/cards.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/fonts.dart';
import '../../core/model/pets.dart';
import '../../core/utils/alert_dialog.dart';
import '../../core/utils/config.dart';
import '../../main.dart';

class NutritionsPage extends StatefulWidget {
  Pets? pet;
  NutritionsPage({this.pet});
  @override
  State<NutritionsPage> createState() => _NutritionsPageState();
}

class _NutritionsPageState extends State<NutritionsPage> {

  var nutritionPets = FirebaseDatabase.instance.ref().child("pets_table").child(Config.token).child(Config.petKey).child("nutritions");

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
                            text: "_nutritions".tr,
                            style: TextStyle(
                                fontFamily: themeFontSemiBold,
                                fontSize: 22,color: AppColors.blackThemeClr),
                          ),
                        ]),
                      ),

                      // not: Yeni beslenme ekleme ->
                      GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> AddNewNutrition(pet: widget.pet)));
                          },
                          child: Icon(
                            Icons.add_box,
                            color: AppColors.appThemeClr,
                            size: 40,
                          )),
                    ],
                  ),
                  Divider(),

                  // not: Beslenme listesi ->
                  SingleChildScrollView(
                    child: Container(

                      height: FrameSize.screenHeight/1.75,
                      child: StreamBuilder<DatabaseEvent>(

                        stream: nutritionPets.onValue,
                        builder: (context, event){
                          if (event.hasData) {
                            var nutritionList = <Nutritions>[];
                            var cameValue = event.data!.snapshot.value as dynamic;

                            if (cameValue != null) {
                              cameValue.forEach((key, nesne){

                                var cameNutrition = Nutritions.fromJson(key, nesne);
                                nutritionList.add(cameNutrition);
                              });
                            }

                            if(nutritionList.length!=0){
                              return ListView.builder(

                                  physics: NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: nutritionList.length,
                                  itemBuilder: (context,indeks) {
                                    var nutrition = nutritionList[indeks];

                                    return nutrition.pet_id == widget.pet!.pet_id!?
                                    GestureDetector(
                                      onTap: (){

                                        logger.i("{${nutritionList[indeks].food_name.toString()} tıklandı");
                                        logger.e(nutrition.pet_id);
                                        logger.e(widget.pet!.pet_id!);
                                        logger.e(nutrition.food_id);

                                        AlertDialogFunctions.infoNutritionDetail(context, nutrition.food_name, nutrition.food_date, nutrition.food_time, nutrition.amount_of_food, nutrition.food_id);
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

                                                      Container(
                                                        width: FrameSize.screenWidth/1.6,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.center,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [

                                                            RichText(
                                                              text: TextSpan(children: <TextSpan>[
                                                                TextSpan(
                                                                    text: "food_name".tr,
                                                                    style: TextStyle(
                                                                        color: AppColors.appThemeClr,fontFamily: themeFontRegular)),
                                                                TextSpan(
                                                                  text: " ${nutrition.food_name}".length > 20 ? '${" ${nutrition.food_name}".substring(0, 20)}...' : " ${nutrition.food_name}",

                                                                  style: TextStyle(
                                                                      color: AppColors.appThemeClr,fontFamily: themeFontBold),

                                                                ),
                                                              ]),
                                                            ),

                                                            SizedBox(height: 5,),

                                                            RichText(
                                                              text: TextSpan(children: <TextSpan>[
                                                                TextSpan(
                                                                    text: "amount_of_food".tr,
                                                                    style: TextStyle(
                                                                        color: AppColors.appThemeClr,fontFamily: themeFontRegular)),
                                                                TextSpan(
                                                                  text: " ${nutrition.amount_of_food}".length > 15 ? '${" ${nutrition.amount_of_food}".substring(0, 15)}...' : " ${nutrition.amount_of_food}",

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
                                                                  text: " ${nutrition.food_date}",
                                                                  style: TextStyle(
                                                                      color: AppColors.appThemeClr,fontFamily: themeFontBold),
                                                                ),

                                                                TextSpan(
                                                                  text: " / ${nutrition.food_time}",
                                                                  style: TextStyle(
                                                                      color: AppColors.appThemeClr,fontFamily: themeFontBold),
                                                                ),
                                                              ]),
                                                            )
                                                          ],
                                                        ),
                                                      ),

                                                      IconButton(
                                                        icon: Icon(
                                                          Icons.info_outline_rounded,
                                                          color: AppColors.appThemeClr,
                                                        ),
                                                        onPressed: () {
                                                          AlertDialogFunctions.infoNutritionDetail(context, nutrition.food_name, nutrition.food_date, nutrition.food_time, nutrition.amount_of_food, nutrition.food_id);
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
                                  }
                              );

                            }else{
                              return  Center(child: Text("there_is_no".tr,style: TextStyle(fontSize: 17,fontFamily: themeFontLight),));
                            }
                          } else {
                            return BuildCircularIndicatorWidget();                          }
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
