import 'dart:collection';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hpets/core/components/widgets/widgets.dart';
import 'package:hpets/core/responsive/frame_size.dart';
import 'package:hpets/core/utils/config.dart';
import 'package:hpets/main.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/fonts.dart';

class AddNewPet extends StatefulWidget {
  const AddNewPet({Key? key}) : super(key: key);

  @override
  State<AddNewPet> createState() => _AddNewPetState();
}

class _AddNewPetState extends State<AddNewPet> {

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
  TextEditingController  petColorInputController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String? selectedValue;


  @override
  Widget build(BuildContext context) {

    FrameSize.init(context: context);

    return Scaffold(
      appBar: hpetsAppBar(context, true, "New Pet",false),
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
                  Text("Let's add your new pet friend's archive",style: TextStyle(fontSize: 30,fontFamily: themeFontBold,color: AppColors.appThemeClr),),
                  // Text("Fill in your details to get add.",style: TextStyle(fontSize: 16,fontFamily: themeFontSemiBold,color: AppColors.blackThemeClr),),

                  SizedBox(height: 15,),


                  hPetsTextFormField("Name", petNameInputController, "Name is required !", TextInputType.text, false, "false"),
                  SizedBox(height: 12,),

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
                    hint: const Text(
                      'Select Your Pet',
                      style: TextStyle(fontSize: 16),
                    ),

                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),

                    items: petItems
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
                        return '     Please select pet !';
                      }
                    },
                    onChanged: (value) {
                      logger.i(value);
                      petTypeInputController.text = value!;


                    },
                    onSaved: (value) {
                      selectedValue = value.toString();
                      logger.i(value);
                      petTypeInputController.text = value!;

                    },
                  ),

                  // hPetsTextFormField("Type", petTypeInputController, "required", TextInputType.text, false, "false"),

                  SizedBox(height: 12,),

                  DropdownButtonFormField2(

                    decoration: InputDecoration(

                        contentPadding:
                        const EdgeInsets.symmetric(vertical: 17, horizontal: 15),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(40.0))),
                        filled: true,
                        hintText: "Select Gender",


                        hintStyle: TextStyle(
                            fontFamily: themeFontLight, color: AppColors.greyThemeClr, fontSize: 14.0)),
                    isExpanded: true,
                    hint: const Text(
                      'Select Gender',
                      style: TextStyle(fontSize: 16),
                    ),

                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),

                    items: genderItems
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
                        return '     Please select gender !';
                      }
                    },
                    onChanged: (value) {
                      logger.i(value);
                      petGenderInputController.text = value!;


                    },
                    onSaved: (value) {
                      selectedValue = value.toString();
                      logger.i(value);
                      petGenderInputController.text = value!;

                    },
                  ),

                  // hPetsTextFormField("Gender", petGenderInputController, "required", TextInputType.text, false, "false"),
                  SizedBox(height: 12,),
                  hPetsTextFormField("Race", petRaceInputController, "Race is required !", TextInputType.text, false, "false"),
                  SizedBox(height: 12,),

                  hPetsTextFormField("Age", petAgeInputController, "Age is required !", TextInputType.number, false, "false"),


                  // hPetsTextFormField("Birthdate", petBirthdateInputController, "required", TextInputType.text, false, "false"),
                  // SizedBox(height: 12,),
                  // hPetsTextFormField("Color", petColorInputController, "Color is required !", TextInputType.text, false, "false"),
                  SizedBox(height: 40),

                  SizedBox(
                      width: FrameSize.screenWidth,
                      height: FrameSize.screenHeight / 14,
                      child: hPetsElevatedButton("Save", AppColors.appThemeClr, 40, themeFontBold, () {

                        if (_formKey.currentState!.validate())
                        {
                          print("Validated");
                          var petAge = petAgeInputController.text;
                          var petName = petNameInputController.text;
                          var petGender = petGenderInputController.text;
                          var petRace = petRaceInputController.text;
                          var petType = petTypeInputController.text;

                          addPet(petName,Config.generateRandomId().toString(), petAge, petRace, petGender, petType,Config.token);

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

  Future<void> addPet(String pet_name, String pet_id, String pet_age, String pet_race, String pet_gender, String pet_type,String user_id) async {
    // await FirebaseFirestore.instance
    //     .collection('Pets')
    //     .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid);


    var info = HashMap<String,dynamic>();
    info["pet_name"] = pet_name;
    info["pet_id"] = pet_id;
    info["pet_age"] = pet_age;
    info["pet_race"] = pet_race;
    info["pet_gender"] = pet_gender;
    info["pet_type"] = pet_type;
    info["user_id"] = user_id;
    info["pet_key"] = "";

    logger.i(user_id);
    logger.e(_auth.currentUser!.uid);
    refPets.push().set(info);

  }


}

final List<String> genderItems = [
  'He',
  'She',
];

final List<String> petItems = [
  'Dog',
  'Cat',
  'Bird',
  'Fish',
  'Turtle',
  'Horse'
];



