import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hpets/core/components/widgets/widgets.dart';
import 'package:hpets/core/services/firebase_services.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/fonts.dart';
import '../../core/model/pets.dart';
import '../../core/responsive/frame_size.dart';

class AddNewVaccine extends StatefulWidget {
  Pets? pet;
  AddNewVaccine({this.pet});

  @override
  State<AddNewVaccine> createState() => _AddNewVaccineState();
}

class _AddNewVaccineState extends State<AddNewVaccine> {

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

                    SizedBox(
                      height: 25,
                    ),

                    hPetsTextFormField("vaccine_name".tr, vaccineNameInputController, "vaccine_name_required".tr, TextInputType.text, false, "false"),
                    SizedBox(
                      height: 12,
                    ),

                    hPetsTextFormField("veterinary".tr, veterinaryInfoInputController, "veterinary_required".tr, TextInputType.text, false, "false"),

                    SizedBox(
                      height: 12,
                    ),

                    DateTextFormField(context, vaccineDateInputController),

                    SizedBox(
                      height: 12,
                    ),

                    TimeTextFormField(context, vaccineTimeInputController),

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
                            var veterinaryInfo = veterinaryInfoInputController.text;
                            var vaccineDate = vaccineDateInputController.text;
                            var vaccineTime = vaccineTimeInputController.text;

                            Navigator.pop(context);
                            VaccineService.addVaccine(vaccineName, veterinaryInfo, vaccineDate, vaccineTime, widget.pet!.pet_id!, widget.pet!.pet_name!);

                          } else {
                            print("Not Validated");
                          }
                            }))
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
