import 'dart:collection';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hpets/core/components/widgets/widgets.dart';
import 'package:hpets/core/extension/string_extension.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/fonts.dart';
import '../../core/model/pets.dart';
import '../../core/responsive/frame_size.dart';
import '../../core/utils/config.dart';

class AddNewDisease extends StatefulWidget {
  Pets? pet;

  AddNewDisease({this.pet});

  @override
  State<AddNewDisease> createState() => _AddNewDiseaseState();
}

class _AddNewDiseaseState extends State<AddNewDisease> {

  var refPets = FirebaseDatabase.instance.ref().child("pets_table").child(Config.token);
  var diseasePets = FirebaseDatabase.instance.ref().child("pets_table").child(Config.token).child(Config.petKey).child("diseases");

  TextEditingController  diseaseNameInputController = TextEditingController();
  TextEditingController  diseaseContentInputController = TextEditingController();
  TextEditingController  diseaseDateInputController = TextEditingController();
  TextEditingController  diseaseTimeInputController = TextEditingController();



  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    FrameSize.init(context: context);

    return Scaffold(
        appBar: hpetsAppBar(context, true, "new_disease".tr, false),
        body: Container(

          height: FrameSize.screenHeight,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    SizedBox(height: 20,),
                    Text("lets_add_new_disease".tr,style: TextStyle(fontSize: 30,fontFamily: themeFontBold,color: AppColors.appThemeClr),),
                    // Text("Fill in your details to get add.",style: TextStyle(fontSize: 16,fontFamily: themeFontSemiBold,color: AppColors.blackThemeClr),),

                    SizedBox(height: 25,),


                    hPetsTextFormField("disease_name".tr, diseaseNameInputController, "disease_name_required".tr, TextInputType.text, false, "false"),
                    SizedBox(height: 12,),

                    hPetsTextFormField("content".tr, diseaseContentInputController, "content_required".tr, TextInputType.text, false, "false"),

                    // hPetsTextFormField("Type", petTypeInputController, "required", TextInputType.text, false, "false"),

                    SizedBox(height: 12,),


                    TextFormField(
                      controller: diseaseDateInputController,
                      decoration: InputDecoration(

                          contentPadding:
                          const EdgeInsets.symmetric(vertical: 17, horizontal: 32),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(Radius.circular(40.0))),
                          filled: true,
                          hintText: "date".tr,
                          hintStyle: TextStyle(
                              fontFamily: themeFontLight, color: AppColors.greyThemeClr, fontSize: 16.0)),
                      onTap: () async{
                        DateTime date = DateTime(1900);
                        FocusScope.of(context).requestFocus(new FocusNode());

                        date = (await showDatePicker(
                            locale:  Locale("${Config.languageValue.toString().toLowerCase()}", "${Config.languageValue.toString().toUpperCase()}"),

                            context: context,
                            initialDate:DateTime.now(),
                            firstDate:DateTime(1900),
                            lastDate: DateTime(2100),
                            builder: (context, child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme: ColorScheme.light(
                                    primary: AppColors.appThemeClr,
                                    // <-- SEE HERE
                                    onPrimary: AppColors.whiteThemeClr,
                                    // <-- SEE HERE
                                    onSurface:
                                    AppColors.blackThemeClr, // <-- SEE HERE
                                  ),
                                  textButtonTheme: TextButtonThemeData(
                                    style: TextButton.styleFrom(
                                      primary: AppColors.appThemeClr, // button text color
                                    ),
                                  ),
                                ),
                                child: child!,
                              );
                            }))!;


                        String dateSlug ="${date.year.toString()}-${date.month.toString().padLeft(2,'0')}-${date.day.toString().padLeft(2,'0')}";

                        diseaseDateInputController.text = dateSlug;},),
                    SizedBox(height: 12,),

                    TextFormField(
                      controller: diseaseTimeInputController,

                      decoration: InputDecoration(

                          contentPadding:
                          const EdgeInsets.symmetric(vertical: 17, horizontal: 32),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(Radius.circular(40.0))),
                          filled: true,
                          hintText: "time".tr,
                          hintStyle: TextStyle(
                              fontFamily: themeFontLight, color: AppColors.greyThemeClr, fontSize: 16.0)),
                      onTap: () {
                        FocusScope.of(context).requestFocus(new FocusNode());
                        showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                          builder: (context, child) {
                            return Theme(
                              data: ThemeData.light().copyWith(
                                colorScheme: ColorScheme.light(
                                  // change the border color
                                  primary: AppColors.appThemeClr,
                                  // change the text color
                                  onSurface: AppColors.appThemeClr,
                                ),
                                // button colors
                                buttonTheme: ButtonThemeData(
                                  colorScheme: ColorScheme.light(
                                    primary: AppColors.appThemeClr,
                                  ),
                                ),
                              ), child: child!,
                            );
                          },
                        ).then((value) {
                          setState(() {
                            diseaseTimeInputController.text=value!.format(context);
                          });
                        });
                      },
                      // controller: TextEditingController(text: selectedTime.format(context)),
                    ),


                    //todo vaccine time
                    // hPetsTextFormField("Color", petColorInputController, "Color is required !", TextInputType.text, false, "false"),
                    SizedBox(height: 40),


                    SizedBox(
                        width: FrameSize.screenWidth,
                        height: FrameSize.screenHeight / 14,
                        child: hPetsElevatedButton("save".tr, AppColors.appThemeClr,AppColors.whiteThemeClr, 40, themeFontBold, () {

                          if (_formKey.currentState!.validate())
                          {
                            print("Validated");
                            var diseaseName = diseaseNameInputController.text;
                            var diseaseContent = diseaseContentInputController.text;
                            var diseaseDate = diseaseDateInputController.text;
                            var diseaseTime = diseaseTimeInputController.text;


                            Navigator.pop(context);

                            addDisease(diseaseName, diseaseContent, diseaseTime,diseaseDate,widget.pet!.pet_id!,widget.pet!.pet_name!);

                            // return Navigator.pushNamed(context, '/bottomnav');

                            // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("E-mail or password is wrong !"), ));
                          }
                          else
                          {
                            print("Not Validated");
                          }



                          // logger.i("Kaydet Butonu Tıklandı.");
                        }))

                  ],
                ),
              ),
            ),
          ),


        ));
  }


  Future<void> addDisease(String disease_name, String disease_content, String disease_time, String disease_date, String pet_id, String pet_name) async {
    // await FirebaseFirestore.instance
    //     .collection('Pets')
    //     .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid);


    var info = HashMap<String,dynamic>();
    info["disease_title"] = disease_name.basHarfleriBuyut();
    info["disease_content"] = disease_content;
    info["disease_date"] = disease_date;
    info["disease_time"] = disease_time.basHarfleriBuyut();
    info["disease_id"] = "";
    info["pet_id"] = pet_id;
    info["pet_name"] = pet_name;


    diseasePets.push().set(info);


  }
}
