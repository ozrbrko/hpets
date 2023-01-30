import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hpets/core/components/widgets/widgets.dart';
import 'package:hpets/core/responsive/frame_size.dart';

import '../core/constants/colors.dart';
import '../core/constants/fonts.dart';
import '../main.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameInput = TextEditingController();
  TextEditingController surnameInput = TextEditingController();
  TextEditingController mailInput = TextEditingController();
  TextEditingController passwordInput = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    FrameSize.init(context: context);

    return Scaffold(
      appBar: null,
      body: Container(
        height: FrameSize.screenHeight,
        width: FrameSize.screenWidth,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: 90,),
                  Text("Let's go!",style: TextStyle(fontSize: 30,fontFamily: themeFontBold,color: appThemeClr),),
                  Text("Fill in your details to get started.",style: TextStyle(fontSize: 16,fontFamily: themeFontSemiBold,color: blackThemeClr),),

                  SizedBox(height: 60,),

                  hPetsTextFormField("Name", nameInput, "Name is required", TextInputType.text, false),
                  SizedBox(height: 20,),
                  hPetsTextFormField("Surname", surnameInput, "Surname is required", TextInputType.text, false),
                  SizedBox(height: 20,),
                  hPetsTextFormField("Email", mailInput, "Email is required", TextInputType.text, false),
                  SizedBox(height: 20,),
                  hPetsTextFormField("Password", passwordInput, "Password is required", TextInputType.text, false),

                  SizedBox(height: 40),

                  SizedBox(
                      width: FrameSize.screenWidth,
                      height: FrameSize.screenHeight / 14,
                      child: hPetsElevatedButton(
                          "Register",
                          appThemeClr,
                          40.0,
                          themeFontBold,
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
                    padding: const EdgeInsets.all(12.0),
                    child: RichText(
                  text: TextSpan(children: <TextSpan>[
                      TextSpan(
                      text: "I already have an account,  ",
                      style: TextStyle(
                          color: appThemeClr,
                          fontFamily: themeFontMedium,
                          fontSize: 15)),
                  TextSpan(
                      text: "Login!",
                      style: TextStyle(
                          color: Colors.red,
                          fontFamily: themeFontMedium,
                          fontSize: 14),
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
