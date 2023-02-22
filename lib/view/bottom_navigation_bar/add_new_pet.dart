import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hpets/core/components/widgets/widgets.dart';
import 'package:hpets/core/responsive/frame_size.dart';
import 'package:hpets/core/services/firebase_services.dart';
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

  var refPets = FirebaseDatabase.instance.ref().child("pets_table").child(Config.token);

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
      appBar: hpetsAppBar(context, true, "new_pet".tr,false),
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


                  hPetsTextFormField("name".tr, petNameInputController, "name_required".tr, TextInputType.text, false, "false"),
                  SizedBox(height: 12,),

                  Config.DropdownFormFieldPet(petTypeInputController),

                  SizedBox(height: 12,),

                  Config.DropdownFormFieldGender(petGenderInputController),


                  // hPetsTextFormField("Gender", petGenderInputController, "required", TextInputType.text, false, "false"),
                  SizedBox(height: 12,),
                  hPetsTextFormField("race".tr, petRaceInputController, "race_required".tr, TextInputType.text, false, "false"),
                  SizedBox(height: 12,),
                  hPetsTextFormField("age".tr, petAgeInputController, "age_required".tr, TextInputType.number, false, "false"),

                  SizedBox(height: 40),

                  SizedBox(
                      width: FrameSize.screenWidth,
                      height: FrameSize.screenHeight / 14,
                      child: hPetsElevatedButton("save".tr, AppColors.appThemeClr,AppColors.whiteThemeClr, 40, themeFontBold, () {

                        if (_formKey.currentState!.validate())
                        {
                          print("Validated");
                          var petAge = petAgeInputController.text;
                          var petName = petNameInputController.text;
                          var petGender = petGenderInputController.text;
                          var petRace = petRaceInputController.text;
                          var petType = petTypeInputController.text;

                          PetService.addPet(petName, Config.generateRandomId().toString(), petAge, petRace, petGender, petType, Config.token);
                          // addPet(petName,Config.generateRandomId().toString(), petAge, petRace, petGender, petType,Config.token);

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
}