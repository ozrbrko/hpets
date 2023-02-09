import 'package:flutter/material.dart';
import 'package:hpets/core/components/widgets/widgets.dart';
import 'package:hpets/core/constants/colors.dart';
import 'package:hpets/core/constants/fonts.dart';
import 'package:hpets/core/model/pets.dart';
import 'package:hpets/core/responsive/frame_size.dart';

import '../core/components/widgets/cards.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    FrameSize.init(context: context);

    return Scaffold(
      appBar: hpetsAppBar(context, true, "Pet Detail", false),
      body: Container(
        height: FrameSize.screenHeight,
        width: FrameSize.screenWidth,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // cardContainerDetail(FrameSize.screenHeight,FrameSize.screenWidth),
              SizedBox(height: 15,),

              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5)),

                child: Container(
                  height: FrameSize.screenHeight/4,
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
                            SizedBox(height: 16,),
                            Text("Type",style: TextStyle(fontFamily: themeFontRegular),),
                            Text("${widget.pet!.pet_type}",style: TextStyle(fontFamily: themeFontBold,fontSize: 15),),
                            SizedBox(height: 7,),
                            Text("Gender",style: TextStyle(fontFamily: themeFontRegular),),
                            Text("${widget.pet!.pet_gender}",style: TextStyle(fontFamily: themeFontBold,fontSize: 15),),
                            SizedBox(height: 7,),

                            Text("Age",style: TextStyle(fontFamily: themeFontRegular),),
                            Text("${widget.pet!.pet_age}",style: TextStyle(fontFamily: themeFontBold,fontSize: 15),)
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  height: FrameSize.screenHeight/8,
                                  child: Image.asset(widget.pet!.pet_type=="Dog"? "assets/images/guide_image_1.png" : widget.pet!.pet_type=="Cat"? "assets/images/guide_image_0.png" : widget.pet!.pet_type=="Fish"? "assets/images/guide_image_2.png" :widget.pet!.pet_type=="Rabbit"? "assets/images/guide_image_3.png": widget.pet!.pet_type=="Bird"? "assets/images/guide_image_4.png": widget.pet!.pet_type=="Turtle"? "assets/images/guide_image_5.png": widget.pet!.pet_type=="Hamster"? "assets/images/guide_image_6.png": widget.pet!.pet_type=="Horse"? "assets/images/guide_image_7.png": ""),),

                            SizedBox(height: 7,),

                              Text("${widget.pet!.pet_name}")
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                ),
              ),

              SizedBox(height:20),

              Flexible(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,

                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.appThemeClr,
                          width: 2.0,
                        ),

                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(85),topRight: Radius.circular(85),topLeft: Radius.circular(85)),
                        color: AppColors.appThemeClr,

                      ),

                      child: Center(child: Text("Vaccines",style: TextStyle(fontFamily: themeFontRegular,fontSize: 21,color: AppColors.whiteThemeClr),),),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.appThemeClr,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(85),topLeft: Radius.circular(85),topRight: Radius.circular(85)),
                        color: AppColors.appThemeClr,

                      ),
                      child: Center(child: Text("Diseases",style: TextStyle(fontFamily: themeFontRegular,fontSize: 21,color: AppColors.whiteThemeClr,
                      ))),


                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.appThemeClr,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(85),bottomRight: Radius.circular(85),bottomLeft: Radius.circular(85)),
                        color: AppColors.appThemeClr,

                      ),

                      child: Center(child: Text("Notes",style: TextStyle(fontFamily: themeFontRegular,fontSize: 21,color: AppColors.whiteThemeClr,
                      ))),

                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.appThemeClr,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.only(topRight: Radius.circular(85),bottomRight: Radius.circular(85),bottomLeft: Radius.circular(85)),
                        color: AppColors.appThemeClr,

                      ),

                      child: Center(child: Text("Nutrition",style: TextStyle(fontFamily: themeFontRegular,fontSize: 21, color: AppColors.whiteThemeClr,
                      ))),


                    ),
                  ],
                ),
              )



            ],
          ),
        ),
      ),
    );
  }
}
