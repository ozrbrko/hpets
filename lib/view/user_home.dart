import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hpets/core/components/widgets/widgets.dart';
import 'package:hpets/core/constants/fonts.dart';
import 'package:hpets/core/constants/images.dart';
import 'package:hpets/core/extension/string_extension.dart';
import 'package:hpets/core/responsive/frame_size.dart';
import '../core/constants/colors.dart';
import '../core/utils/config.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({Key? key}) : super(key: key);

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    FrameSize.init(context: context);

    return Scaffold(
      appBar: hpetsAppBar(context,false,"hPETS",true),
      body: Container(
        color: AppColors.whiteThemeClr,
        width: FrameSize.screenWidth,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                height: FrameSize.screenHeight/5,
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
                        SizedBox(height: 45,),
                        Text(Config.toUtf8("${_auth.currentUser!.displayName}".basHarfleriBuyut(),),style: TextStyle(fontFamily: themeFontBold,fontSize: 16),),
                        SizedBox(height: 10,),
                        Text(_auth.currentUser!.email!),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 45,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("My Pets",style: TextStyle(fontFamily: themeFontSemiBold,fontSize: 22),),
                  GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, '/addnewpet');
                      },
                      child: Icon(Icons.add_box,color: AppColors.appThemeClr,size: 40,)),
                ],
              ),

              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
