import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hpets/core/model/appointments.dart';
import 'package:hpets/core/utils/alert_dialog.dart';
import 'package:hpets/view/bottom_navigation_bar/add_new_appointment.dart';
import '../../core/other/build_circular_indicator.dart';
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
          height: FrameSize.screenHeight,

          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [

                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("appointments".tr,style: TextStyle(fontFamily: themeFontSemiBold,fontSize: 22),),

                      GestureDetector(
                          onTap: (){

                            // Yeni Randevu Ekleme ->

                            Navigator.push(context, MaterialPageRoute(builder: (context)=> AddNewAppointment()));
                          },
                          child: Icon(Icons.add_box,color: AppColors.appThemeClr,size: 40,)),

                    ],
                  ),

                  Divider(),

                  SingleChildScrollView(
                    child: Container(

                      height: FrameSize.screenHeight/1.57,

                      // not: Randevu Listesi ->
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

                            if(appointmentList.length!=0){
                              return ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: appointmentList.length,
                                  itemBuilder: (context,indeks) {
                                    var appointment = appointmentList[indeks];

                                    return
                                      GestureDetector(
                                        onTap: (){
                                          // not: Randevu Detay Görüntüleme
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

                                                Container(
                                                  width: FrameSize.screenWidth,
                                                  height: 120,
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(15.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.spaceBetween,
                                                      children: [

                                                        Container(
                                                          width: FrameSize.screenWidth/1.7,
                                                          // color: Colors.red,
                                                          child: Column(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment.center,
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [

                                                              RichText(
                                                                text: TextSpan(children: <TextSpan>[
                                                                  TextSpan(
                                                                      text: "pet_name".tr,
                                                                      style: TextStyle(
                                                                          color: AppColors.appThemeClr,fontFamily: themeFontRegular)),
                                                                  TextSpan(
                                                                    text: " ${appointment.pet_name}",
                                                                    style: TextStyle(
                                                                        color: AppColors.appThemeClr,fontFamily: themeFontBold),

                                                                  ),
                                                                ]),
                                                              ),

                                                              SizedBox(height: 5,),

                                                              RichText(
                                                                text: TextSpan(children: <TextSpan>[
                                                                  TextSpan(
                                                                      text: "veterinary".tr,
                                                                      style: TextStyle(
                                                                          color: AppColors.appThemeClr,fontFamily: themeFontRegular)),
                                                                  TextSpan(
                                                                    text: " ${appointment.veterinary_info}".length > 18 ? '${" ${appointment.veterinary_info}".substring(0, 18)}...' : " ${appointment.veterinary_info}",

                                                                    style: TextStyle(
                                                                        color: AppColors.appThemeClr,fontFamily: themeFontBold),

                                                                  ),
                                                                ]),
                                                              ),

                                                              SizedBox(height: 5,),

                                                              RichText(
                                                                text: TextSpan(children: <TextSpan>[
                                                                  TextSpan(
                                                                      text: "address".tr,
                                                                      style: TextStyle(
                                                                          color: AppColors.appThemeClr,fontFamily: themeFontRegular)),
                                                                  TextSpan(
                                                                    text: " ${appointment.veterinary_address}".length > 23 ? '${" ${appointment.veterinary_address}".substring(0, 23)}...' : " ${appointment.veterinary_address}",
                                                                    style: TextStyle(
                                                                        color: AppColors.appThemeClr,fontFamily: themeFontBold),

                                                                  ),
                                                                ]),
                                                              ),

                                                              SizedBox(height: 5,),

                                                              RichText(
                                                                text: TextSpan(children: <TextSpan>[
                                                                  TextSpan(
                                                                      text: "date".tr,
                                                                      style: TextStyle(
                                                                          color: AppColors.appThemeClr,fontFamily: themeFontRegular)),
                                                                  TextSpan(
                                                                    text: " ${appointment.appointment_date} / ",
                                                                    style: TextStyle(
                                                                        color: AppColors.appThemeClr,fontFamily: themeFontBold),

                                                                  ),
                                                                  TextSpan(
                                                                    text: " ${appointment.appointment_time}",
                                                                    style: TextStyle(
                                                                        color: AppColors.appThemeClr,fontFamily: themeFontBold),
                                                                  ),
                                                                ]),
                                                              ),
                                                            ],
                                                          ),
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
                                                          onPressed: () {
                                                            AlertDialogFunctions.infoAppointmentDetail(context, appointment.veterinary_info, appointment.pet_name, appointment.appointment_date, appointment.appointment_time, appointment.veterinary_address, appointment.appointment_id);

                                                          },
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
                              );

                            }else{
                              return  Center(child: Text("there_is_no".tr,style: TextStyle(fontSize: 17,fontFamily: themeFontLight),));

                            }

                          } else {
                            return BuildCircularIndicatorWidget();
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
