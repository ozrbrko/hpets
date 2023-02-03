import 'package:flutter/material.dart';

import '../core/components/widgets/widgets.dart';
import '../core/constants/colors.dart';
import '../core/constants/fonts.dart';
import '../core/responsive/frame_size.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({Key? key}) : super(key: key);

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  @override
  Widget build(BuildContext context) {

    FrameSize.init(context: context);


    return Scaffold(

        appBar: hpetsAppBar(context),

        body: Container(

          color: AppColors.whiteThemeClr,
          width: FrameSize.screenWidth,

          child: Padding(
            padding: const EdgeInsets.all(20.0),
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
                          Navigator.pushNamed(context, '/addnewpet');
                        },
                        child: Icon(Icons.add_box,color: AppColors.appThemeClr,size: 40,)),

                  ],
                ),

                Divider(),

              ],
            ),
          ),

        ));
  }
}
