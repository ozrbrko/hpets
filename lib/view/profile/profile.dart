import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hpets/core/components/widgets/widgets.dart';
import 'package:hpets/core/extension/string_extension.dart';
import 'package:hpets/core/responsive/frame_size.dart';
import 'package:hpets/core/utils/alert_dialog.dart';

import '../../core/components/widgets/cards.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/fonts.dart';
import '../../core/constants/images.dart';
import '../../core/utils/config.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    FrameSize.init(context: context);
    return Scaffold(
        appBar: hpetsAppBar(context, true,"Profile",false),
        body: SingleChildScrollView(
          child: Container(
            width: FrameSize.screenWidth,
            height: FrameSize.screenHeight,
            color: AppColors.whiteThemeClr,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Tabs(),
            ),
          ),
        ));
  }

  //Sekmeler

  Widget Tabs() {
    return Column(
      children: [
        cardContainerDefault(FrameSize.screenHeight/5),

        SizedBox(
          height: 70,
        ),
        InkWell(
          onTap: (){
            AlertDialogFunctions.changePassword(context);
          },
          child: Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 1, child: Icon(Icons.key, color: AppColors.appThemeClr)),
                Expanded(flex: 3,
                    child: Text("Change Password", style: TextStyle(
                        fontSize: 16, fontFamily: themeFontRegular),)),
                Expanded(flex: 1, child: Icon(Icons.arrow_forward_ios, size: 18,)),
              ],
            ),
          ),
        ),
        Divider(),
        SizedBox(
          height: 35,
        ),


        InkWell(
          onTap: (){
            Navigator.pushNamed(context, '/askedquestions');

          },
          child: Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(flex: 1,
                    child: Icon(Icons.question_mark, color: AppColors.appThemeClr)),
                Expanded(flex: 3,
                    child: Text("Frequently asked questions", style: TextStyle(
                        fontSize: 16, fontFamily: themeFontRegular),)),
                Expanded(flex: 1, child: Icon(Icons.arrow_forward_ios, size: 18,)),
              ],
            ),
          ),
        ),

        Divider(),
        SizedBox(
          height: 35,
        ),


        InkWell(

          onTap: (){
            AlertDialogFunctions.opinionSuggestion(context);
          },
          child: Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(flex: 1,
                    child: Icon(Icons.question_answer_outlined,
                        color: AppColors.appThemeClr)),
                Expanded(flex: 3,
                    child: Text("Opinions and suggestions", style: TextStyle(
                        fontSize: 16, fontFamily: themeFontRegular),)),
                Expanded(flex: 1, child: Icon(Icons.arrow_forward_ios, size: 18,)),
              ],
            ),
          ),
        ),

        Divider(),
        SizedBox(
          height: 35,
        ),


        InkWell(
          onTap: () {
            AlertDialogFunctions.exitApp(context);
          },
          child: Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(flex: 1,
                  child: Icon(Icons.exit_to_app, color: AppColors.appThemeClr),),
                Expanded(flex: 3,
                    child: Text("Exit", style: TextStyle(
                        fontSize: 16, fontFamily: themeFontRegular),)),
                Expanded(
                    flex: 1, child: Icon(Icons.arrow_forward_ios, size: 18,)),
              ],
            ),
          ),
        ),

        Divider(),

      ]
    );


  }


}


