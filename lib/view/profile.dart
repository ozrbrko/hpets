import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hpets/core/components/widgets/widgets.dart';
import 'package:hpets/core/extension/string_extension.dart';
import 'package:hpets/core/responsive/frame_size.dart';
import 'package:hpets/core/utils/alert_dialog.dart';

import '../core/constants/colors.dart';
import '../core/constants/fonts.dart';
import '../core/constants/images.dart';
import '../core/utils/config.dart';

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
        appBar: AppBar(
          automaticallyImplyLeading: true,
          centerTitle: true,
          title: Text(
            "Profile",
            style: TextStyle(color: AppColors.whiteThemeClr),
          ),
          backgroundColor: AppColors.appThemeClr,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(25),
            ),
          ),
        ),
        body: Container(
          width: FrameSize.screenWidth,
          color: AppColors.whiteThemeClr,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Tabs(),
          ),
        ));
  }

  //Sekmeler

  Widget Tabs() {
    return Column(
      children: [
        Container(
          height: FrameSize.screenHeight / 5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color(0xffB1D1FF).withOpacity(0.1),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Image.asset(Images.logo_hpets),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 45,
                  ),
                  Text(
                    Config.toUtf8(
                      "${_auth.currentUser!.displayName}"
                          .basHarfleriBuyut(),
                    ),
                    style: TextStyle(
                        fontFamily: themeFontBold, fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(_auth.currentUser!.email!),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 70,
        ),
        Container(
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
        Divider(),
        SizedBox(
          height: 30,
        ),


        Container(
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

        Divider(),
        SizedBox(
          height: 30,
        ),


        Container(
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

        Divider(),
        SizedBox(
          height: 30,
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


