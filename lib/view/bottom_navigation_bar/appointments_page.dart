import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hpets/core/model/appointments.dart';
import 'package:hpets/core/utils/alert_dialog.dart';
import 'package:hpets/view/bottom_navigation_bar/add_new_appointment.dart';

import '../../core/components/widgets/widgets.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/fonts.dart';
import '../../core/responsive/frame_size.dart';
import '../../core/utils/config.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({Key? key}) : super(key: key);

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {

  var refPets = FirebaseDatabase.instance.ref().child("pets_table").child(
      Config.token);
  var appointmentPets = FirebaseDatabase.instance.ref().child("pets_table").child(
      "appointments").child(Config.token);

  var color =true;
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
                      Text("Appointments",style: TextStyle(fontFamily: themeFontSemiBold,fontSize: 22),),

                      GestureDetector(
                          onTap: (){

                            // Randevu modal açılacak. Randevu bilgileri ile birlikte kayıt oluşturulacak.
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> AddNewAppointment()));
                          },
                          child: Icon(Icons.add_box,color: AppColors.appThemeClr,size: 40,)),

                    ],
                  ),

                  Divider(),

                  SingleChildScrollView(
                    child: Container(

                      height: FrameSize.screenHeight/1.75,
                      child: StreamBuilder<DatabaseEvent>(

                        stream: appointmentPets.onValue,
                        builder: (context, event){
                          if (event.hasData) {
                            var appointmentList = <Appointments>[];
                            var cameValue = event.data!.snapshot.value as dynamic;

                            if (cameValue != null) {
                              cameValue.forEach((key, nesne){

                                var cameAppointment = Appointments.fromJson(key, nesne);
                                appointmentList.add(cameAppointment);

                              });
                            }

                            return Padding(
                              padding: const EdgeInsets.only(bottom: 58.0),
                              child: ListView.builder(

                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: appointmentList.length,
                                  itemBuilder: (context,indeks) {
                                    var appointment = appointmentList[indeks];

                                    return
                                    GestureDetector(
                                      onTap: (){

                                        // logger.i("{${nutritionList[indeks].food_name.toString()} tıklandı");
                                        // logger.e(nutrition.pet_id);
                                        // logger.e(widget.pet!.pet_id!);
                                        // logger.e(nutrition.food_id);

                                        // Navigator.pushNamed(context, "/petdetail");
                                        // Navigator.

                                        AlertDialogFunctions.infoAppointmentDetail(context, appointment.veterinary_info, appointment.pet_name, appointment.appointment_date, appointment.appointment_time, appointment.veterinary_address, appointment.appointment_id);
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
                                                height: 110,
                                                width: FrameSize.screenWidth,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(15.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      // Image.asset(pet.pet_type=="Dog"? "assets/images/guide_image_1.png" : pet.pet_type=="Cat"? "assets/images/guide_image_0.png" : pet.pet_type=="Fish"? "assets/images/guide_image_2.png" :pet.pet_type=="Rabbit"? "assets/images/guide_image_3.png": pet.pet_type=="Bird"? "assets/images/guide_image_4.png": pet.pet_type=="Turtle"? "assets/images/guide_image_5.png": pet.pet_type=="Hamster"? "assets/images/guide_image_6.png": pet.pet_type=="Horse"? "assets/images/guide_image_7.png": ""),
                                                      // IconButton(
                                                      //   icon: Icon(
                                                      //     Icons.info_outline_rounded,
                                                      //     color: AppColors.appThemeClr,
                                                      //   ),
                                                      //   onPressed: () {},
                                                      // ),

                                                      Column(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            "Pet Name: ${appointment.pet_name}",
                                                            style: TextStyle(
                                                                color: AppColors.appThemeClr),
                                                          ),
                                                          SizedBox(height: 5,),
                                                          Text(
                                                            "Veterinary: ${appointment.veterinary_info}",
                                                            style: TextStyle(
                                                                color: AppColors.appThemeClr),
                                                          ),

                                                          SizedBox(height: 5,),

                                                          Text(
                                                            "Veterinary Address: ${appointment.veterinary_address}",
                                                            style: TextStyle(
                                                                color: AppColors.appThemeClr),
                                                          ),

                                                          SizedBox(height: 5,),


                                                          Text(
                                                            "Date: ${appointment.appointment_date!} / ${appointment.appointment_time!}",
                                                            style: TextStyle(
                                                                color: AppColors.appThemeClr),
                                                          ),




                                                        ],
                                                      ),

                                                      // Column(
                                                      //   mainAxisAlignment:
                                                      //   MainAxisAlignment.center,
                                                      //   children: [
                                                      //     Text("${nutrition.food_date}", style: TextStyle(
                                                      //         color: AppColors.appThemeClr),),
                                                      //     SizedBox(height: 5,),
                                                      //
                                                      //     Text("${nutrition.food_time}", style: TextStyle(
                                                      //         color: AppColors.appThemeClr),),
                                                      //
                                                      //   ],
                                                      // ),

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
                                  }



                              ),
                            );

                          } else {
                            return Center();
                          }
                        },

                      ),


                    ),
                  )


                ],
              ),
            ),
          ),

        ));
  }
}
