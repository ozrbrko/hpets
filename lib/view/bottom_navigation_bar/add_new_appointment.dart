import 'dart:collection';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hpets/core/components/widgets/widgets.dart';
import 'package:hpets/core/extension/string_extension.dart';
import 'package:hpets/main.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/fonts.dart';
import '../../core/responsive/frame_size.dart';
import '../../core/utils/config.dart';

class AddNewAppointment extends StatefulWidget {
  const AddNewAppointment({Key? key}) : super(key: key);

  @override
  State<AddNewAppointment> createState() => _AddNewAppointmentState();
}

class _AddNewAppointmentState extends State<AddNewAppointment> {

  var refPets = FirebaseDatabase.instance.ref().child("pets_table").child(
      Config.token);
  var appointmentPets = FirebaseDatabase.instance.ref().child("pets_table").child(
      "appointments").child(Config.token);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    logger.e(Config.languageValue);
  }

  TextEditingController veterinaryInfoInputController = TextEditingController();
  TextEditingController petNameInputController = TextEditingController();
  TextEditingController appointmentDateInputController = TextEditingController();
  TextEditingController appointmentTimeInputController = TextEditingController();
  TextEditingController appointmentAddressInputController = TextEditingController();

  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: hpetsAppBar(context, true, "new_appointment".tr, false),
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
                  Text("add_new_appointment".tr, style: TextStyle(
                      fontSize: 30,
                      fontFamily: themeFontBold,
                      color: AppColors.appThemeClr),),
                  // Text("Fill in your details to get add.",style: TextStyle(fontSize: 16,fontFamily: themeFontSemiBold,color: AppColors.blackThemeClr),),

                  SizedBox(height: 25,),

                  // hPetsTextFormField("Pet Name", petNameInputController,
                  //     "Veterinary Info is required !", TextInputType.text, false,
                  //     "false"),

                  DropdownButtonFormField2(

                    decoration: InputDecoration(

                        contentPadding:
                        const EdgeInsets.symmetric(vertical: 17, horizontal: 15),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(40.0))),
                        filled: true,
                        hintText: "Select Type",


                        hintStyle: TextStyle(
                            fontFamily: themeFontLight, color: AppColors.greyThemeClr, fontSize: 14.0)),
                    isExpanded: true,
                    hint:  Text(
                      'select_pet'.tr,
                      style: TextStyle(fontSize: 16),
                    ),

                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),

                    items: Config.petListConfig
                        .map((item) =>
                        DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style:  TextStyle(
                              fontSize: 16, color: AppColors.blackThemeClr,
                            ),
                          ),
                        ))
                        .toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'pet_required'.tr;
                      }
                    },
                    onChanged: (value) {
                      // logger.i(value);
                      petNameInputController.text = value!;


                    },
                    onSaved: (value) {
                      selectedValue = value.toString();
                      // logger.i(value);
                      petNameInputController.text = value!;

                    },
                  ),




                  // hPetsTextFormField("Type", petTypeInputController, "required", TextInputType.text, false, "false"),

                  SizedBox(height: 12,),

                  Config.DateTextFormField(context,appointmentDateInputController),
                  SizedBox(height: 12,),

                  Config.TimeTextFormField(context, appointmentTimeInputController),

                  SizedBox(height: 12,),

                  // hPetsTextFormField("Veterinary Address", appointmentAddressInputController,
                  //     "Veterinary Address is required !", TextInputType.text, false,
                  //     "false"),

                  hPetsTextFormField("veterinary".tr, veterinaryInfoInputController,
                      "veterinary_required".tr, TextInputType.text, false,
                      "false"),
                  SizedBox(height: 12,),

                  ContentTextFormField(appointmentAddressInputController,"address_required".tr,"address".tr),


                  SizedBox(height: 40),

                  SizedBox(
                      width: FrameSize.screenWidth,
                      height: FrameSize.screenHeight / 14,
                      child: hPetsElevatedButton(
                          "save".tr, AppColors.appThemeClr,AppColors.whiteThemeClr, 40, themeFontBold, () {
                        if (_formKey.currentState!.validate()) {
                          print("Validated");
                          var veterinaryInfo = veterinaryInfoInputController.text;
                          var petName = petNameInputController.text;
                          var appointmentDate = appointmentDateInputController.text;
                          var appointmentTime = appointmentTimeInputController.text;
                          var veterinary_address = appointmentAddressInputController.text;

                          Navigator.pop(context);


                          addAppointment(veterinaryInfo, appointmentDate, appointmentTime, petName, veterinary_address);
                          // return Navigator.pushNamed(context, '/bottomnav');

                          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("E-mail or password is wrong !"), ));
                        }
                        else {
                          print("Not Validated");
                        }


                        // logger.i("Kaydet Butonu Tıklandı.");
                      }))

                ],
              ),
            ),
          ),
        ),

      ),



    );
  }

  Future<void> addAppointment(String veterinaryInfo,String appointmentDate,String appointmentTime, String petName,
      String veterinary_address) async {


    var info = HashMap<String, dynamic>();
    info["veterinary_info"] = veterinaryInfo.basHarfleriBuyut();
    info["appointment_date"] = appointmentDate;
    info["appointment_time"] = appointmentTime;
    info["pet_name"] = petName;
    info["veterinary_address"] = veterinary_address.basHarfleriBuyut();
    info["appointment_id"] = "";



    appointmentPets.push().set(info);
  }
}

final List<String> petItems = [
  'Dog',
  'Cat',
  'Bird',
  'Fish',
  'Turtle',
  'Horse'
];
