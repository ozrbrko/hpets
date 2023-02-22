import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hpets/core/components/widgets/widgets.dart';
import 'package:hpets/core/services/firebase_services.dart';
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

                    Config.DateTextFormField(context, diseaseDateInputController),

                    SizedBox(height: 12,),

                    Config.TimeTextFormField(context, diseaseTimeInputController),

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

                            DiseaseService.addDisease(diseaseName, diseaseContent, diseaseTime, diseaseDate, widget.pet!.pet_id!, widget.pet!.pet_name!);
                          }
                          else
                          {
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