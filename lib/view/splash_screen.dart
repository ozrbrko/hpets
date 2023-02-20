import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hpets/core/responsive/frame_size.dart';
import '../core/constants/colors.dart';
import '../core/constants/fonts.dart';
import '../core/constants/images.dart';
import '../core/utils/config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final _storage = const FlutterSecureStorage();


  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() async {


    String? token = await _storage.read(key: "remem_token");

    if (token != null) {
      Config.token= token!;
      Navigator.of(context).pushReplacementNamed('/bottomnav');

    }else {
      Navigator.of(context).pushReplacementNamed('/login');

    }
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }


  @override
  Widget build(BuildContext context) {

    FrameSize.init(context: context);

    return Scaffold(
      appBar: null,

      body: Container(
        height: FrameSize.screenHeight,
        width: FrameSize.screenWidth,
        color: AppColors.blackThemeClr,
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,


          children: [
            // SizedBox(height: 180),
            Image.asset(Images.logo_hpets),
            // Text(
            //   "hPETS",
            //   style: TextStyle(
            //     fontFamily: themeFontMedium,
            //     fontSize: 32,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
