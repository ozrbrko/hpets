import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hpets/core/components/widgets/widgets.dart';
import 'package:hpets/core/constants/fonts.dart';
import 'package:hpets/core/responsive/frame_size.dart';
import '../constants/colors.dart';
import 'config.dart';

TextEditingController mailInputController = TextEditingController();
TextEditingController suggestionInputController = TextEditingController();

TextEditingController currentPasswordInputController = TextEditingController();
TextEditingController newPasswordInputController = TextEditingController();
TextEditingController restartNewPasswordInputController = TextEditingController();


final _formKey = GlobalKey<FormState>();

class AlertDialogFunctions {
  static Object exitApp(BuildContext context) {
    const storage = FlutterSecureStorage();


    mailInputController.clear();
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Exit App",
                              style:
                              TextStyle(fontFamily: themeFontBold, fontSize: 19),
                            ),

                            InkWell(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                child: Icon(Icons.close)),
                          ],
                        ),

                        Divider(endIndent: 0,indent: 0,),
                        // const Divider(
                        //   height: 15,
                        //   thickness: 0.5,
                        //   indent: 0,
                        //   endIndent: 0,
                        //   color: appThemeClr,
                        // ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Are you sure you want to exit?",
                          style: TextStyle(
                              fontSize: 14, fontFamily: themeFontRegular),
                        ),
                        SizedBox(
                          height: 35,
                        ),


                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              flex: 1,
                              child: SizedBox(
                                  height: FrameSize.screenHeight / 14,
                                  child: hPetsElevatedButton(
                                      "No",
                                      AppColors.appThemeClr,
                                      40,
                                      themeFontSemiBold,
                                          () => {

                                       Navigator.pop(context),

                                      })),
                            ),

                            SizedBox(width: 10,),
                            Expanded(
                              flex: 1,
                              child: SizedBox(
                                  height: FrameSize.screenHeight / 14,
                                  child: hPetsElevatedButton(
                                      "Yes",
                                      AppColors.redThemeClr,
                                      40,
                                      themeFontSemiBold,
                                          () async => {

                                          await storage.delete(key: "remem_token"),
                                      Navigator.of(context).pushReplacementNamed('/login'),



                              })),
                            ),
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

  static Future forgotPassword(BuildContext context) {

    mailInputController.clear();
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
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

                        Divider(endIndent: 0,indent: 0,),

                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Don't worry, write the email with which you are registered and we will send you the steps you must follow to change your password.",
                          style: TextStyle(
                              fontSize: 14, fontFamily: themeFontRegular),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        hPetsTextFormField("Email", mailInputController, "Email is required !",
                            TextInputType.text, false, "mail"),
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
                                    AppColors.appThemeClr,
                                    40,
                                    themeFontSemiBold,
                                    () => {

                                            if (_formKey.currentState!
                                                .validate())
                                              {
                                                print("Validated"),
                                                Config.resetPassword(context,mailInputController)

                                              }
                                            else
                                              {
                                                print("Not Validated"),
                                              }

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


  static Future changePassword (BuildContext context) {

    mailInputController.clear();
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Change Password",
                              style:
                              TextStyle(fontFamily: themeFontBold, fontSize: 19),
                            ),

                            InkWell(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                child: Icon(Icons.close)),
                          ],
                        ),

                        Divider(endIndent: 0,indent: 0,),
                        // const Divider(
                        //   height: 15,
                        //   thickness: 0.5,
                        //   indent: 0,
                        //   endIndent: 0,
                        //   color: appThemeClr,
                        // ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "You can change your password by incoming mail.",
                          style: TextStyle(
                              fontSize: 14, fontFamily: themeFontRegular),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        hPetsTextFormField("Email", mailInputController, "Email is required !",
                            TextInputType.text, false, "mail"),
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
                                    AppColors.appThemeClr,
                                    40,
                                    themeFontSemiBold,
                                        () => {

                                      if (_formKey.currentState!
                                          .validate())
                                        {
                                          print("Validated"),
                                          Config.resetPassword(context,mailInputController)

                                        }
                                      else
                                        {
                                          print("Not Validated"),

                                        }

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



  static Future infoAlert(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(

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
                          "Registration is successful",
                          style:
                          TextStyle(fontFamily: themeFontBold, fontSize: 19),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Go to login and enjoy app !",
                          style: TextStyle(
                              fontSize: 16, fontFamily: themeFontRegular),
                        ),
                        SizedBox(
                          height: 35,
                        ),


                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                                width: FrameSize.screenWidth,
                                height: FrameSize.screenHeight / 14,
                                child: hPetsElevatedButton(
                                    "Login",
                                    AppColors.appThemeClr,
                                    40,
                                    themeFontSemiBold,
                                        () => {

                                   Navigator.pushNamed(context, '/login',),
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



  static Future opinionSuggestion (BuildContext context) {

    suggestionInputController.clear();
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Opinion and Suggestions",
                              style:
                              TextStyle(fontFamily: themeFontBold, fontSize: 19),
                            ),

                            InkWell(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                child: Icon(Icons.close)),
                          ],
                        ),

                        Divider(endIndent: 0,indent: 0,),

                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Let us know your comments and suggestions !",
                          style: TextStyle(
                              fontSize: 14, fontFamily: themeFontRegular),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        hPetsTextFormField("", suggestionInputController, "",
                            TextInputType.text, false, "else"),
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
                                    "Send",
                                    AppColors.appThemeClr,
                                    40,
                                    themeFontSemiBold,
                                        () => {

                                      Navigator.pop(context),
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(" It was sent with success. Thank you !"), )),


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




