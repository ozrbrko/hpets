import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hpets/core/components/widgets/widgets.dart';
import 'package:hpets/core/constants/colors.dart';
import 'package:hpets/core/constants/fonts.dart';
import 'package:hpets/core/extension/string_extension.dart';
import 'package:hpets/core/model/pets.dart';
import 'package:hpets/core/responsive/frame_size.dart';
import 'package:hpets/core/utils/alert_dialog.dart';
import 'package:hpets/view/diseases/diseases_page.dart';
import 'package:hpets/view/notes/notes_page.dart';
import 'package:hpets/view/vaccines/pet_vaccines_page.dart';
import '../../core/utils/config.dart';
import '../nutritions/nutritions_page.dart';

var refPets =
    FirebaseDatabase.instance.ref().child("pets_table").child(Config.token);

class PetDetailPage extends StatefulWidget {
  Pets? pet;

  PetDetailPage({this.pet});

  @override
  State<PetDetailPage> createState() => _PetDetailPageState();
}

class _PetDetailPageState extends State<PetDetailPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Config.petKey = widget.pet!.pet_key!;
  }

  @override
  Widget build(BuildContext context) {
    FrameSize.init(context: context);
    String? pet_gender = widget.pet!.pet_gender!;
    String? pet_type = widget.pet!.pet_type!.toLowerCase();

    return Scaffold(
      appBar: hpetsAppBar(context, true, "pet_detail".tr, false),
      body: Container(
        height: FrameSize.screenHeight,
        width: FrameSize.screenWidth,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // cardContainerDetail(FrameSize.screenHeight,FrameSize.screenWidth),
              SizedBox(
                height: 0,
              ),

              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                child: Container(
                  height: FrameSize.screenHeight / 3.2,
                  width: FrameSize.screenWidth,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        width: 5.0,
                        color: AppColors.appThemeClr,
                      ),
                    ),
                    color: Color(0xffB1D1FF).withOpacity(0.1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              "type".tr,
                              style: TextStyle(fontFamily: themeFontRegular),
                            ),
                            Text(
                              "${pet_type}".tr,
                              style: TextStyle(
                                  fontFamily: themeFontBold, fontSize: 15),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                              "gender".tr,
                              style: TextStyle(fontFamily: themeFontRegular),
                            ),
                            Text(
                              "${pet_gender.toLowerCase()}".tr,
                              style: TextStyle(
                                  fontFamily: themeFontBold, fontSize: 15),
                            ),
                            SizedBox(
                              height: 7,
                            ),

                            Text(
                              "age".tr,
                              style: TextStyle(fontFamily: themeFontRegular),
                            ),
                            Text(
                              "${widget.pet!.pet_age}",
                              style: TextStyle(
                                  fontFamily: themeFontBold, fontSize: 15),
                            ),
                            SizedBox(
                              height: 18,
                            ),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                    onTap:(){
                                      AlertDialogFunctions.infoPetEdit(context, widget.pet!.pet_name, widget.pet!.pet_type, widget.pet!.pet_gender, widget.pet!.pet_race, widget.pet!.pet_age);

                                    },
                                    child: Container(

                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          // color: Colors.white,

                                          borderRadius: BorderRadius.circular(12)
                                      ),

                                        // color: Colors.red,
                                        child: Icon(Icons.edit,color: Colors.blue,))),

                                SizedBox(width: 20,),
                                InkWell(
                                    onTap:(){
                                      AlertDialogFunctions.deletePet(context);

                                    },
                                    child: Container(

                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            // color: Colors.white,

                                            borderRadius: BorderRadius.circular(12)
                                        ),

                                        // color: Colors.red,
                                        child: Icon(Icons.delete,color: Colors.red,))),

                              ],
                            )

                            // TextButton(onPressed: (){
                            //   // logger.i(widget.pet!.pet_key);
                            //   // refPets.child(widget.pet!.pet_key!).remove();
                            //   // Navigator.pushNamed(context, '/bottomnav');
                            //   AlertDialogFunctions.deletePet(context);
                            // }, child: Text("delete_pet".tr,style: TextStyle(fontFamily: themeFontBold,fontSize: 15,color: Color(0xffEA4452)),))
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  height: FrameSize.screenHeight / 8,
                                  child: Image.asset(widget.pet!.pet_type ==
                                          "Dog"
                                      ? "assets/images/guide_image_1.png"
                                      : widget.pet!.pet_type == "Cat"
                                          ? "assets/images/guide_image_0.png"
                                          : widget.pet!.pet_type == "Fish"
                                              ? "assets/images/guide_image_2.png"
                                              : widget.pet!.pet_type == "Rabbit"
                                                  ? "assets/images/guide_image_3.png"
                                                  : widget.pet!.pet_type ==
                                                          "Bird"
                                                      ? "assets/images/guide_image_4.png"
                                                      : widget.pet!.pet_type ==
                                                              "Turtle"
                                                          ? "assets/images/guide_image_5.png"
                                                          : widget.pet!
                                                                      .pet_type ==
                                                                  "Hamster"
                                                              ? "assets/images/guide_image_6.png"
                                                              : widget.pet!
                                                                          .pet_type ==
                                                                      "Horse"
                                                                  ? "assets/images/guide_image_7.png"
                                                                  : widget.pet!
                                                                              .pet_type ==
                                                                          "Köpek"
                                                                      ? "assets/images/guide_image_1.png"
                                                                      : widget.pet!.pet_type ==
                                                                              "Kedi"
                                                                          ? "assets/images/guide_image_0.png"
                                                                          : widget.pet!.pet_type == "Balık"
                                                                              ? "assets/images/guide_image_2.png"
                                                                              : widget.pet!.pet_type == "Tavşan"
                                                                                  ? "assets/images/guide_image_3.png"
                                                                                  : widget.pet!.pet_type == "Kuş"
                                                                                      ? "assets/images/guide_image_4.png"
                                                                                      : widget.pet!.pet_type == "Kaplumbağa"
                                                                                          ? "assets/images/guide_image_5.png"
                                                                                          : widget.pet!.pet_type == "Hamster"
                                                                                              ? "assets/images/guide_image_6.png"
                                                                                              : widget.pet!.pet_type == "At"
                                                                                                  ? "assets/images/guide_image_7.png"
                                                                                                  : "")),
                              SizedBox(
                                height: 7,
                              ),
                              Text("${widget.pet!.pet_name}")
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 0),

              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    // color: Colors.red,
                    child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VaccinesPage(
                                          pet: widget.pet,
                                        )));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.appThemeClr,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(45),
                                  topRight: Radius.circular(45),
                                  topLeft: Radius.circular(45),
                                  bottomRight: Radius.circular(0)),
                              color: AppColors.appThemeClr,
                            ),
                            child: Center(
                              child: Text(
                                "vaccines".tr,
                                style: TextStyle(
                                    fontFamily: themeFontRegular,
                                    fontSize: 21,
                                    color: AppColors.whiteThemeClr),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            // logger.i(widget.pet!.pet_key);
                            // refPets.child(widget.pet!.pet_key!).remove();

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DiseasesPage(
                                          pet: widget.pet,
                                        )));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.appThemeClr,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(45),
                                  topLeft: Radius.circular(45),
                                  topRight: Radius.circular(45)),
                              color: AppColors.appThemeClr,
                            ),
                            child: Center(
                                child: Text("diseases".tr,
                                    style: TextStyle(
                                      fontFamily: themeFontRegular,
                                      fontSize: 21,
                                      color: AppColors.whiteThemeClr,
                                    ))),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NotesPage(
                                          pet: widget.pet,
                                        )));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.appThemeClr,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(45),
                                  bottomRight: Radius.circular(45),
                                  bottomLeft: Radius.circular(45)),
                              color: AppColors.appThemeClr,
                            ),
                            child: Center(
                                child: Text("notes".tr,
                                    style: TextStyle(
                                      fontFamily: themeFontRegular,
                                      fontSize: 21,
                                      color: AppColors.whiteThemeClr,
                                    ))),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NutritionsPage(
                                          pet: widget.pet,
                                        )));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.appThemeClr,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(45),
                                  bottomRight: Radius.circular(45),
                                  bottomLeft: Radius.circular(45)),
                              color: AppColors.appThemeClr,
                            ),
                            child: Center(
                                child: Text("nutrition".tr,
                                    style: TextStyle(
                                      fontFamily: themeFontRegular,
                                      fontSize: 21,
                                      color: AppColors.whiteThemeClr,
                                    ))),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
