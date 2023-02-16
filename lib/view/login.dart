import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hpets/core/components/widgets/widgets.dart';
import 'package:hpets/core/constants/colors.dart';
import 'package:hpets/core/constants/fonts.dart';
import 'package:hpets/core/constants/images.dart';
import 'package:hpets/core/responsive/frame_size.dart';
import 'package:hpets/core/services/auth_service.dart';
import 'package:hpets/core/utils/alert_dialog.dart';
import 'package:hpets/core/utils/config.dart';
import 'package:hpets/view/google_sign_in.dart';

import '../main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController loginInputController = TextEditingController();
  TextEditingController passwordInputController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    FrameSize.init(context: context);
    return Scaffold(
        appBar: null,
        body: SingleChildScrollView(
          child: Container(
            height: FrameSize.screenHeight,
            color: AppColors.whiteThemeClr,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: SingleChildScrollView(
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
                            hPetsTextFormField(
                                "Email",
                                loginInputController,
                                "Email is required !",
                                TextInputType.text,
                                false,
                                "mail"),
                            SizedBox(
                              height: 12,
                            ),
                            hPetsTextFormField(
                                "Password",
                                passwordInputController,
                                "Password is required !",
                                TextInputType.text,
                                true,
                                "password"),
                            SizedBox(height: 40),

                            SizedBox(
                                width: FrameSize.screenWidth,
                                height: FrameSize.screenHeight / 14,
                                child: hPetsElevatedButton(
                                    "Login",
                                    AppColors.appThemeClr,AppColors.whiteThemeClr,
                                    40.0,
                                    themeFontSemiBold,
                                    () => {
                                          if (_formKey.currentState!.validate())
                                            {
                                              print("Validated"),
                                              _authService
                                                  .logIn(
                                                      loginInputController.text,
                                                      passwordInputController
                                                          .text,
                                                      context)
                                                  .then((value) {
                                                logger.e("döndü ${value}");
                                                Config.token = value!.uid;
                                                Config.secureStorage
                                                    .savePreferences(value!.uid);
                                                logger.i("token ${Config.token}");
                                                // if(value!.uid!=null){
                                                //   FirebaseDatabase.instance.ref().child("users").child(value.uid).set(
                                                //       {"name": value.displayName,
                                                //        "email": value.email});
                                                // }

                                                Navigator.of(context)
                                                    .pushReplacementNamed(
                                                        '/bottomnav');
                                              }).catchError((error) => {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                SnackBar(
                                                          content: Text(
                                                              "E-mail or password is wrong !"),
                                                        ))
                                                      }),
                                            }
                                          else
                                            {
                                              print("Not Validated"),
                                            }
                                        })),
                            SizedBox(height: 10),

                            SizedBox(
                              width: FrameSize.screenWidth,
                              height: FrameSize.screenHeight / 14,
                              child: hPetsElevatedButtonwithLogo(
                                  "Login with Google",
                                  AppColors.redDarkThemeClr, AppColors.whiteThemeClr,
                                  40,
                                  themeFontRegular, () async {
                               var data = await GoogleSignHelper.instance.signIn();
                               if(data!=null){
                                var userData = await GoogleSignHelper.instance.firebaseSignIn().then((value) {

                                  logger.e("döndü ${value}");
                                  Config.token = value!.uid;
                                  Config.secureStorage
                                      .savePreferences(value!.uid);
                                  logger.i("token ${Config.token}");
                                  Navigator.of(context)
                                      .pushReplacementNamed(
                                      '/bottomnav');
                                });
                                // print("access: ${userData.accessToken}");
                                // print("id: ${userData.idToken}");
                               }
                              }),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  onTap: () {
                                    AlertDialogFunctions.forgotPassword(context);
                                    logger.e("Forgot Password tıklandı.");
                                  },
                                  child: Container(
                                    height: 30,
                                    color: AppColors.whiteThemeClr,
                                    child: Text(
                                      "Forgot Password ?",
                                      style: TextStyle(
                                          color: AppColors.appThemeClr,
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
                                    color: AppColors.appThemeClr,
                                    fontFamily: themeFontMedium,
                                    fontSize: 16)),
                            TextSpan(
                                text: "Register!",
                                style: TextStyle(
                                    color: AppColors.redThemeClr,
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
            ),
          ),
        ));
  }
}
