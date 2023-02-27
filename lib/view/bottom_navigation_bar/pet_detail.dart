import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hpets/core/components/widgets/widgets.dart';
import 'package:hpets/core/constants/colors.dart';
import 'package:hpets/core/constants/fonts.dart';
import 'package:hpets/core/model/pets.dart';
import 'package:hpets/core/responsive/frame_size.dart';
import 'package:hpets/view/diseases/diseases_page.dart';
import 'package:hpets/view/notes/notes_page.dart';
import 'package:hpets/view/vaccines/pet_vaccines_page.dart';
import '../../core/components/widgets/cards.dart';
import '../../core/utils/config.dart';
import '../nutritions/nutritions_page.dart';

class PetDetailPage extends StatefulWidget {
  Pets? pet;
  PetDetailPage({this.pet});

  @override
  State<PetDetailPage> createState() => _PetDetailPageState();
}

class _PetDetailPageState extends State<PetDetailPage> {
  @override
  void initState() {
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
      body: SingleChildScrollView(
        child: Container(
          height: FrameSize.screenHeight,
          width: FrameSize.screenWidth,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(
                  height: 0,
                ),

                // not: Evcil hayvan bilgi kartı ->
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  child:  cardContainerPetDetail(FrameSize.screenHeight, FrameSize.screenWidth, pet_type, pet_gender, widget.pet!.pet_age!, widget.pet!.pet_name!,widget.pet!.pet_race!, context),
                ),

                SizedBox(height: 0),

                // not: Evcil hayvan bilgileri dörtlü container ->
                Flexible(
                  child: Padding(
                    padding:  EdgeInsets.all(23),
                    child: Container(
                      // color: Colors.red,
                      child: GridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                        physics: NeverScrollableScrollPhysics(),

                        // not: aşılar ->
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => VaccinesPage(pet: widget.pet,)));
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

                          // not: Hastalıklar ->

                          InkWell(
                            onTap: () {

                              Navigator.push(context, MaterialPageRoute(builder: (context) => DiseasesPage(pet: widget.pet,)));
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

                          // not: Notlar ->
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => NotesPage(pet: widget.pet,)));
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

                          // not: Beslenmeler ->
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => NutritionsPage(pet: widget.pet,)));
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
      ),
    );
  }
}
