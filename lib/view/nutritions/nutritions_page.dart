import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hpets/core/components/widgets/widgets.dart';
import 'package:hpets/core/model/nutritions.dart';
import 'package:hpets/core/responsive/frame_size.dart';
import 'package:hpets/view/nutritions/add_new_nutrition.dart';

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

  var refPets = FirebaseDatabase.instance.ref().child("pets_table").child(
      Config.token);
  var nutritionPets = FirebaseDatabase.instance.ref().child("pets_table").child(
      "nutritions").child(Config.token);

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
                        "${widget.pet!.pet_name!}'s Nutritions",
                        style: TextStyle(
                            fontFamily: themeFontSemiBold, fontSize: 22),
                      ),
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

                            return Padding(
                              padding: const EdgeInsets.only(bottom: 58.0),
                              child: ListView.builder(

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
                          // Navigator.pushNamed(context, "/petdetail");
                                          // Navigator.
                                          AlertDialogFunctions.infoNutritionDetail(context, nutrition.food_name, nutrition.food_date, nutrition.food_time, nutrition.amount_of_food, nutrition.food_id);                         // Navigator.pushNamed(context, "/petdetail");

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
                                                        // IconButton(
                                                        //   icon: Icon(
                                                        //     Icons.info_outline_rounded,
                                                        //     color: AppColors.appThemeClr,
                                                        //   ),
                                                        //   onPressed: () {},
                                                        // ),

                                                        Column(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.center,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text(
                                                              "Food Name: ${nutrition.food_name}",
                                                              style: TextStyle(
                                                                  color: AppColors.appThemeClr),
                                                            ),
                                                            SizedBox(height: 5,),
                                                            Text(
                                                              "Amount: ${nutrition.amount_of_food}",
                                                              style: TextStyle(
                                                                  color: AppColors.appThemeClr),
                                                            ),

                                                            SizedBox(height: 5,),


                                                            Text(
                                                              "Date: ${nutrition.food_date!} / ${nutrition.food_time!}",
                                                              style: TextStyle(
                                                                  color: AppColors.appThemeClr),
                                                            ),


                                                          ],
                                                        ),

                                                        // Column(
                                                        //   mainAxisAlignment:
                                                        //   MainAxisAlignment.center,
                                                        //   children: [
                                                        //     Text("${nutrition.food_date}", style: TextStyle(
                                                        //         color: AppColors.appThemeClr),),
                                                        //     SizedBox(height: 5,),
                                                        //
                                                        //     Text("${nutrition.food_time}", style: TextStyle(
                                                        //         color: AppColors.appThemeClr),),
                                                        //
                                                        //   ],
                                                        // ),

                                                        IconButton(
                                                          icon: Icon(
                                                            Icons.info_outline_rounded,
                                                            color: AppColors.appThemeClr,
                                                          ),
                                                          onPressed: () {},
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



                              ),
                            );

                          } else {
                            return Center();
                          }
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