import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hpets/core/components/widgets/widgets.dart';
import 'package:hpets/core/constants/colors.dart';
import 'package:hpets/core/constants/fonts.dart';
import 'package:hpets/core/constants/images.dart';
import 'package:hpets/core/responsive/frame_size.dart';
import 'package:hpets/core/utils/alert_dialog.dart';

import '../main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController loginInput = TextEditingController();
  TextEditingController passwordInput = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    FrameSize.init(context: context);
    return Scaffold(
        appBar: null,
        body: SingleChildScrollView(
          child: Container(
            height: FrameSize.screenHeight,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(height: 80),
                        Center(
                          child: SizedBox(
                              width: 130,
                              child: Image.asset(Images.logo_hpets)),
                        ),
                        Text(
                        "Welcome to hPETS!",
                          style: TextStyle(
                              fontSize: 28, fontFamily: themeFontMedium),
                        ),
                        SizedBox(height: 40),
                        // Text("Email",style: TextStyle(fontFamily: themeFontMedium),),
                        hPetsTextFormField("Email", loginInput,
                            "Email is required !", TextInputType.text,false),
                        SizedBox(
                          height: 12,
                        ),
                        hPetsTextFormField("Password", passwordInput,
                            "Password is required !", TextInputType.text,true),
                        SizedBox(height: 40),

                        SizedBox(
                            width: FrameSize.screenWidth,
                            height: FrameSize.screenHeight / 14,
                            child: hPetsElevatedButton(
                                "Login",
                                appThemeClr,
                                40.0,
                                themeFontSemiBold,
                                () => {
                                      if (_formKey.currentState!.validate())
                                        {
                                          print("Validated"),
                                        }
                                      else
                                        {
                                          print("Not Validated"),
                                        }
                                    })),

                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: (){
                                AlertDialogFunctions.forgotPassword(context);
                                logger.e("Forgot Password tıklandı.");

                              },

                              child: Container(
                                height: 30,
                                color: Colors.white,
                                child: Text(

                                  "Forgot Password ?",
                                  style: TextStyle(
                                      color: appThemeClr,
                                      fontFamily: themeFontMedium,
                                      fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: RichText(
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: "Don't have an account ?  ",
                            style: TextStyle(
                                color: appThemeClr,
                                fontFamily: themeFontMedium,
                                fontSize: 16)),
                        TextSpan(
                            text: "Register!",
                            style: TextStyle(
                                color: Colors.red,
                                fontFamily: themeFontMedium,
                                fontSize: 16),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {

                                Navigator.pushNamed(context, '/register');

                                 logger.i("Register tıklandı.");

                              }),
                      ]),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ));
  }
}
