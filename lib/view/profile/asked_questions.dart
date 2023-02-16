import 'package:flutter/material.dart';
import 'package:hpets/core/components/widgets/widgets.dart';
import 'package:hpets/core/constants/colors.dart';
import 'package:hpets/core/constants/fonts.dart';
import 'package:hpets/core/responsive/frame_size.dart';
import 'package:rounded_expansion_tile/rounded_expansion_tile.dart';

class AskedQuestionsPage extends StatefulWidget {
  const AskedQuestionsPage({Key? key}) : super(key: key);

  @override
  State<AskedQuestionsPage> createState() => _AskedQuestionsPageState();
}

class _AskedQuestionsPageState extends State<AskedQuestionsPage> {


  @override
  Widget build(BuildContext context) {
    FrameSize.init(context: context);


    return Scaffold(

        appBar: hpetsAppBar(context,true,"Asked Questions",false),
        body: Container(

          width: FrameSize.screenWidth,
          height: FrameSize.screenHeight,

          color: Colors.white,

          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Card(
                    color: AppColors.whiteThemeClr.withOpacity(0.8),
                    shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                    child: RoundedExpansionTile(
                      leading: Icon(Icons.question_answer_outlined, color: AppColors.appThemeClr,),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)),
                      title: Text('hPETS uygulaması Nedir ve Nasıl Kullanılır ?',style: TextStyle(fontSize: 15,fontFamily: themeFontRegular,color: AppColors.appThemeClr),),
                      trailing: Icon(Icons.keyboard_arrow_down),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            height: 200,

                            child: Center(
                              child: Text(
                                'hPETS evcil hayvan sahiplerinin ve veterinerlerin ortak kullanabileceği bir mobil uygulamadır.Evcil hayvan sahipleri bu uygulama sayesinde evcil hayvanlarının önemli bilgilerini kaydedebilir. (Hastalık, mama saati, hastalık belirtileri, aşı takvimi, duygu değişimleri).\nUygulama içerisinde yer alan evcil hayvan rehberi sayesinde doğru bilinen yanlışlar hakkında bilgi sahibi olunabilir. ',
                                style: TextStyle(color: AppColors.blackThemeClr),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Card(
                    color: AppColors.whiteThemeClr.withOpacity(0.8),
                    shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                    child: RoundedExpansionTile(
                      leading: Icon(Icons.question_answer_outlined, color: AppColors.appThemeClr,),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)),
                      title: Text('Yeni evcil hayvan nasıl eklenir ?',style: TextStyle(fontSize: 15,fontFamily: themeFontRegular,color: AppColors.appThemeClr),),
                      trailing: Icon(Icons.keyboard_arrow_down),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            height: 100,

                            child: Center(
                              child: Text(
                                'Kullanıcı anasayfasında bulunan "+" butonu ile açılan formda gerekli bilgileri doldurarak yeni bir evcil hayvan ekleyebilirsiniz.',
                                style: TextStyle(color: AppColors.blackThemeClr),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Card(
                    color: AppColors.whiteThemeClr.withOpacity(0.8),
                    shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                    child: RoundedExpansionTile(
                      leading: Icon(Icons.question_answer_outlined, color: AppColors.appThemeClr,),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)),
                      title: Text('Evcil hayvan detay bilgileri nerede bulunur. Yeni bilgiler nasıl eklenir ?',style: TextStyle(fontSize: 15,fontFamily: themeFontRegular,color: AppColors.appThemeClr),),
                      trailing: Icon(Icons.keyboard_arrow_down),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            height: 150,
                            child: Center(
                              child: Text(
                                'Ana sayfada bulunan evcil hayvan listesinde gitmek istediğiniz evcil hayvana tıklayarak detay bilgilerine erişebilirsiniz. Açılan detay sayfasında "Aşılar", "Hastalıklar", "Notlar" ve "Beslenme" butonlarından görüntüleme veya yeni bilgi eklemek istediğiniz alanı seçebilirsiniz.',
                                style: TextStyle(color: AppColors.blackThemeClr),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Card(
                    color: AppColors.whiteThemeClr.withOpacity(0.8),
                    shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                    child: RoundedExpansionTile(
                      leading: Icon(Icons.question_answer_outlined, color: AppColors.appThemeClr,),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)),
                      title: Text('Yeni randevu nasıl oluşturulur ?',style: TextStyle(fontSize: 15,fontFamily: themeFontRegular,color: AppColors.appThemeClr),),
                      trailing: Icon(Icons.keyboard_arrow_down),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            height: 100,

                            child: Center(
                              child: Text(
                                'Uygulama anasayfasında alt tarafta bulunan yönlendirme çubuğu ile randevular sekmesine tıklayın. Açılan sayfada "+" butonuna tıklayarak yeni randevu bilgisi oluşturabilirsiniz.',
                                style: TextStyle(color: AppColors.blackThemeClr),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Card(
                    color: AppColors.whiteThemeClr.withOpacity(0.8),
                    shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                    child: RoundedExpansionTile(
                      leading: Icon(Icons.question_answer_outlined, color: AppColors.appThemeClr,),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)),
                      title: Text('Randevu bilgileri nasıl güncellenir. Randevular nasıl silinir ?',style: TextStyle(fontSize: 15,fontFamily: themeFontRegular,color: AppColors.appThemeClr),),
                      trailing: Icon(Icons.keyboard_arrow_down),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            height: 80,

                            child: Center(
                              child: Text(
                                'Randevular sayfasında güncellemek veya silmek istediğiniz randevuya tıklayın. Açılan pencere üzerinden silme ve güncelleme işlemlerinizi tamamlayabilirsiniz.',
                                style: TextStyle(color: AppColors.blackThemeClr),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  Card(
                    color: AppColors.whiteThemeClr.withOpacity(0.8),
                    shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                    child: RoundedExpansionTile(
                      leading: Icon(Icons.question_answer_outlined, color: AppColors.appThemeClr,),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)),
                      title: Text('Eklenen evcil hayvan detay bilgileri nasıl güncellenir veya silinir ?',style: TextStyle(fontSize: 15,fontFamily: themeFontRegular,color: AppColors.appThemeClr),),
                      trailing: Icon(Icons.keyboard_arrow_down),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            height: 100,

                            child: Center(
                              child: Text(
                                'İlgili detay sayfasında güncellemek veya silmek istediğiniz liste elemanına tıklayın. Açılan pencere üzerinden silme ve güncelleme işlemlerinizi tamamlayabilirsiniz.',
                                style: TextStyle(color: AppColors.blackThemeClr),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  Card(
                    color: AppColors.whiteThemeClr.withOpacity(0.8),
                    shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                    child: RoundedExpansionTile(
                      leading: Icon(Icons.question_answer_outlined, color: AppColors.appThemeClr,),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)),
                      title: Text('Evcil hayvan rehberi nerede bulunur ?',style: TextStyle(fontSize: 15,fontFamily: themeFontRegular,color: AppColors.appThemeClr),),
                      trailing: Icon(Icons.keyboard_arrow_down),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            height: 100,

                            child: Center(
                              child: Text(
                                'Uygulama anasayfasında alt tarafta bulunan yönlendirme çubuğu ile rehber sekmesine tıklayın. Açılan sayfa üzerinden görüntülemek istediğiniz evcil hayvan ile ilgili butonu seçerek detaylı bilgileri görüntüleyebilirsiniz.',
                                style: TextStyle(color: AppColors.blackThemeClr),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),



                ],
              ),
            ),
          ),

        ));
  }
}
