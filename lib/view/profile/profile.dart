import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hpets/core/components/widgets/widgets.dart';
import 'package:hpets/core/responsive/frame_size.dart';
import 'package:hpets/core/utils/alert_dialog.dart';
import '../../core/components/widgets/cards.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    FrameSize.init(context: context);
    return Scaffold(
        appBar: hpetsAppBar(context, true,"profile".tr,false),
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

  // not: Sekmeler ->

  Widget Tabs() {
    return Column(
      children: [
        cardContainerDefault(FrameSize.screenHeight/5),
        SizedBox(
          height: 70,
        ),
        // not: Şifreyi değiştir ->
        InkWell(
          onTap: (){
            AlertDialogFunctions.changePassword(context);
          },
          child: Container(
            color: AppColors.whiteThemeClr,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 1, child: Icon(Icons.key, color: AppColors.appThemeClr)),
                Expanded(flex: 3,
                    child: Text("change_password".tr, style: TextStyle(
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

        // not: Sık Sorulan Sorular ->

        InkWell(
          onTap: (){
            Navigator.pushNamed(context, '/askedquestions');
          },
          child: Container(
            color: AppColors.whiteThemeClr,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(flex: 1,
                    child: Icon(Icons.question_mark, color: AppColors.appThemeClr)),
                Expanded(flex: 3,
                    child: Text("frequently_asked_questions".tr, style: TextStyle(
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

        // not: Görüş ve öneriler ->

        InkWell(

          onTap: (){
            AlertDialogFunctions.opinionSuggestion(context);
          },
          child: Container(
            color: AppColors.whiteThemeClr,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(flex: 1,
                    child: Icon(Icons.question_answer_outlined,
                        color: AppColors.appThemeClr)),
                Expanded(flex: 3,
                    child: Text(
                      "opinions_and_suggestions".tr, style: TextStyle(
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

        // not: Dil Ayarları ->

        InkWell(

          onTap: (){
            AlertDialogFunctions.languageSettings(context);
          },
          child: Container(
            color: AppColors.whiteThemeClr,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(flex: 1,
                    child: Icon(Icons.language,
                        color: AppColors.appThemeClr)),
                Expanded(flex: 3,
                    child: Text("language_settings".tr, style: TextStyle(
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

        // not: Çıkış Yap ->
        InkWell(
          onTap: () {
            AlertDialogFunctions.exitApp(context);
          },
          child: Container(
            color: AppColors.whiteThemeClr,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(flex: 1,
                  child: Icon(Icons.exit_to_app, color: AppColors.appThemeClr),),
                Expanded(flex: 3,
                    child: Text("exit".tr, style: TextStyle(
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