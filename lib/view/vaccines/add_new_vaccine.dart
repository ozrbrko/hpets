import 'dart:collection';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hpets/core/components/widgets/widgets.dart';
import 'package:hpets/core/extension/string_extension.dart';
import 'package:hpets/core/services/firebase_services.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/fonts.dart';
import '../../core/model/pets.dart';
import '../../core/responsive/frame_size.dart';
import '../../core/utils/config.dart';

class AddNewVaccine extends StatefulWidget {
  Pets? pet;

  AddNewVaccine({this.pet});

  @override
  State<AddNewVaccine> createState() => _AddNewVaccineState();
}

class _AddNewVaccineState extends State<AddNewVaccine> {
  var refPets =
      FirebaseDatabase.instance.ref().child("pets_table").child(Config.token);
  var vaccinesPets = FirebaseDatabase.instance
      .ref()
      .child("pets_table")
      .child(Config.token)
      .child(Config.petKey)
      .child("vaccines");

  // var allVaccinesPets = FirebaseDatabase.instance.ref().child("pets_table").child("all_vaccines").child(Config.token);

  TextEditingController vaccineNameInputController = TextEditingController();
  TextEditingController veterinaryInfoInputController = TextEditingController();
  TextEditingController vaccineDateInputController = TextEditingController();
  TextEditingController vaccineTimeInputController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    FrameSize.init(context: context);

    return Scaffold(
        appBar: hpetsAppBar(context, true, "new_vaccine".tr, false),
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
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "add_new_vaccine".tr,
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: themeFontBold,
                          color: AppColors.appThemeClr),
                    ),
                    // Text("Fill in your details to get add.",style: TextStyle(fontSize: 16,fontFamily: themeFontSemiBold,color: AppColors.blackThemeClr),),

                    SizedBox(
                      height: 25,
                    ),

                    hPetsTextFormField(
                        "vaccine_name".tr,
                        vaccineNameInputController,
                        "vaccine_name_required".tr,
                        TextInputType.text,
                        false,
                        "false"),
                    SizedBox(
                      height: 12,
                    ),

                    hPetsTextFormField(
                        "veterinary".tr,
                        veterinaryInfoInputController,
                        "veterinary_required".tr,
                        TextInputType.text,
                        false,
                        "false"),

                    // hPetsTextFormField("Type", petTypeInputController, "required", TextInputType.text, false, "false"),

                    SizedBox(
                      height: 12,
                    ),

                    Config.DateTextFormField(context, vaccineDateInputController),

                    SizedBox(
                      height: 12,
                    ),

                    Config.TimeTextFormField(context, vaccineTimeInputController),

                    //todo vaccine time
                    // hPetsTextFormField("Color", petColorInputController, "Color is required !", TextInputType.text, false, "false"),
                    SizedBox(height: 40),

                    SizedBox(
                        width: FrameSize.screenWidth,
                        height: FrameSize.screenHeight / 14,
                        child: hPetsElevatedButton(
                            "save".tr,
                            AppColors.appThemeClr,
                            AppColors.whiteThemeClr,
                            40,
                            themeFontBold, () {
                          if (_formKey.currentState!.validate()) {
                            print("Validated");
                            var vaccineName = vaccineNameInputController.text;
                            var veterinaryInfo =
                                veterinaryInfoInputController.text;
                            var vaccineDate = vaccineDateInputController.text;
                            var vaccineTime = vaccineTimeInputController.text;

                            Navigator.pop(context);

                            VaccineService.addVaccine(vaccineName, veterinaryInfo, vaccineDate, vaccineTime, widget.pet!.pet_id!, widget.pet!.pet_name!);
                            // addVaccine(vaccineName, veterinaryInfo, vaccineDate, vaccineTime, widget.pet!.pet_id!, widget.pet!.pet_name!);

                            // return Navigator.pushNamed(context, '/bottomnav');

                            // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("E-mail or password is wrong !"), ));
                          } else {
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

}
