import 'dart:collection';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hpets/core/components/widgets/widgets.dart';
import 'package:hpets/core/responsive/frame_size.dart';
import 'package:hpets/core/utils/config.dart';
import 'package:hpets/main.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/fonts.dart';
import '../../core/model/pets.dart';

class PetEdit extends StatefulWidget {
  Pets? pet;

  PetEdit({this.pet});
  @override
  State<PetEdit> createState() => _PetEditState();
}

class _PetEditState extends State<PetEdit> {

  // var refPets = FirebaseDatabase.instance.ref().child("pets_table");
  var refPets = FirebaseDatabase.instance.ref().child("pets_table").child(Config.token);

  // final databaseReference = FirebaseDatabase.instance.reference().child("pets_table");

  final FirebaseAuth _auth = FirebaseAuth.instance;
  var user =  FirebaseAuth.instance.currentUser;
  final String? uid = Config.token;


  final FirebaseDatabase database = FirebaseDatabase.instance;

  DateTime? selectedDate;
  @override
  initState() {
    super.initState();
    selectedDate = DateTime.now();
  }

  TextEditingController  petNameInputController = TextEditingController();
  TextEditingController  petTypeInputController = TextEditingController();
  TextEditingController  petGenderInputController = TextEditingController();
  TextEditingController  petRaceInputController = TextEditingController();
  TextEditingController  petAgeInputController = TextEditingController();


  final _formKey = GlobalKey<FormState>();
  String? selectedValue;


  @override
  Widget build(BuildContext context) {

    FrameSize.init(context: context);

    String petName = widget.pet!.pet_name!;
    String petType = widget.pet!.pet_type!;
    String petGender = widget.pet!.pet_gender!;
    String petRace = widget.pet!.pet_race!;
    String petAge = widget.pet!.pet_age!;



    return Scaffold(
      appBar: hpetsAppBar(context, true, "pet_edit".tr,false),
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
                  Text("add_new_pet".tr,style: TextStyle(fontSize: 30,fontFamily: themeFontBold,color: AppColors.appThemeClr),),
                  // Text("Fill in your details to get add.",style: TextStyle(fontSize: 16,fontFamily: themeFontSemiBold,color: AppColors.blackThemeClr),),

                  SizedBox(height: 15,),


                  hPetsTextFormField("${petName}", petNameInputController, "name_required".tr, TextInputType.text, false, "false"),
                  SizedBox(height: 12,),

                  DropdownFormFieldPet(petTypeInputController),

                  // hPetsTextFormField("Type", petTypeInputController, "required", TextInputType.text, false, "false"),

                  SizedBox(height: 12,),

                  DropdownFormFieldGender(petGenderInputController),

                  // hPetsTextFormField("Gender", petGenderInputController, "required", TextInputType.text, false, "false"),
                  SizedBox(height: 12,),
                  hPetsTextFormField("${petRace}", petRaceInputController, "race_required".tr, TextInputType.text, false, "false"),
                  SizedBox(height: 12,),

                  hPetsTextFormField("${petAge}", petAgeInputController, "age_required".tr, TextInputType.number, false, "false"),

                  // hPetsTextFormField("Birthdate", petBirthdateInputController, "required", TextInputType.text, false, "false"),
                  // SizedBox(height: 12,),
                  // hPetsTextFormField("Color", petColorInputController, "Color is required !", TextInputType.text, false, "false"),
                  SizedBox(height: 40),

                  SizedBox(
                      width: FrameSize.screenWidth,
                      height: FrameSize.screenHeight / 14,
                      child: hPetsElevatedButton("update".tr, AppColors.appThemeClr,AppColors.whiteThemeClr, 40, themeFontBold, () {

                        if (_formKey.currentState!.validate())
                        {
                          print("Validated");
                           petAge = petAgeInputController.text;
                           petName = petNameInputController.text;
                           petGender = petGenderInputController.text;
                           petRace = petRaceInputController.text;
                           petType = petTypeInputController.text;

                          updatePet(petName, petAge, petRace, petGender, petType);

                          return Navigator.pushNamed(context, '/bottomnav');

                          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("E-mail or password is wrong !"), ));
                        }
                        else
                        {
                          print("Not Validated");
                        }

                        logger.i("Kaydet Butonu Tıklandı.");
                      }))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updatePet(String pet_name, String pet_age, String pet_race, String pet_gender, String pet_type) async {
    // await FirebaseFirestore.instance
    //     .collection('Pets')
    //     .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid);

    var info = HashMap<String,dynamic>();
    info["pet_name"] = pet_name;
    info["pet_age"] = pet_age;
    info["pet_race"] = pet_race;
    info["pet_gender"] = pet_gender;
    info["pet_type"] = pet_type;
    info["pet_key"] = "";

    logger.e(_auth.currentUser!.uid);
    refPets.child(Config.petKey).update(info);

  }
}