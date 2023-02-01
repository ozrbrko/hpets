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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "hPETS",
          style: TextStyle(color: AppColors.whiteThemeClr),
        ),
        backgroundColor: AppColors.appThemeClr,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
      ),
      body: Container(
        color: AppColors.whiteThemeClr,
        width: FrameSize.screenWidth,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                height: FrameSize.screenHeight/5,
                color: Color(0xffB1D1FF).withOpacity(0.1),
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
                  Text("Evcil Hayvanlar",style: TextStyle(fontFamily: themeFontSemiBold,fontSize: 18),),
                  GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, '/addnewpet');
                      },
                      child: Icon(Icons.add_box,color: AppColors.appThemeClr,size: 40,)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
