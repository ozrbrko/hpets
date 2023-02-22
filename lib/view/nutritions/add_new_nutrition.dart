import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hpets/core/components/widgets/widgets.dart';
import 'package:hpets/core/responsive/frame_size.dart';
import 'package:hpets/core/services/firebase_services.dart';
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

  var refPets = FirebaseDatabase.instance.ref().child("pets_table").child(Config.token);
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

                  Config.DateTextFormField(context, foodDateInputController),

                  SizedBox(height: 12,),

                  Config.TimeTextFormField(context, foodTimeInputController),

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

                          NutritionService.addNutrition(foodName, amonutFood, foodTime, foodDate, widget.pet!.pet_id!, widget.pet!.pet_name!);
                          // addNutrition(foodName, amonutFood, foodTime, foodDate, widget.pet!.pet_id!, widget.pet!.pet_name!);
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
}