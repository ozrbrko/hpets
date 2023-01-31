import 'package:flutter/material.dart';

import '../core/constants/colors.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({Key? key}) : super(key: key);

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,

      body: Container(
        color: AppColors.redThemeClr,
      ),
    );
  }
}
