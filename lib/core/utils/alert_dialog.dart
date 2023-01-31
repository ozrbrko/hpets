import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hpets/core/components/widgets/widgets.dart';
import 'package:hpets/core/constants/fonts.dart';
import 'package:hpets/core/responsive/frame_size.dart';
import '../../main.dart';
import '../../view/login.dart';
import '../constants/colors.dart';

TextEditingController mailInputController = TextEditingController();
final _formKey = GlobalKey<FormState>();

class AlertDialogFunctions {
  static Object exitApp(BuildContext? context) {
    // const storage = FlutterSecureStorage();


    return showDialog(
      context: context!,
      builder: (BuildContext context) {
        return AlertDialog(

          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(32.0))),
          contentPadding: const EdgeInsets.only(
            top: 10.0,
          ),
          content: SizedBox(
            width: MediaQuery.of(context).size.width - 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Text(
                      "",
                      style: TextStyle(fontSize: 24.0),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                 Divider(
                  color: AppColors.greyThemeClr,
                  height: 4.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 16.0, bottom: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                            "Uygulamadan çıkmak istiyor musunuz?",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontFamily: themeFontLight, color: AppColors.greyThemeClr),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  // width: context.dynamicWidth(0.1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ElevatedButton(

                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(AppColors.appThemeClr),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(32.0),
                              ),
                            ),
                            ),
                          ),

                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child:  Padding(
                            padding: EdgeInsets.only(top: 12.0, bottom: 16.0),
                            child: Text(
                              "Hayır",
                              style: TextStyle(
                                color: AppColors.greyThemeClr,
                                fontFamily: themeFontLight,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(

                          style: ButtonStyle(
                              backgroundColor:  MaterialStateProperty.all(AppColors.redThemeClr),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(32.0),
                                ),
                              ),)
                          ),

                          onPressed: () async {


                            // await storage.delete(key: "remem_token");
                            Navigator.of(context).pushReplacementNamed('/login');
                            // exit(0);

                          },
                          child:  Padding(
                            padding: EdgeInsets.only(top: 12.0, bottom: 16.0),
                            child: Text(
                              "Evet",
                              style: TextStyle(
                                color: AppColors.whiteThemeClr,
                                fontFamily: themeFontLight,
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ) ??
        false;
  }

  static Future forgotPassword(BuildContext context) {

    mailInputController.clear();
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Flexible(
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
                            "Don't worry, write the email with which you are registered and we will send you the steps you must follow to change your password.",
                            style: TextStyle(
                                fontSize: 14, fontFamily: themeFontRegular),
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          hPetsTextFormField("Email", mailInputController, "required",
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

                                        mailInputController.text!="" ?
                                        resetPassword(context) : ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(" Please enter the Email !"), )),



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
            child: Flexible(
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
            ),
          );
        });
  }


}

Future resetPassword(BuildContext context) async{
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: mailInputController.text.trim());
    logger.i("Mail Gönderildi}");
    Navigator.pop(context);
    // mailInputController.clear();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(" Check your email address please !"), ));

    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("E-mail veya şifre hatalı!"), ))
  } on FirebaseAuthException catch (e) {
    print(e);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(" This email is not registered in the system !"), ));

    logger.i("Mail Gönderilemedi");

  };

}


