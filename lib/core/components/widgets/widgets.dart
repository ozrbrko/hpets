import 'dart:io';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:hpets/core/constants/images.dart';
import '../../../main.dart';
import '../../constants/colors.dart';
import '../../constants/fonts.dart';
import '../../responsive/frame_size.dart';

List<File> imageList = [];
List<String> imageListPath = [];
String? selectedValue;

TextFormField hPetsTextFormField(
    String hinttext,
    TextEditingController txtcontroller,
    String required,
    TextInputType textType,
    bool obscure,
    String forValidation) {
  if (forValidation == "mail") {
    return TextFormField(
      controller: txtcontroller,
      onSaved: (deger) => txtcontroller.text = deger!,
      keyboardType: textType,

      // key: key1,

      validator: MultiValidator([
        RequiredValidator(errorText: required),
        EmailValidator(errorText: 'Please write a valid email address !'),
      ]),
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 17, horizontal: 32),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(40.0))),
          filled: true,
          hintText: hinttext,
          hintStyle: TextStyle(
              fontFamily: themeFontLight,
              color: AppColors.greyThemeClr,
              fontSize: 16.0)),

      obscureText: obscure,
    );
  } else if (forValidation == "password") {
    return TextFormField(
      controller: txtcontroller,
      onSaved: (deger) => txtcontroller.text = deger!,
      keyboardType: textType,

      // key: key1,

      validator: MultiValidator([
        RequiredValidator(errorText: required),
        MinLengthValidator(8,
            errorText: 'The password must consist of at least 8 elements !')
      ]),
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 17, horizontal: 32),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(40.0))),
          filled: true,
          hintText: hinttext,
          hintStyle: TextStyle(
              fontFamily: themeFontLight,
              color: AppColors.greyThemeClr,
              fontSize: 16.0)),

      obscureText: obscure,
    );
  } else {
    return TextFormField(
      controller: txtcontroller,
      onSaved: (deger) => txtcontroller.text = deger!,
      keyboardType: textType,

      // key: key1,

      validator: MultiValidator([
        RequiredValidator(errorText: required),
      ]),
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 17, horizontal: 32),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(40.0))),
          filled: true,
          hintText: hinttext,
          hintStyle: TextStyle(
              fontFamily: themeFontLight,
              color: AppColors.greyThemeClr,
              fontSize: 16.0)),

      obscureText: obscure,
    );
  }
}

ElevatedButton hPetsElevatedButton(String text, Color btnColor, Color textColor,
    double btnRadius, String fontFamily, Function()? onPressed) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(btnColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(btnRadius),
        ))),
    child: Text(
      text,
      style: TextStyle(
          fontFamily: fontFamily,
          fontSize: 18.0,
          color: textColor),
    ),
  );
}


ElevatedButton hPetsElevatedButtonwithLogo(String text, Color btnColor, Color textColor,
    double btnRadius, String fontFamily, Function()? onPressed) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(btnColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(btnRadius),
            ))),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        SizedBox(
            height:20,
    child: Image.asset(Images.google_logo)),

        SizedBox(width: 10,),

        Text(
          text,
          style: TextStyle(
              fontFamily: fontFamily,
              fontSize: 18.0,
              color: textColor),
        ),
      ],
    ),
  );
}



DropdownButtonFormField2 hPetsDropdownFormField(
    String hinttext, List dropdownList, TextEditingController petGenderInputController) {
  return DropdownButtonFormField2(
    decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 17, horizontal: 15),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(40.0))),
        filled: true,
        hintText: "Select Type",
        hintStyle: TextStyle(
            fontFamily: themeFontLight,
            color: AppColors.greyThemeClr,
            fontSize: 14.0)),
    isExpanded: true,
    hint: Text(
      hinttext,
      style: TextStyle(fontSize: 16),
    ),
    dropdownDecoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
    ),
    items: dropdownList
        .map((item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.blackThemeClr,
                ),
              ),
            ))
        .toList(),
    validator: (value) {
      if (value == null) {
        return '     Please select pet !';
      }
    },
    onChanged: (value) {
      logger.i(value);
      petGenderInputController.text;
    },
    onSaved: (value) {
      selectedValue = value.toString();
      logger.i(value);
    },
  );
}

