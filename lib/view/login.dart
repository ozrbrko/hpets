import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(height: FrameSize.screenHeight/13),
                          Center(
                            child: SizedBox(
                                width: 130,
                                child: Image.asset(Images.logo_hpets)),
                          ),
                          Text(
                            'welcome'.tr,
                            style: TextStyle(
                                fontSize: 28, fontFamily: themeFontMedium),
                          ),
                          SizedBox(height: 40),
                          // Text("Email",style: TextStyle(fontFamily: themeFontMedium),),
                          hPetsTextFormField(
                              'email'.tr,
                              loginInputController,
                              'email_required'.tr,
                              TextInputType.text,
                              false,
                              "mail"),
                          SizedBox(
                            height: 12,
                          ),
                          hPetsTextFormField(
                              'password'.tr,
                              passwordInputController,
                              'password_required'.tr,
                              TextInputType.text,
                              true,
                              "password"),
                          SizedBox(height: 40),

                          SizedBox(
                              width: FrameSize.screenWidth,
                              height: FrameSize.screenHeight / 14,
                              child: hPetsElevatedButton(
                                  'login'.tr,
                                  AppColors.appThemeClr,AppColors.whiteThemeClr,
                                  40.0,
                                  themeFontRegular,
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
                                                            "mail_or_password_wrong".tr),
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
                                'login_with_google'.tr,
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
                                    "forgot_password".tr,
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
                    RichText(
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: "dont_have_account".tr,
                            style: TextStyle(
                                color: AppColors.appThemeClr,
                                fontFamily: themeFontMedium,
                                fontSize: 16)),
                        TextSpan(
                            text: "register".tr,
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
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
