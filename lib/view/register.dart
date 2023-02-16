import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hpets/core/components/widgets/widgets.dart';
import 'package:hpets/core/enums/enum.dart';
import 'package:hpets/core/responsive/frame_size.dart';
import 'package:hpets/core/utils/alert_dialog.dart';

import '../core/constants/colors.dart';
import '../core/constants/fonts.dart';
import '../core/services/auth_service.dart';
import '../core/utils/config.dart';
import '../main.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}


class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameInputController = TextEditingController();
  TextEditingController surnameInputController = TextEditingController();
  TextEditingController mailInputController = TextEditingController();
  TextEditingController passwordInputController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = true;


  AuthService _authService = AuthService();

  void initState() {
    super.initState();
    // Load data here
    // ...
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    FrameSize.init(context: context);

    return Scaffold(
      appBar: null,
      body: Container(
        height: FrameSize.screenHeight,
        width: FrameSize.screenWidth,
        color: AppColors.whiteThemeClr,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: 90,),
                  Text("Let's go!",style: TextStyle(fontSize: 30,fontFamily: themeFontBold,color: AppColors.appThemeClr),),
                  Text("Fill in your details to get started.",style: TextStyle(fontSize: 16,fontFamily: themeFontSemiBold,color: AppColors.blackThemeClr),),

                  SizedBox(height: 60,),

                  hPetsTextFormField("Name", nameInputController, "Name is required !", TextInputType.text, false, "false"),
                  SizedBox(height: 12,),
                  hPetsTextFormField("Surname", surnameInputController, "Surname is required !", TextInputType.text, false, "false"),
                  SizedBox(height: 12,),
                  hPetsTextFormField("Email", mailInputController, "Email is required !", TextInputType.text, false, "mail"),
                  SizedBox(height: 12,),
                  hPetsTextFormField("Password", passwordInputController, "Password is required !", TextInputType.text, true, "password"),

                  SizedBox(height: 40),

                  SizedBox(
                      width: FrameSize.screenWidth,
                      height: FrameSize.screenHeight / 14,
                      child: hPetsElevatedButton(
                          "Register",
                          AppColors.appThemeClr,AppColors.whiteThemeClr,
                          40.0,
                          themeFontBold,
                              () => {
                            if (_formKey.currentState!.validate())
                              {

                                print("Validated"),
                                _authService.register(mailInputController.text, passwordInputController.text, nameInputController.text, surnameInputController.text).then((value) {

                                  AlertDialogFunctions.infoAlert(context);
                                  // return Navigator.pushNamed(context, '/login',);


                                }).catchError((error) => {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("This mail is already registered !"), ))
                                }),


                              }
                            else
                              {
                                print("Not Validated"),
                              }
                          })),


                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: RichText(
                  text: TextSpan(children: <TextSpan>[
                      TextSpan(
                      text: "I already have an account,  ",
                      style: TextStyle(
                          color: AppColors.appThemeClr,
                          fontFamily: themeFontMedium,
                          fontSize: 16)),
                  TextSpan(
                      text: "Login!",
                      style: TextStyle(
                          color: AppColors.redThemeClr,
                          fontFamily: themeFontMedium,
                          fontSize: 16),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {

                          Navigator.pushNamed(context, '/login');


                        }),
                ]),
            ),
                  ),



                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
