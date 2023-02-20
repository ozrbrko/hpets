import 'dart:collection';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hpets/core/components/widgets/widgets.dart';
import 'package:hpets/core/extension/string_extension.dart';
import 'package:hpets/core/responsive/frame_size.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/fonts.dart';
import '../../core/model/pets.dart';
import '../../core/utils/config.dart';

class AddNewNutrition extends StatefulWidget {

  Pets? pet;

  AddNewNutrition({this.pet});

  @override
  State<AddNewNutrition> createState() => _AddNewNutritionState();
}

class _AddNewNutritionState extends State<AddNewNutrition> {


  var refPets = FirebaseDatabase.instance.ref().child("pets_table").child(
      Config.token);
  var nutritionPets = FirebaseDatabase.instance.ref().child("pets_table").child(Config.token).child(Config.petKey).child("nutritions");



  TextEditingController foodNameInputController = TextEditingController();
  TextEditingController amountFoodInputController = TextEditingController();
  TextEditingController foodDateInputController = TextEditingController();
  TextEditingController foodTimeInputController = TextEditingController();


  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    FrameSize.init(context: context);

    return Scaffold(

      appBar: hpetsAppBar(context, true, "new_nutrition".tr, false),
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
                  Text("lets_add_new_nutrition".tr, style: TextStyle(
                      fontSize: 30,
                      fontFamily: themeFontBold,
                      color: AppColors.appThemeClr),),
                  // Text("Fill in your details to get add.",style: TextStyle(fontSize: 16,fontFamily: themeFontSemiBold,color: AppColors.blackThemeClr),),

                  SizedBox(height: 25,),

                  hPetsTextFormField("food_name".tr, foodNameInputController,
                      "food_name_required".tr, TextInputType.text, false,
                      "false"),
                  SizedBox(height: 12,),

                  hPetsTextFormField("amount_of_food".tr, amountFoodInputController,
                      "amount_of_food_required".tr, TextInputType.text, false,
                      "false"),

                  // hPetsTextFormField("Type", petTypeInputController, "required", TextInputType.text, false, "false"),

                  SizedBox(height: 12,),

                  TextFormField(
                    controller: foodDateInputController,
                    decoration: InputDecoration(

                        contentPadding:
                        const EdgeInsets.symmetric(vertical: 17, horizontal: 32),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(
                                Radius.circular(40.0))),
                        filled: true,
                        hintText: "date".tr,
                        hintStyle: TextStyle(
                            fontFamily: themeFontLight,
                            color: AppColors.greyThemeClr,
                            fontSize: 16.0)),
                    onTap: () async {
                      DateTime date = DateTime(1900);
                      FocusScope.of(context).requestFocus(new FocusNode());

                      date = (await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100)))!;
                      String dateSlug = "${date.year.toString()}-${date.month
                          .toString().padLeft(2, '0')}-${date.day.toString()
                          .padLeft(2, '0')}";

                      foodDateInputController.text = dateSlug;
                    },),
                  SizedBox(height: 12,),

                  TextFormField(
                    controller: foodTimeInputController,

                    decoration: InputDecoration(

                        contentPadding:
                        const EdgeInsets.symmetric(vertical: 17, horizontal: 32),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(
                                Radius.circular(40.0))),
                        filled: true,
                        hintText: "time".tr,
                        hintStyle: TextStyle(
                            fontFamily: themeFontLight,
                            color: AppColors.greyThemeClr,
                            fontSize: 16.0)),
                    onTap: () {
                      FocusScope.of(context).requestFocus(new FocusNode());
                      showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      ).then((value) {
                        setState(() {
                          foodTimeInputController.text = value!.format(context);
                        });
                      });
                    },
                    // controller: TextEditingController(text: selectedTime.format(context)),
                  ),

                  SizedBox(height: 40),

                  SizedBox(
                      width: FrameSize.screenWidth,
                      height: FrameSize.screenHeight / 14,
                      child: hPetsElevatedButton(
                          "save".tr, AppColors.appThemeClr,AppColors.whiteThemeClr, 40, themeFontBold, () {
                        if (_formKey.currentState!.validate()) {
                          print("Validated");
                          var foodName = foodNameInputController.text;
                          var amonutFood = amountFoodInputController.text;
                          var foodDate = foodDateInputController.text;
                          var foodTime = foodTimeInputController.text;


                          Navigator.pop(context);

                          addNutrition(foodName, amonutFood, foodTime, foodDate,
                              widget.pet!.pet_id!, widget.pet!.pet_name!);
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

  Future<void> addNutrition(String foodName, String amonutFood, String foodTime,
      String foodDate, String pet_id, String pet_name) async {
    // await FirebaseFirestore.instance
    //     .collection('Pets')
    //     .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid);


    var info = HashMap<String, dynamic>();
    info["food_name"] = foodName.basHarfleriBuyut();
    info["amount_of_food"] = amonutFood;
    info["food_date"] = foodDate;
    info["food_time"] = foodTime.basHarfleriBuyut();
    info["food_id"] = "";
    info["pet_id"] = pet_id;
    info["pet_name"] = pet_name;


    nutritionPets.push().set(info);
  }

}
