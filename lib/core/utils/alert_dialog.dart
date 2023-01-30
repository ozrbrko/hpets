import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hpets/core/components/widgets/widgets.dart';
import 'package:hpets/core/constants/fonts.dart';
import 'package:hpets/core/responsive/frame_size.dart';
import '../../main.dart';
import '../../view/login.dart';
import '../constants/colors.dart';

TextEditingController mailInput = TextEditingController();
final _formKey = GlobalKey<FormState>();

class AlertDialogFunctions {
  static Future exitApp(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Airportal"),
            content: Text(
              "Çıkış yapmak istediğinizden emin misiniz?",
              style: TextStyle(fontFamily: 'IBMPlexSans'),
            ),
            actions: [
              ElevatedButton(
                child: Text(
                  "Vazgeç",
                  style: TextStyle(
                      color: Color(0xff74A2B7),
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'IBMPlexSans'),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              ElevatedButton(
                child: Text(
                  "Çıkış Yap",
                  style: TextStyle(
                      color: Color(0xff74A2B7),
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'IBMPlexSans'),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
              ),
            ],
          );
        });
  }

  static Future forgotPassword(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 340,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Have you forgotten your password?",
                          style:
                              TextStyle(fontFamily: themeFontBold, fontSize: 19),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Don't worry, write the email with which you are registered and we will send you the steps you must follow to change your password.",
                          style: TextStyle(
                              fontSize: 14, fontFamily: themeFontRegular),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        hPetsTextFormField("Email", mailInput, "required",
                            TextInputType.text, false),
                        SizedBox(
                          height: 25,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                                width: FrameSize.screenWidth,
                                height: FrameSize.screenHeight / 14,
                                child: hPetsElevatedButton(
                                    "Send Email",
                                    appThemeClr,
                                    40,
                                    themeFontSemiBold,
                                    () => {
                                      logger.i("Send Email Tıklandı.")
                                            // if (_formKey.currentState!
                                            //     .validate())
                                            //   {
                                            //     print("Validated"),
                                            //   }
                                            // else
                                            //   {
                                            //     print("Not Validated"),
                                            //   }

                                        })),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
