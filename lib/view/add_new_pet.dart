import 'package:flutter/material.dart';
import 'package:hpets/core/components/widgets/widgets.dart';
import 'package:hpets/core/responsive/frame_size.dart';
import 'package:hpets/core/utils/config.dart';

import '../core/constants/colors.dart';
import '../core/constants/fonts.dart';

class AddNewPet extends StatefulWidget {
  const AddNewPet({Key? key}) : super(key: key);

  @override
  State<AddNewPet> createState() => _AddNewPetState();
}

class _AddNewPetState extends State<AddNewPet> {

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
  TextEditingController  petBirthdateInputController = TextEditingController();
  TextEditingController  petColorInputController = TextEditingController();

  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

    FrameSize.init(context: context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(
          "New Pet",
          style: TextStyle(color: AppColors.whiteThemeClr),
        ),
        backgroundColor: AppColors.appThemeClr,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
      ),
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


                  hPetsTextFormField("Name", petNameInputController, "required", TextInputType.text, false, "false"),
                  SizedBox(height: 12,),

                  DropdownButtonFormField<String>(

                    decoration: InputDecoration(

                        contentPadding:
                        const EdgeInsets.symmetric(vertical: 19, horizontal: 19),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(40.0))),
                        filled: true,
                        hintText: "Select Type",


                        hintStyle: TextStyle(
                            fontFamily: themeFontLight, color: AppColors.greyThemeClr, fontSize: 14.0)),
                    value: "Dog",
                    items: _getOptionsType(),
                    onChanged: (value) {
                      print(value);
                      // handle value change
                    },
                  ),



                  // hPetsTextFormField("Type", petTypeInputController, "required", TextInputType.text, false, "false"),
                  SizedBox(height: 12,),
                  DropdownButtonFormField<String>(

                    decoration: InputDecoration(

                        contentPadding:
                        const EdgeInsets.symmetric(vertical: 19, horizontal: 19),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(40.0))),
                        filled: true,
                        hintText: "Select Type",


                        hintStyle: TextStyle(
                            fontFamily: themeFontLight, color: AppColors.greyThemeClr, fontSize: 14.0)),
                    value: "He",
                    items: _getOptionsGender(),
                    onChanged: (value) {
                      print(value);
                      // handle value change
                    },
                  ),
                  // hPetsTextFormField("Gender", petGenderInputController, "required", TextInputType.text, false, "false"),
                  SizedBox(height: 12,),
                  hPetsTextFormField("Race", petRaceInputController, "required", TextInputType.text, false, "false"),
                  SizedBox(height: 12,),

                  TextFormField(
                    controller: petBirthdateInputController,
                    decoration: InputDecoration(

                        contentPadding:
                        const EdgeInsets.symmetric(vertical: 19, horizontal: 19),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(40.0))),
                        filled: true,
                        hintText: "Birthdate",


                        hintStyle: TextStyle(
                            fontFamily: themeFontLight, color: AppColors.greyThemeClr, fontSize: 14.0)),
                    onTap: () async{
                      DateTime date = DateTime(1900);
                      FocusScope.of(context).requestFocus(new FocusNode());

                      date = (await showDatePicker(
                          context: context,
                          initialDate:DateTime.now(),
                          firstDate:DateTime(1900),
                          lastDate: DateTime(2100)))!;

                      petBirthdateInputController.text = date.toIso8601String();},),
                  // hPetsTextFormField("Birthdate", petBirthdateInputController, "required", TextInputType.text, false, "false"),
                  SizedBox(height: 12,),
                  hPetsTextFormField("Color", petColorInputController, "required", TextInputType.text, false, "false"),
                  SizedBox(height: 40),

                  SizedBox(
                      width: FrameSize.screenWidth,
                      height: FrameSize.screenHeight / 14,
                      child: hPetsElevatedButton("Kaydet", AppColors.appThemeClr, 40, themeFontBold, () => null))

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


 List<DropdownMenuItem<String>> _getOptionsType() {
return <String>['Dog', 'Cat', 'Bird', 'Fish', 'Turtle']
    .map((String value) {
return new DropdownMenuItem<String>(
value: value,
child: new Text(value),
);
})
    .toList();
}

List<DropdownMenuItem<String>> _getOptionsGender() {
  return <String>['He', 'She']
      .map((String value) {
    return new DropdownMenuItem<String>(
      value: value,
      child: new Text(value),
    );
  })
      .toList();
}
