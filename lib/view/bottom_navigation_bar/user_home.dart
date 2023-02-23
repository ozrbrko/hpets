import 'dart:collection';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hpets/core/components/widgets/cards.dart';
import 'package:hpets/core/components/widgets/widgets.dart';
import 'package:hpets/core/constants/fonts.dart';
import 'package:hpets/core/constants/images.dart';
import 'package:hpets/core/extension/string_extension.dart';
import 'package:hpets/core/responsive/frame_size.dart';
import 'package:hpets/main.dart';
import 'package:hpets/view/bottom_navigation_bar/pet_detail.dart';
import '../../core/components/build_circular_indicator.dart';
import '../../core/constants/colors.dart';
import '../../core/model/pets.dart';
import '../../core/utils/config.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({Key? key}) : super(key: key);

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // var refPets = FirebaseDatabase.instance.ref().child("pets_table");
  var refPets = FirebaseDatabase.instance.ref().child("pets_table").child(Config.token);


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    logger.i("user id: ${Config.token} ve auth id: ${_auth.currentUser!.uid}");
    // addPet();
  }

  @override
  Widget build(BuildContext context) {
    FrameSize.init(context: context);

    return Scaffold(
      appBar: hpetsAppBar(context, false, "hPETS", true),
      body: SingleChildScrollView(
        child: Container(
          height: FrameSize.screenHeight,
          color: AppColors.whiteThemeClr,
          width: FrameSize.screenWidth,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                cardContainerDefault(FrameSize.screenHeight/5),
                SizedBox(
                  height: 45,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "my_pets".tr,

                      style: TextStyle(
                          fontFamily: themeFontSemiBold, fontSize: 22),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/addnewpet');
                        },
                        child: Icon(
                          Icons.add_box,
                          color: AppColors.appThemeClr,
                          size: 40,
                        )),
                  ],
                ),
                Divider(),

                SingleChildScrollView(

                  child: Container(
                    height: FrameSize.screenHeight/2.1,
                    child: StreamBuilder<DatabaseEvent>(
                      stream: refPets.onValue,
                      builder: (context, event) {
                        if (event.hasData) {
                          var petList = <Pets>[];

                          var cameValue = event.data!.snapshot.value as dynamic;

                          if (cameValue != null) {
                            cameValue.forEach((key, nesne) {
                              var camePet = Pets.fromJson(key, nesne);
                              petList.add(camePet);
                            });
                          }
                          if(petList.length!=0){
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 58.0),
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: petList.length,
                                itemBuilder: (context, indeks) {

                                  var pet = petList[indeks];

                                  if (!Config.petListConfig.contains(pet.pet_name)) {
                                    Config.petListConfig.add(pet.pet_name);
                                  }
                                  // Config.petListConfig = petList;

                                  return GestureDetector(
                                    onTap: () {

                                      logger.i("{${petList[indeks].pet_name.toString()} tıklandı");
                                      // Navigator.pushNamed(context, "/petdetail");
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => PetDetailPage(pet:pet)));
                                    },
                                    child: Column(
                                      children: [
                                        Card(
                                          color: Color(0xffE6E6E6),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                          ),
                                          child: Container(
                                            height: 64,
                                            width: FrameSize.screenWidth,
                                            child: Padding(
                                              padding: const EdgeInsets.all(15.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Config.petImage(pet.pet_type!),

                                                  Center(
                                                    child: Container(
                                                      // color: Colors.red,
                                                      width: FrameSize.screenWidth/1.9,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                        children: [

                                                          Text(
                                                            overflow: TextOverflow.ellipsis,

                                                            pet.pet_name!,
                                                            style: TextStyle(
                                                                color: AppColors.appThemeClr),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  IconButton(
                                                    icon: Icon(
                                                      Icons.info_outline_rounded,
                                                      color: AppColors.appThemeClr,
                                                    ),
                                                    onPressed: () {
                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => PetDetailPage(pet:pet)));

                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                  );
                                },
                              ),
                            );
                          } else{
                            return  Center(child: Text("there_is_no".tr,style: TextStyle(fontSize: 17,fontFamily: themeFontLight),));
                          }

                        } else {
                          return BuildCircularIndicatorWidget();
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> deletePet(String pet_name, String pet_id, String pet_age,
      String pet_race, String pet_gender, String pet_type) async {
    refPets.child("KEY").remove();
  }
}
