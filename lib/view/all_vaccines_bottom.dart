import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hpets/core/constants/colors.dart';

import '../core/components/widgets/widgets.dart';
import '../core/constants/fonts.dart';
import '../core/model/vaccines.dart';
import '../core/responsive/frame_size.dart';
import '../core/utils/alert_dialog.dart';

class VaccinePage extends StatefulWidget {
  const VaccinePage({Key? key}) : super(key: key);

  @override
  State<VaccinePage> createState() => _VaccinePageState();
}

class _VaccinePageState extends State<VaccinePage> {

  @override
  Widget build(BuildContext context) {

    FrameSize.init(context: context);


    return Scaffold(

        appBar: hpetsAppBar(context,false,"hPETS",true),

        body: Container(

          color: AppColors.whiteThemeClr,
          width: FrameSize.screenWidth,

          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [

                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("All Vaccines",style: TextStyle(fontFamily: themeFontSemiBold,fontSize: 22),),

                      // GestureDetector(
                      //     onTap: (){
                      //
                      //       // Aşı ekleme modalı açılacak. Veya yeni bir sayfaya yönlendirilecek
                      //       Navigator.pushNamed(context, '/addnewpet');
                      //     },
                      //     child: Icon(Icons.add_box,color: AppColors.appThemeClr,size: 40,)),

                    ],
                  ),

                  Divider(),

                  SingleChildScrollView(

                    child: Container(
                      height: FrameSize.screenHeight/1.75,
                      child: StreamBuilder<DatabaseEvent>(
                        stream: vaccinesPets.onValue,
                        builder: (context, event) {
                          if (event.hasData) {
                            var vaccineList = <Vaccines>[];

                            var cameValue = event.data!.snapshot.value as dynamic;

                            if (cameValue != null) {
                              cameValue.forEach((key, nesne) {
                                var cameNote = Vaccines.fromJson(key, nesne);
                                vaccineList.add(cameNote);
                                // Config.key = key;
                              });
                            }
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 58.0),
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: vaccineList.length,
                                itemBuilder: (context, indeks) {
                                  var vaccine = vaccineList[indeks];


                                 return

                                    GestureDetector(
                                      onTap: () {


                                        AlertDialogFunctions.infoVaccineDetail(context,vaccine.vaccine_name, vaccine.vaccine_date, vaccine.vaccine_time, vaccine.veterinary, vaccine.vaccine_id);                          // Navigator.pushNamed(context, "/petdetail");
                                        // Navigator.push(context, MaterialPageRoute(builder: (context) => PetDetailPage(pet:pet)));
                                      },
                                      child: Column(
                                        children: [
                                          Card(
                                              color: Color(0xffE6E6E6),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10.0),
                                              ),
                                              child:

                                              // note.pet_id==widget.pet!.pet_id!?

                                              Container(
                                                height: 94,
                                                width: FrameSize.screenWidth,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(15.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      // Image.asset(pet.pet_type=="Dog"? "assets/images/guide_image_1.png" : pet.pet_type=="Cat"? "assets/images/guide_image_0.png" : pet.pet_type=="Fish"? "assets/images/guide_image_2.png" :pet.pet_type=="Rabbit"? "assets/images/guide_image_3.png": pet.pet_type=="Bird"? "assets/images/guide_image_4.png": pet.pet_type=="Turtle"? "assets/images/guide_image_5.png": pet.pet_type=="Hamster"? "assets/images/guide_image_6.png": pet.pet_type=="Horse"? "assets/images/guide_image_7.png": ""),


                                                      Center(
                                                        child: Column(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text(
                                                              "Pet Name: ${vaccine.pet_name!}",
                                                              style: TextStyle(
                                                                  color: AppColors.appThemeClr),
                                                            ),
                                                            Text(
                                                              "Vaccine Name: ${vaccine.vaccine_name!}",
                                                              style: TextStyle(
                                                                  color: AppColors.appThemeClr),
                                                            ),
                                                            Text(
                                                              "Date: ${vaccine.vaccine_date!} / ${vaccine.vaccine_time!}",
                                                              style: TextStyle(
                                                                  color: AppColors.appThemeClr),
                                                            ),
                                                            Text(
                                                              "Veterinary: ${vaccine.veterinary!}",
                                                              style: TextStyle(
                                                                  color: AppColors.appThemeClr),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      IconButton(
                                                        icon: Icon(
                                                          Icons.info_outline_rounded,
                                                          color: AppColors.appThemeClr,
                                                        ),
                                                        onPressed: () {},
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            // :Container()
                                          ),

                                        ],
                                      ),
                                    );
                                },
                              ),
                            );
                          } else {
                            return Center();
                          }
                        },
                      ),
                    ),
                  ),


                ],
              ),
            ),
          ),

        ));
  }

}
