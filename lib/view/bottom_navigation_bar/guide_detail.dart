import 'package:flutter/material.dart';
import 'package:hpets/core/constants/colors.dart';
import 'package:hpets/core/responsive/frame_size.dart';

import '../../core/components/widgets/widgets.dart';

class GuideDetailPage extends StatelessWidget {
  late final int index;

  GuideDetailPage({required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: hpetsAppBar(context, true, "hPETS", false),
      body: Container(
        color: AppColors.whiteThemeClr,

        width: FrameSize.screenWidth,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [

                Builder(
                  builder: (BuildContext context) {
                    switch (index) {
                      case 0:
                        break;
                    }
                    return guideDetailContainer(index);
                    //     ?
                    // Container(
                    //   // color: Color(0xffE7D1D1).withOpacity(0.5),
                    //     color: Colors.white,
                    //     child: Text("Her cavnlı varlık gibi köpekler de, yaşamlarını sağlıklı sürdürebilmek için, belirli ortam ve koşullara gereksinme duyar.Barındıkları yerin sağlıklı yaşamalarına elverişli olup olmadığından tutun, gereksindikleri besin türü ve oranının karşılanıp karşılanmaması, temizlik ve bakımlarının yapılıp yapılmaması, hareket etme ve dolaşma olanağı bulup bulmamalarına değin pek çok etken, sağlıkları üstünde tesirler yaratır.Köpek barınağının bakım ve temizliğiKöpek barınağının sadece sağlık koşullarına ideal oluşu yeterli değildir. kullanılan her konut gibi köpek kulübesi de vakit içerisinde kirlenir, aşınır. bakım ve temizlik gerektirir. daha önce de değindik, kullanma ve bakım açısından köpek kulübelerinin yeri büyük önem taşır. kulübe, köpeğin döküntü ve artıklarının ev halkını, eve gidip geleni rahatsız etmeyeceği kadar eve uzak, bakımının kolaylıkla yapılabileceği kadar yakın olmalıdır.Köpeğin kulübesi her gün temizlenmelidir.Köpeğin minderi her gün dışarı alınmalı, silkelenmeli ve havalandırmalıdır.Kulübenin içi, tüy artıklarından, döküntülerden süpürülerek temizlenmeli, parazit bulunup bulunmadığı denetlenmelidir.")
                    //
                    //
                    //
                    //
                    // )
                    //     : index == 1
                    //     ? Text(
                    //   "Dog",
                    //   style: TextStyle(
                    //       fontFamily:
                    //       themeFontRegular,
                    //       fontSize: 18),
                    // )
                    //     : index == 2
                    //     ? Text(
                    //   "Fish",
                    //   style: TextStyle(
                    //       fontFamily:
                    //       themeFontRegular,
                    //       fontSize: 18),
                    // )
                    //     : index == 3
                    //     ? Text(
                    //   "Rabbit",
                    //   style: TextStyle(
                    //       fontFamily:
                    //       themeFontRegular,
                    //       fontSize: 18),
                    // )
                    //     : index == 4
                    //     ? Text(
                    //   "Bird",
                    //   style: TextStyle(
                    //       fontFamily:
                    //       themeFontRegular,
                    //       fontSize:
                    //       18),
                    // )
                    //     : index == 5
                    //     ? Text(
                    //   "Turtle",
                    //   style: TextStyle(
                    //       fontFamily:
                    //       themeFontRegular,
                    //       fontSize:
                    //       18),
                    // )
                    //     : index == 6
                    //     ? Text(
                    //   "Hamster",
                    //   style: TextStyle(
                    //       fontFamily:
                    //       themeFontRegular,
                    //       fontSize:
                    //       18),
                    // )
                    //     : index == 7
                    //     ? Text(
                    //   "Horse",
                    //   style:
                    //   TextStyle(fontFamily: themeFontRegular, fontSize: 18),
                    // )
                    //     : Text(
                    //     "");
                  },
                ),



                // SizedBox(
                //     width: FrameSize.screenWidth/2.5,
                //     child: Image.asset("assets/images/guide_image_$index.png")),
                // Text("This is ${index}"),

              ],
            ),
          ),
        ),
      ),

    );
  }
}
