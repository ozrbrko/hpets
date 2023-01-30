import 'dart:async';
import 'package:flutter/material.dart';
import '../core/constants/colors.dart';
import '../core/constants/fonts.dart';
import '../core/constants/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    Navigator.of(context).pushReplacementNamed('/login');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }


  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            SizedBox(height: 180),
            Image.asset(Images.logo_hpets),
            Text(
              "hPETS",
              style: TextStyle(
                fontFamily: themeFontMedium,
                fontSize: 40,
                color: blackThemeClr,
                decoration: TextDecoration.none,
              ),
            )
          ],
        ),
      ),
    );
  }
}