Container guideDetailContainer(int index) {
  if (index == 0) {
    return Container(

      child: Column(
        children: [
          Container(
            height: FrameSize.screenHeight / 5,
            decoration: BoxDecoration(
              color: Color(0xffB1D1FF).withOpacity(0.1),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Image.asset("assets/images/guide_image_$index.png"),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 45,
                    ),
                    Text(
                      "Cat",
                      style: TextStyle(fontFamily: themeFontBold, fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("12 – 18 yıl (Evcil)"),
                  ],
                )
              ],
            ),
          ),


           Container(


             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(

                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                   Divider(),
                   SizedBox(height: 20,),
                   Text("Kediler, evcil hayvan olarak popülerdir ve sağlıklı bir kedi mutlu ve enerjik bir hayvandır. İşte kedilerin sağlığı ve bakımı hakkında bilmeniz gerekenler:\n\nBeslenme: Kediler, yüksek proteinli bir diyete ihtiyaç duyarlar. Hazır kedi mamaları, kediler için özel olarak formüle edilmiş, dengeyi sağlamak için tüm besin öğelerini içerirler. Kedilere asla insan yiyecekleri verilmemelidir. Ayrıca, kedilerin taze içme suyuna erişimi olmalıdır.\n\nYaşam Alanı: Kediler, rahat bir yaşam alanına ihtiyaç duyarlar. Yaşam alanı, kedinin rahatça hareket edebileceği, temiz ve güvenli bir yer olmalıdır. Kedilerin oyuncaklara, tırmanma alanlarına ve uyku alanlarına erişimi olmalıdır.\n\nTemizlik: Kediler, temiz hayvanlardır ve tüylerini temiz tutmak önemlidir. Kedinin tüyleri, düzenli olarak fırçalanmalıdır. Kedi tuvaleti, her gün temizlenmeli ve dezenfekte edilmelidir.\n\nVeteriner Kontrolleri: Kedilerin, düzenli olarak veteriner kontrolüne tabi tutulması önemlidir. Veteriner, kedinin aşılanması, diş bakımı, parazit kontrolü ve sağlık sorunlarının tespiti için düzenli olarak ziyaret edilmelidir.\n\nEgzersiz: Kediler, düzenli egzersiz yapmalıdır. Egzersiz, kedinin sağlıklı kalmasına ve zinde kalmasına yardımcı olur. Kedilerin, oyuncaklarla oynamaları ve tırmanmaları önerilir.\n\nSterilizasyon/Kısırlaştırma: Kedilerin sterilizasyon/kısırlaştırılması, sağlıklı bir yaşam sürmeleri için önemlidir. Bu prosedürler, istenmeyen gebelikleri önler ve kedinin sağlık sorunlarına karşı daha dirençli hale getirir.\n\nYukarıdaki ipuçları, kedilerinizin sağlıklı ve mutlu bir şekilde yaşamasına yardımcı olacaktır. Ancak, kedilerin özel ihtiyaçları olabileceğinden, veterinerinize danışarak daha fazla bilgi edinmeniz önerilir.")
                 ],
               ),
             ),
           ),
        ],
      ),
    );
  } else if(index == 1){
    return Container(

      child: Column(
        children: [
          Container(
            height: FrameSize.screenHeight / 5,

            decoration: BoxDecoration(
              color: Color(0xffB1D1FF).withOpacity(0.1),

              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Image.asset("assets/images/guide_image_$index.png"),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 45,
                    ),
                    Text(
                      "Dog",
                      style: TextStyle(fontFamily: themeFontBold, fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("12 – 18 yıl (Evcil)"),
                  ],
                )
              ],
            ),
          ),


          Container(


            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(

                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Divider(),
                  SizedBox(height: 20,),
                  Text("Köpekler, sadık ve sevgi dolu evcil hayvanlar olarak bilinirler. İşte köpeklerin sağlığı ve bakımı hakkında bilmeniz gerekenler:\n\nBeslenme: Köpeklerin beslenmesi, onların sağlığı için çok önemlidir. Köpekler, protein, karbonhidrat, yağ ve vitaminlere ihtiyaç duyarlar. Hazır köpek mamaları, köpekler için özel olarak formüle edilmiş, dengeyi sağlamak için tüm besin öğelerini içerirler. Köpeklere asla insan yiyecekleri verilmemelidir. Ayrıca, köpeklerin taze içme suyuna erişimi olmalıdır.\n\nYaşam Alanı: Köpekler, rahat bir yaşam alanına ihtiyaç duyarlar. Yaşam alanı, köpeğin rahatça hareket edebileceği, temiz ve güvenli bir yer olmalıdır. Köpeklerin oyuncaklara, tırmanma alanlarına ve uyku alanlarına erişimi olmalıdır.\n\nTemizlik: Köpekler, temiz hayvanlardır ve tüylerini temiz tutmak önemlidir. Köpeğin tüyleri, düzenli olarak fırçalanmalıdır. Köpeklerin kulakları, gözleri ve pençeleri de düzenli olarak temizlenmelidir. Köpek tuvaleti, her gün temizlenmeli ve dezenfekte edilmelidir.\n\nVeteriner Kontrolleri: Köpeklerin, düzenli olarak veteriner kontrolüne tabi tutulması önemlidir. Veteriner, köpeğin aşılanması, diş bakımı, parazit kontrolü ve sağlık sorunlarının tespiti için düzenli olarak ziyaret edilmelidir.\n\nEgzersiz: Köpekler, düzenli egzersiz yapmalıdır. Egzersiz, köpeğin sağlıklı kalmasına ve zinde kalmasına yardımcı olur. Köpeklerin, yürüyüşe çıkarılması, oyuncaklarla oynamaları ve koşmaları önerilir.\n\nSterilizasyon/Kısırlaştırma: Köpeklerin sterilizasyon/kısırlaştırılması, sağlıklı bir yaşam sürmeleri için önemlidir. Bu prosedürler, istenmeyen gebelikleri önler ve köpeğin sağlık sorunlarına karşı daha dirençli hale getirir.\n\nYukarıdaki ipuçları, köpeklerinizin sağlıklı ve mutlu bir şekilde yaşamasına yardımcı olacaktır. Ancak, köpeklerin özel ihtiyaçları olabileceğinden, veterinerinize danışarak daha fazla bilgi edinmeniz önerilir.")
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }else if(index == 2){
    return Container(

      child: Column(
        children: [
          Container(
            height: FrameSize.screenHeight / 5,

            decoration: BoxDecoration(
              color: Color(0xffB1D1FF).withOpacity(0.1),

              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Image.asset("assets/images/guide_image_$index.png"),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 45,
                    ),
                    Text(
                      "Fish",
                      style: TextStyle(fontFamily: themeFontBold, fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("5 - 10 yıl (Evcil)"),
                  ],
                )
              ],
            ),
          ),


          Container(


            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(

                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Divider(),
                  SizedBox(height: 20,),
                  Text("Balıklar, evde beslenebilen en popüler evcil hayvanlardan biridir. İşte balıkların sağlığı ve bakımı hakkında bilmeniz gerekenler:\n\nSu Kalitesi: Balıkların sağlığı ve mutluluğu, su kalitesine bağlıdır. Balık tankı, temiz ve doğru pH seviyesine sahip su ile doldurulmalıdır. Su, düzenli olarak test edilmeli ve temizlenmelidir.\n\nBeslenme: Balıkların beslenmesi, onların sağlığı için çok önemlidir. Balıklar, protein, karbonhidrat, yağ ve vitaminlere ihtiyaç duyarlar. Hazır balık yemleri, balıklar için özel olarak formüle edilmiş, dengeyi sağlamak için tüm besin öğelerini içerirler. Balıklara asla insan yiyecekleri verilmemelidir. Ayrıca, balıkların taze içme suyuna erişimi olmalıdır.\n\nYaşam Alanı: Balıkların yaşam alanı, onların sağlığı için önemlidir. Balık tankı, balıkların rahatça hareket edebileceği, temiz ve güvenli bir yer olmalıdır. Balıkların yüzme alanları, bitki örtüsü ve saklanacak yerleri olmalıdır. Balık tankında bir filtre kullanmak, suyun temiz kalmasına ve balıkların sağlıklı kalmasına yardımcı olur.\n\nIşıklandırma: Balık tankı, uygun şekilde aydınlatılmalıdır. Doğru aydınlatma, balıkların doğal davranışlarını sergilemelerine yardımcı olur ve bitkilerin büyümesine yardımcı olur.\n\nIsıtma: Balık türüne bağlı olarak, balık tankı doğru sıcaklıkta tutulmalıdır. Balık tankı, uygun ısıtıcılarla donatılmalıdır.\n\nBakım: Balık tankı, düzenli olarak temizlenmeli ve bakım yapılmalıdır. Balıkların tüyleri, düzenli olarak fırçalanmalıdır. Balık tankı, balıkların tuvaletlerinin düzenli olarak temizlenmesi gereken bir yerdir.\n\nYukarıdaki ipuçları, balıklarınızın sağlıklı ve mutlu bir şekilde yaşamasına yardımcı olacaktır. Ancak, balıkların özel ihtiyaçları olabileceğinden, balık türüne ve tank boyutuna bağlı olarak daha fazla bilgi edinmek için veterinere veya uzman bir balıkçıya danışmanız önerilir.")
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }else if(index == 3){
    return Container(

      child: Column(
        children: [
          Container(
            height: FrameSize.screenHeight / 5,

            decoration: BoxDecoration(
              color: Color(0xffB1D1FF).withOpacity(0.1),

              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Image.asset("assets/images/guide_image_$index.png"),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 45,
                    ),
                    Text(
                      "Rabbit",
                      style: TextStyle(fontFamily: themeFontBold, fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("8 - 14 yıl (Evcil)"),
                  ],
                )
              ],
            ),
          ),


          Container(


            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(

                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Divider(),
                  SizedBox(height: 20,),
                  Text("Tavşanlar, sevimli, yumuşak ve sosyal hayvanlardır ve evde beslenebilirler. Ancak, tavşanların sağlıklı ve mutlu kalması için bazı özel ihtiyaçları vardır. İşte tavşanların sağlığı ve bakımı hakkında bilmeniz gerekenler:\n\nYaşam Alanı: Tavşanlar, rahat ve güvenli bir yaşam alanına ihtiyaç duyarlar. Tavşanların yaşam alanı, onların boyutuna ve sayısına bağlı olarak değişebilir. Ancak, tavşanların rahatça hareket edebileceği, temiz ve güvenli bir yerde yaşamaları önemlidir. Tavşanlar için özel olarak tasarlanmış kafesler veya tavşan evleri, tavşanların ihtiyaçlarını karşılamak için en uygun seçeneklerdir.\n\nBeslenme: Tavşanların sağlığı için doğru beslenme çok önemlidir. Tavşanlar, yüksek lifli yiyecekler, taze sebzeler ve ot yemekleri gibi diyetlerle beslenmelidir. Hazır tavşan yemleri de kullanılabilir, ancak tavşanlarınıza doğru beslenme sağlamak için sebzeler ve ot yemekleri de vermelisiniz. Ayrıca, tavşanların taze içme suyuna erişimi olmalıdır.\n\nTemizlik: Tavşanların yaşam alanı, düzenli olarak temizlenmelidir. Tavşanların idrarı ve dışkıları, tavşanların sağlığı için zararlı olabilir. Tavşanların yaşam alanı ve su şişesi, haftada en az bir kez temizlenmelidir.\n\nEgzersiz: Tavşanlar, düzenli egzersize ihtiyaç duyarlar. Tavşanların yaşam alanında yeterli hareket etmeleri, kas ve kemik sağlıklarını korumalarına yardımcı olur. Tavşanlarınızın düzenli olarak hareket etmeleri için, tasma takarak güvenli bir şekilde dışarıda koşturabilirsiniz.\n\nVeteriner Kontrolleri: Tavşanlar, düzenli veteriner kontrolüne ihtiyaç duyarlar. Veteriner, tavşanlarınızın sağlığı ve mutluluğu için gerekli olan aşıları yapabilir ve tavşanların sağlıklı bir şekilde yaşamalarına yardımcı olacak tavsiyelerde bulunabilir.\n\nYukarıdaki ipuçları, tavşanlarınızın sağlıklı ve mutlu bir şekilde yaşamasına yardımcı olacaktır. Ancak, tavşanların özel ihtiyaçları olabileceğinden, tavşan türüne ve yaşına bağlı olarak daha fazla bilgi edinmek için veterinerinizle veya uzman bir tavşan yetiştiricisiyle danışmanız önerilir.")
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }else if(index == 4){
    return Container(

      child: Column(
        children: [
          Container(
            height: FrameSize.screenHeight / 5,

            decoration: BoxDecoration(
              color: Color(0xffB1D1FF).withOpacity(0.1),

              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Image.asset("assets/images/guide_image_$index.png"),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 45,
                    ),
                    Text(
                      "Bird",
                      style: TextStyle(fontFamily: themeFontBold, fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("8 - 10 yıl (Evcil)"),
                  ],
                )
              ],
            ),
          ),


          Container(


            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(

                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Divider(),
                  SizedBox(height: 20,),
                  Text("Muhabbet kuşları, sevimli ve sosyal evcil hayvanlardır. Sağlıklı ve mutlu kalabilmeleri için belirli ihtiyaçları vardır. İşte muhabbet kuşlarının sağlığı ve bakımı hakkında bilmeniz gerekenler:\n\nYaşam Alanı: Muhabbet kuşlarının yaşam alanı, onların boyutuna bağlı olarak değişebilir. Ancak, yaşam alanı, kuşların rahatça hareket edebileceği, uçabileceği ve egzersiz yapabileceği bir alan olmalıdır. Kafesin boyutu, en azından kuşların kanatlarını açabilecekleri kadar geniş olmalıdır. Kafesin altı, kolay temizlenebilir bir malzeme ile kaplanmalıdır.\n\nBeslenme: Muhabbet kuşları, sağlıklı bir diyetle beslenmelidir. Kuş yemi, yaş sebzeler, meyveler, tahıllar ve küçük miktarda protein kaynakları (örneğin, haşlanmış yumurta) gibi besinler sağlanmalıdır. Ayrıca, taze suyun daima temizlenmiş olduğundan emin olun.\n\nTemizlik: Muhabbet kuşlarının yaşam alanı, düzenli olarak temizlenmelidir. Kafes, haftada birkaç kez, tüm ekipmanları ile birlikte temizlenmelidir. Bu, kuşların sağlıklı ve mutlu kalmasını sağlayacaktır.\n\nEgzersiz: Muhabbet kuşları, düzenli egzersize ihtiyaç duyarlar. Kuşları, kafesin dışına çıkararak ve odanın içinde uçmalarına izin vererek egzersizlerini sağlayabilirsiniz. Ayrıca, muhabbet kuşlarınızın kafeslerinde oyuncaklar bulundurarak da egzersizlerine katkı sağlayabilirsiniz.\n\nVeteriner Kontrolleri: Muhabbet kuşları, düzenli veteriner kontrolüne ihtiyaç duyarlar. Veteriner, kuşların sağlığı için gerekli olan aşıları yapabilir ve kuşların sağlıklı bir şekilde yaşamalarına yardımcı olacak tavsiyelerde bulunabilir.\n\nYukarıdaki ipuçları, muhabbet kuşlarınızın sağlıklı ve mutlu bir şekilde yaşamasına yardımcı olacaktır. Ancak, muhabbet kuşlarının özel ihtiyaçları olabileceğinden, muhabbet kuşunun türüne ve yaşına bağlı olarak daha fazla bilgi edinmek için veterinerinizle veya uzman bir kuş yetiştiricisiyle danışmanız önerilir.")
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }else if(index == 5){
    return Container(

      child: Column(
        children: [
          Container(
            height: FrameSize.screenHeight / 5,

            decoration: BoxDecoration(
              color: Color(0xffB1D1FF).withOpacity(0.1),

              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Image.asset("assets/images/guide_image_$index.png"),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 45,
                    ),
                    Text(
                      "Turtle",
                      style: TextStyle(fontFamily: themeFontBold, fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("0 - 30 yıl (Evcil)"),
                  ],
                )
              ],
            ),
          ),


          Container(


            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(

                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Divider(),
                  SizedBox(height: 20,),
                  Text("Ev kaplumbağaları, sevimli ve ilginç evcil hayvanlardır. Ancak, sağlıklı ve mutlu bir şekilde yaşayabilmeleri için doğru bakımı almaları gerekmektedir. İşte ev kaplumbağalarının sağlığı ve bakımı hakkında bilmeniz gerekenler:\n\nYaşam Alanı: Kaplumbağalar, yaşam alanları için özel ihtiyaçlara sahiptirler. Bunlar genellikle akvaryum veya teraryum benzeri kaplar içinde tutulurlar. Yaşam alanları, kaplumbağaların boyutuna ve sayısına bağlı olarak değişebilir. Ancak, yaşam alanı, kaplumbağaların hareket edebileceği, sığ bir su kaynağı içerebileceği ve ısıtılabileceği bir alan olmalıdır.\n\nBeslenme: Kaplumbağalar, doğru beslenme ile sağlıklı kalırlar. Kaplumbağaların diyeti, kabuklu deniz ürünleri, sebzeler, meyveler ve böcekler gibi protein kaynakları içermelidir. Ayrıca, kaplumbağaların sağlıklı kemikler ve kabukları için kalsiyum takviyesi almaları da önemlidir.\n\nSu: Kaplumbağalar, su içinde yaşayan hayvanlardır ve temiz suya ihtiyaç duyarlar. Su kaynağı, kaplumbağaların yüzebileceği kadar derin olmalıdır. Ayrıca, su kaynağı düzenli olarak temizlenmeli ve değiştirilmelidir.\n\nIsıtma: Kaplumbağalar, ısının doğru seviyede olması gereken hayvanlardır. Yaşam alanı, kaplumbağaların ısısını korumak için bir ısıtma lambası veya ısıtma matı gibi bir ısı kaynağı içermelidir.\n\nVeteriner Kontrolleri: Kaplumbağaların sağlıklı kalabilmeleri için düzenli veteriner kontrollerine ihtiyaçları vardır. Veteriner, kaplumbağaların sağlığı için gerekli olan taramaları yapabilir ve kaplumbağalarınızın sağlıklı bir şekilde yaşamalarına yardımcı olacak tavsiyelerde bulunabilir.\n\nYukarıdaki ipuçları, ev kaplumbağalarının sağlıklı ve mutlu bir şekilde yaşamasına yardımcı olacaktır. Ancak, kaplumbağaların türüne ve yaşına bağlı olarak daha fazla bilgi edinmek için veterinerinizle veya uzman bir kaplumbağa yetiştiricisiyle danışmanız önerilir.")
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }else if(index == 6){
    return Container(

      child: Column(
        children: [
          Container(
            height: FrameSize.screenHeight / 5,

            decoration: BoxDecoration(
              color: Color(0xffB1D1FF).withOpacity(0.1),

              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Image.asset("assets/images/guide_image_$index.png"),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 45,
                    ),
                    Text(
                      "Hamster",
                      style: TextStyle(fontFamily: themeFontBold, fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("2 - 3 yıl (Evcil)"),
                  ],
                )
              ],
            ),
          ),


          Container(


            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(

                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Divider(),
                  SizedBox(height: 20,),
                  Text("Hamsterlar, küçük ve sevimli evcil hayvanlardır. Sağlıklı bir hamster, mutlu ve hareketli olacaktır. İşte hamster sağlığı ve bakımı hakkında bilmeniz gerekenler: \n\nYaşam Alanı: Hamsterlar, temiz bir kafeste yaşamalıdır. Kafes, hamsterın rahatça hareket edebileceği ve içinde bir çark, bir yuva, bir su şişesi ve bir beslenme kabı gibi temel ekipmanlar bulundurmalıdır. Kafesin altına talaş veya kum döşenerek temizliği kolaylaştırılmalıdır.\n\nBeslenme: Hamsterlar, özel olarak hazırlanmış bir hamster yemi veya taze sebze, meyve, kuru yem gibi yiyeceklerle beslenmelidir. Ayrıca, hamsterların dişlerinin uzamasını önlemek için çiğneme kemikleri verilebilir.\n\nSu: Hamsterlar, temiz ve taze suya ihtiyaç duyarlar. Bir su şişesi kafese takılmalı ve su düzenli olarak değiştirilmelidir.\n\nEgzersiz: Hamsterlar, düzenli egzersiz yapmalıdır. Kafeste bir çark veya oyun alanı sağlamak, hamsterınızın egzersiz yapmasına yardımcı olur.\n\nTemizlik: Hamsterlar, temiz bir ortamda yaşamalıdır. Kafes, haftada en az bir kez temizlenmelidir. Ayrıca, hamsterın tüylerinin düzenli olarak fırçalanması, temizlenmesi ve kesilmesi gerekebilir.\n\nSağlık Kontrolü: Hamsterlar, düzenli olarak sağlık kontrolüne tabi tutulmalıdır. Hamsterınızın davranışları, iştahı ve dışkıları kontrol edilmelidir. Herhangi bir anormallik fark ederseniz, veterinerinize danışın.\n\nSosyal İletişim: Hamsterlar, sosyal hayvanlardır. Diğer hamsterlarla bir arada yaşamaları daha iyidir. Ancak, aynı cinsiyetten olan hamsterlar bir arada yaşayamazlar ve savaşabilirler. Hamsterınızın sosyal ihtiyaçlarını karşılamak için düzenli olarak zaman ayırın ve oynayın.\n\nYukarıdaki ipuçları, hamsterınızın sağlıklı ve mutlu bir şekilde yaşamasına yardımcı olacaktır. Ancak, hamsterınızın özel ihtiyaçları olabileceğinden, veterinerinize danışarak daha fazla bilgi edinmeniz önerilir.")
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }else if(index == 7){
    return Container(

      child: Column(
        children: [
          Container(
            height: FrameSize.screenHeight / 5,

            decoration: BoxDecoration(
              color: Color(0xffB1D1FF).withOpacity(0.1),

              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Image.asset("assets/images/guide_image_$index.png"),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 45,
                    ),
                    Text(
                      "Horse",
                      style: TextStyle(fontFamily: themeFontBold, fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("25 - 30 yıl"),
                  ],
                )
              ],
            ),
          ),


          Container(


            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(

                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Divider(),
                  SizedBox(height: 20,),
                  Text("Atlar, güçlü, zarif ve özel evcil hayvanlardır. Sağlıklı bir at, enerjik ve mutlu olacaktır. İşte at sağlığı ve bakımı hakkında bilmeniz gerekenler:\n\nYaşam Alanı: Atlar, geniş bir ahıra veya barınağa ihtiyaç duyarlar. Yaşam alanı, atın rahatça hareket edebileceği, temiz ve güvenli bir yer olmalıdır. Ayrıca, yeterli miktarda yemlik ve içme suyu sağlanmalıdır.\n\nBeslenme: Atların beslenmesi, yüksek kaliteli yemler, saman ve taze su içermelidir. Beslenme planı, atın yaşına, boyuna, kilosuna ve faaliyet seviyesine göre belirlenmelidir. Ayrıca, atların dişleri düzenli olarak kontrol edilmeli ve kesilmelidir.\n\nEgzersiz: Atlar, düzenli egzersiz yapmalıdır. Egzersiz, atın sağlıklı kalmasına ve zinde kalmasına yardımcı olur. Atların, günün çoğunu dışarıda geçirmesi ve yürüyüş, koşu veya binicilik gibi aktiviteler yapması önerilir.\n\nTemizlik: Atların, temiz bir ortamda yaşamaları önemlidir. Ahır veya barınak, düzenli olarak temizlenmeli ve dezenfekte edilmelidir. Atların tüyleri, düzenli olarak fırçalanmalı ve taranmalıdır. Ayrıca, atların tırnakları da düzenli olarak kesilmelidir.\n\nVeteriner Kontrolleri: Atların, düzenli olarak veteriner kontrolüne tabi tutulması önemlidir. Veteriner, atın aşılanması, diş bakımı, parazit kontrolü ve sağlık sorunlarının tespiti için düzenli olarak ziyaret edilmelidir.\n\nSosyal İletişim: Atlar, sosyal hayvanlardır ve diğer atlarla bir arada yaşamaları gereklidir. Atların birlikte yaşayabileceği uygun arkadaşlar bulunmalıdır. Atların da, insanlarla birlikte sosyal etkileşimde bulunması ve eğitim alması önerilir.\n\nYukarıdaki ipuçları, atlarınızın sağlıklı ve mutlu bir şekilde yaşamasına yardımcı olacaktır. Ancak, atların özel ihtiyaçları olabileceğinden, veterinerinize danışarak daha fazla bilgi edinmeniz önerilir.")
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }else{
    return Container();
  }
}


AppBar hpetsAppBar (BuildContext context, bool backButton, String appText, bool profileIcon){
  return AppBar(
    automaticallyImplyLeading: backButton,
    centerTitle: true,
    title: Text(
      appText,
      style: TextStyle(color: AppColors.whiteThemeClr,letterSpacing: 1),
    ),


    actions: [


      profileIcon
      ? InkWell(
          onTap: (){
            Navigator.pushNamed(context, '/profile');
          },
          child: Container(
              width: FrameSize.screenWidth/6,
              child: Icon(Icons.person)))
      : Container(width: 0, height: 0),


      SizedBox(width: 15,)
    ],
    backgroundColor: AppColors.appThemeClr,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(25),
      ),
    ),
  );
}



TextFormField ContentTextFormField (TextEditingController txtcntrller, String required, String textHint){
  return TextFormField(

    controller: txtcntrller,
    validator: MultiValidator([
      RequiredValidator(errorText: required),
    ]),

    decoration: InputDecoration(

        contentPadding:
        const EdgeInsets.symmetric(vertical: 17, horizontal: 32),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(40.0))),
        filled: true,
        hintText: textHint,

        hintStyle: TextStyle(
            fontFamily: themeFontLight,
            color: AppColors.greyThemeClr,


            fontSize: 16.0)),
    maxLines: 6,
    maxLength: 170,
  );
}