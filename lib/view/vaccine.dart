import 'package:flutter/material.dart';
import 'package:hpets/core/constants/colors.dart';

import '../core/components/widgets/widgets.dart';
import '../core/constants/fonts.dart';
import '../core/responsive/frame_size.dart';

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
                    Text("Vaccines",style: TextStyle(fontFamily: themeFontSemiBold,fontSize: 22),),

                    GestureDetector(
                        onTap: (){

                          // Aşı ekleme modalı açılacak. Veya yeni bir sayfaya yönlendirilecek
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
