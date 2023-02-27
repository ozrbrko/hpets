import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hpets/core/components/widgets/widgets.dart';
import 'package:hpets/core/services/firebase_services.dart';
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

  @override
  void initState() {

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

                  SizedBox(height: 25,),

                  // not: Evcil Hayvan seçim dropdownı

                  DropdownButtonFormField2(

                    decoration: InputDecoration(

                        contentPadding:
                        const EdgeInsets.symmetric(vertical: 17, horizontal: 15),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(40.0))),
                        filled: true,
                        hintText: "Select Type",
                        hintStyle: TextStyle(fontFamily: themeFontLight, color: AppColors.greyThemeClr, fontSize: 14.0)),
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
                      petNameInputController.text = value!;
                    },
                    onSaved: (value) {
                      selectedValue = value.toString();
                      petNameInputController.text = value!;
                    },
                  ),

                  SizedBox(height: 12,),

                  DateTextFormField(context,appointmentDateInputController),
                  SizedBox(height: 12,),

                  TimeTextFormField(context, appointmentTimeInputController),

                  SizedBox(height: 12,),

                  // not: veteriner formfield
                  hPetsTextFormField("veterinary".tr, veterinaryInfoInputController,
                      "veterinary_required".tr, TextInputType.text, false,
                      "false"),
                  SizedBox(height: 12,),
                  // not: adres formfield
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

                          AppointmentService.addAppointment(veterinaryInfo, appointmentDate, appointmentTime, petName, veterinary_address);
                        }
                        else {
                          print("Not Validated");
                        }
                          }))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
