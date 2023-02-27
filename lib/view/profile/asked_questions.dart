import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hpets/core/components/widgets/widgets.dart';
import 'package:hpets/core/constants/colors.dart';
import 'package:hpets/core/constants/fonts.dart';
import 'package:hpets/core/responsive/frame_size.dart';
import 'package:rounded_expansion_tile/rounded_expansion_tile.dart';

class AskedQuestionsPage extends StatefulWidget {
  const AskedQuestionsPage({Key? key}) : super(key: key);

  @override
  State<AskedQuestionsPage> createState() => _AskedQuestionsPageState();
}

class _AskedQuestionsPageState extends State<AskedQuestionsPage> {

  @override
  Widget build(BuildContext context) {
    FrameSize.init(context: context);

    return Scaffold(

        appBar: hpetsAppBar(context,true,"frequently_asked_questions".tr,false),
        body: Container(

          width: FrameSize.screenWidth,
          height: FrameSize.screenHeight,
          color: AppColors.whiteThemeClr,

          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // not: Soru 1 ->
                  Card(
                    color: AppColors.whiteThemeClr.withOpacity(0.8),
                    shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                    child: RoundedExpansionTile(
                      leading: Icon(Icons.question_answer_outlined, color: AppColors.appThemeClr,),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)),
                      title: Text('sss_1'.tr,style: TextStyle(fontSize: 15,fontFamily: themeFontBold,color: AppColors.appThemeClr),),
                      trailing: Icon(Icons.keyboard_arrow_down),
                      children: [
                        // not: Cevap 1 ->

                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            height: 170,

                            child: Center(
                              child: Text(
                                'sss_1_detail'.tr,
                                style: TextStyle(color: AppColors.blackThemeClr,fontFamily: themeFontRegular),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  // not: Soru 2 ->

                  Card(
                    color: AppColors.whiteThemeClr.withOpacity(0.8),
                    shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                    child: RoundedExpansionTile(
                      leading: Icon(Icons.question_answer_outlined, color: AppColors.appThemeClr,),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)),
                      title: Text('sss_2'.tr,style: TextStyle(fontSize: 15,fontFamily: themeFontBold,color: AppColors.appThemeClr),),
                      trailing: Icon(Icons.keyboard_arrow_down),
                      children: [
                        // not: Cevap 2 ->

                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            height: 80,

                            child: Center(
                              child: Text(
                                'sss_2_detail'.tr,
                                style: TextStyle(color: AppColors.blackThemeClr,fontFamily: themeFontRegular),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  // not: Soru 3 ->

                  Card(
                    color: AppColors.whiteThemeClr.withOpacity(0.8),
                    shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                    child: RoundedExpansionTile(
                      leading: Icon(Icons.question_answer_outlined, color: AppColors.appThemeClr,),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)),
                      title: Text('sss_3'.tr,style: TextStyle(fontSize: 15,fontFamily: themeFontBold,color: AppColors.appThemeClr),),
                      trailing: Icon(Icons.keyboard_arrow_down),
                      children: [
                        // not: Cevap 3 ->

                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            height: 130,
                            child: Center(
                              child: Text(
                                'sss_3_detail'.tr,
                                style: TextStyle(color: AppColors.blackThemeClr,fontFamily: themeFontRegular),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  // not: Soru 4 ->

                  Card(
                    color: AppColors.whiteThemeClr.withOpacity(0.8),
                    shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                    child: RoundedExpansionTile(
                      leading: Icon(Icons.question_answer_outlined, color: AppColors.appThemeClr,),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)),
                      title: Text('sss_4'.tr,style: TextStyle(fontSize: 15,fontFamily: themeFontBold,color: AppColors.appThemeClr),),
                      trailing: Icon(Icons.keyboard_arrow_down),
                      children: [
                        // not: Cevap 4 ->

                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            height: 85,

                            child: Center(
                              child: Text(
                                'sss_4_detail'.tr,
                                style: TextStyle(color: AppColors.blackThemeClr,fontFamily: themeFontRegular),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  // not: Soru 5 ->

                  Card(
                    color: AppColors.whiteThemeClr.withOpacity(0.8),
                    shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                    child: RoundedExpansionTile(
                      leading: Icon(Icons.question_answer_outlined, color: AppColors.appThemeClr,),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)),
                      title: Text('sss_5'.tr,style: TextStyle(fontSize: 15,fontFamily: themeFontBold,color: AppColors.appThemeClr),),
                      trailing: Icon(Icons.keyboard_arrow_down),
                      children: [
                        // not: Cevap 5 ->

                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            height: 80,

                            child: Center(
                              child: Text(
                                'sss_5_detail'.tr,
                                style: TextStyle(color: AppColors.blackThemeClr,fontFamily: themeFontRegular),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  // not: Soru 6 ->

                  Card(
                    color: AppColors.whiteThemeClr.withOpacity(0.8),
                    shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                    child: RoundedExpansionTile(
                      leading: Icon(Icons.question_answer_outlined, color: AppColors.appThemeClr,),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)),
                      title: Text('sss_6'.tr,style: TextStyle(fontSize: 15,fontFamily: themeFontBold,color: AppColors.appThemeClr),),
                      trailing: Icon(Icons.keyboard_arrow_down),
                      children: [
                        // not: Cevap 6 ->

                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            height: 80,

                            child: Center(
                              child: Text(
                                'sss_6_detail'.tr,
                                style: TextStyle(color: AppColors.blackThemeClr,fontFamily: themeFontRegular),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  // not: Soru 7 ->

                  Card(
                    color: AppColors.whiteThemeClr.withOpacity(0.8),
                    shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                    child: RoundedExpansionTile(
                      leading: Icon(Icons.question_answer_outlined, color: AppColors.appThemeClr,),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)),
                      title: Text('sss_7'.tr,style: TextStyle(fontSize: 15,fontFamily: themeFontBold,color: AppColors.appThemeClr),),
                      trailing: Icon(Icons.keyboard_arrow_down),
                      children: [
                        // not: Cevap 7 ->

                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            height: 100,

                            child: Center(
                              child: Text(
                                'sss_7_detail'.tr,
                                style: TextStyle(color: AppColors.blackThemeClr,fontFamily: themeFontRegular),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),



                ],
              ),
            ),
          ),

        ));
  }
}
