import 'dart:io';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
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

ElevatedButton hPetsElevatedButton(String text, Color btnColor,
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
          color: AppColors.whiteThemeClr),
    ),
  );
}

DropdownButtonFormField2 hPetsDropdownFormField(
    String hinttext, List dropdownList) {
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
                   Text("Kedi temizliği kedilerin ve insanların sağlığı için çok önemlidir. Kediler doğaları gereği çok temiz evcil hayvanlardır. Kedilerin evde bakımı bu nedenle de çok kolaydır. Kediler yaşamlarında günün büyük bir kısmını uyuyarak geçirir. Kalan zamanlarında ise tüy bakımlarını yapar, yemek yer ve oyun oynarlar. Sağlıklı kediler her zaman tüylerinin bakımlarıyla ilgilenir, tüy temizliğine özen gösterir. Kediler tuvaletlerini kum kabına yaparak üstünü örtme alışkanlığı ile doğdukları için titiz ev sahipleri için bile zorluk çıkartmayacak canlı olma özelliğine sahiplerdir.Kedilerin Rutin Bakımı Nasıl Olmalıdır?Kedilerin bakımı ve rutin temizlikleri çoğu zaman kedilerin kendisi tarafından sağlanır. Ancak rutin bakımların bazı durumlarında kedi sahiplerinin de üzerine düşen görevler vardır. Kediler rutin bakımlarında göz ve kulak temizliği, diş temizliği yapamazlar. Bu nedenle sık olmasa da ihtiyaç duyuldukça kedinizin kulaklarını ve gözlerini uygun nemli bezler ile silmelisiniz.Kedi bakımı için gerekli olabilecek malzemeleri size en yakın petshoptan ya da veteriner kliniğinizden temin edebilirsiniz. Kediniz için kullanacağınız bakım ürünlerinin, temizlik bezlerinin kedinizin derisinde tahriş oluşturmaması ve kedinize zararlı bir özellik içermemesi gerekir. Bu nedenle kediler için özel olarak geliştirilen bakım ürünlerini tercih etmelisiniz.Kedi bakımında kedi sahipleri çevrenin temizliğinden ve hijyeninden de sorumludur. Kediler hijyen sorunları yaşanan evlerde çeşitli hastalıklar geliştirebilirler. İnsan sağlığı ve hayvan sağlığı için tehlikeli olabilecek her türlü faktör ortadan kaldırılmalıdır.Kedilerin Temizliği Nasıl Olmalıdır?Kedilerin temizlenmesi konusunda kedilerin rutin temizlikleri bazı durumlarda yeterli olmayabilir. Bu durumlardan bazıları deri hastalıkları, dış parazitler, kedinin dışarıdan bir pisliğe maruz kalması gibi durumlardan oluşabilmektedir. Kedilerin maruz kaldığı bu gibi durumlarda acilen önlem almanız ve kedinizin tüylerini temizlemek için banyo yaptırmanız ya da tüylerini tıraş etmeniz gerekebilir.Kedi nasıl temizlenir bilmiyorsanız eğer veteriner hekiminize danışarak danışmanlık hizmeti almalısınız. Kedinin tüylerinin tıraş edilmesi gerekiyorsa eğer bunu tek başınıza yapamazsınız. Tüy tıraşları uygun koşullarda, veteriner kliniklerde gerçekleştirilir.Kedilerin temizliği yalnızca kedinin tüy temizliği ile değil çevre temizliği ile de yakından ilgilidir. Kedilerin temizliği ve bakımı için mama kaplarının, kum kaplarının her daim temiz olması gerekir. Mama ve su kaplarını her gün sıcak su ile yıkamalısınız. Bu temizliklerin hiçbirinde kimyasal maddeler kullanmayınız. Kedilerin kum kaplarını ise her gün kum küreği ile temizlemeli, gerektiğinde kumu tamamen değiştirmelisiniz. Kedinizin çevre temizliği rutinlerinden birisini aksatırsanız eğer sağlıkları açısından olumsuz sonuçlar meydana gelebilir.Kedilerin temizlikleri pire bulaşması gibi durumlarda veteriner hekiminizin önerileri ile gerçekleşmelidir. Bu durumda kediler pire şampuanı ile yıkanmalı, gerekirse tıraş edilmeli ve ilaçlara başlanmalıdır.Kedi Temizliğinde Kedi Yıkanır Mı?Kedilerin temizliği konusunda kedi sahipleri kedilerin banyo yaptırılıp yaptırılamayacağını merak eder. Kedilerin normal şartlar altında yıkanmaları önerilmez. Düzenli olarak tüylerinin taranması ve kulak içi, göz çevresi gibi temizlikleri yapılır. Banyo mecbur kalınmadıkça kediler için önerilmez. Bunun en geçerli sebeplerinden birisi kedilerin genelinin suyu sevmedikleri için strese girmeleri, bir diğer önemli sebebi ise sık banyo yaptırılan kedilerde derinin kurulaşması ve kepekleşmesidir.Kedilerde temizlik ve bakım konusunda tüyleri mutlaka düzenli olarak taranmalıdır. Özellikle uzun tüylü ırklardan kedilerin tüyleri taranmadığında zamanla tüyler birbirine karışır ve hiçbir şekilde açmak mümkün olmaz. Bu olduğunda kedinin mecburen tıraş edilmesi gerekir. Kedinin tüylerini düzenli olarak tarasınız eğer tüylerin birbirine geçmesine, keçeleşmesine fırsat vermemiş olursunuz ve kediniz tıraş olma stresini yaşamamış olur.Kedi temizliğinde önemli noktalar dikkat edildiğinde kediniz uzun yıllar sağlıklı yaşar. Kedinizin temizliğinin ve bakımının doğru bir şekilde yapıldığından emin olmak için kediniz için gerekenleri bir tedarik listesi düzenleyerek kontrol edebilirsiniz. Kedinizin temizliği ve bakımı kadar güvenliği de çok önemlidir. Bu nedenle mikroçip uygulamasını ve kimlik etiketli tasma kullanmayı ihmal etmemelisiniz. Acil durumlar için evinizde kediniz için bir acil durum çantası olmalıdır. Bu çantanın içinde öncelik sırasına göre mevcut olan her şey kedilerin bakımı için gereklidir.Kedilerde Hangi Bakımlar Uygulanmalıdır?Her kedi sahibi kedi nasıl bakılır en iyi koşullarda öğrenmek ve gereğini yerine getirmek ister. Kedi bakımı için yerine getirmeniz gerekenler genel anlamıyla şu şekilde olmaktadır:İyi bir mama seçimiMama kabı ve su temizliği, şebeke suyu kullanmamakOyun zamanları için uygun oyuncaklar edinmek ve bunların temizliği ile ilgilenmekKedilerin saklanma istekleri için uygun, güvenli bölgeler inşa etmekKedilerin tırnaklarını törpüleyebilmesi ve geçirebilmesi kedi tırmalama tahtası bulundurmakSindirim sistemleri için gerekli olan faydalı otlara kedilerin erişebilmesini sağlamak. Evde kediotu bulundurmakTuvaletleri için uygun kedi kumlarından kullanmak. Kanserojen kristal yapılı kedi kumları gibi yanlış tercihlerden uzak durmak. Kedi kumunun her daim temizliğinden emin olmakTüy bakımları için doğru ürünler kullanmak ve tüyleri düzenli olarak fırçalamakVeteriner ziyaretlerini aksatmamak, aşılarını düzenli olarak yaptırmakTüylerini her fırçalamada kontrol etmek, dış parazitlerin varlığında vakit kaybetmeden önlem almakKedinize bir veterinerlik ziyareti esnasında mikroçip uygulamasını yaptırmakDiş bakımları için gereni yerine getirmek. Diş taşlarının oluşmasını ve dişlerin çürümesini engellemek için düzenli olarak kedilerin dişlerini fırçalamak.Kedinizin dönemine uygun şekilde en iyi bakımı üstlenmek. Yavru, hasta, gebe, yaşlı kedilerde bakımlar farklı olacaktır. Her türlü durum için uygun ortam ve koşulu sağlamak kedi sahibinin görevlerindendir.Kedi Bakımında Dikkat Edilmesi Gereken Önemli Noktalar Nelerdir?Kedi bakımında önemli noktalar her kedi sahibi tarafından dikkat edilmelidir. Kedi bakımında kedilerin sağlığı ne kadar önemli ise kedilerin insanlar ile etkileşiminde çevrenin durumu da o kadar önemlidir. Kedi sahipleri kedi tüyünden dolayı alerjik reaksiyon geçiriyorsa eğer bu durumu kontrol altına alabilmek ve gereğini yerine getirebilmek için veteriner hekimiyle ve doktoruyla görüşmesi gerekecektir.Kedi tüylerinin alerjik reaksiyon yarattığı durumlarda çevreye yapışan kedi tüylerinin her gün temizlenmesi gerekir. Kedi sahipleri kedi tüylerini etraftan ve kıyafetlerden güzelce temizleyebilmek için yüksek emiş gücüne sahip vakumlu temizlik aletlerini tercih ederek sorunu ortadan kaldırabilir.Kedi Bakımında Kullanılan Teknolojik Ürünler Nelerdir?Kedi bakımında kedi sahiplerinin gündelik olarak işlerini kolaylaştırabilecek bazı ürünler mevcuttur. Bu ürünler otomatik mama ve su kaplarıdır. Otomatik mama ve su kapları hayvan bakımı konusunda ileri teknoloji bakım ürünleri ile çözümler arayan kedi sahipleri için harika çözümlerdir. Otomatik mama kapları obez kedilerin aşırı mama yemesini sınırlandırmak için ve kısa seyahatlerde evden uzaktayken kedilerin düzenli olarak beslendiğinden emin olmak için işe yarayan teknolojik çözümlerdir. Otomatik su kapları ile her daim kediniz taze ve temiz suya sahip olur.Teknolojik kedi bakım ürünlerinde revaçta olan bir diğer ürün ise otomatik tuvaletlerdir. Otomatik tuvaletler kedi kumunun kürek ile temizlenmesine gerek kalmadan, kendi kendine temizlenen bir siteme sahip olur ve kedi sahipleri için kedi bakımında çok işe yarar. Kedi kumunun tozundan ve kokusundan kurtulmak isteyen kedi sahipleri otomatik tuvaletler tercih edebilir. Otomatik kedi ürünleri doğayla dost ürünler olma özelliğine sahiptir.")
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
                  Text("Her canlı varlık gibi köpekler de, yaşamlarını sağlıklı sürdürebilmek için, belirli ortam ve koşullara gereksinme duyar.Barındıkları yerin sağlıklı yaşamalarına elverişli olup olmadığından tutun, gereksindikleri besin türü ve oranının karşılanıp karşılanmaması, temizlik ve bakımlarının yapılıp yapılmaması, hareket etme ve dolaşma olanağı bulup bulmamalarına değin pek çok etken, sağlıkları üstünde tesirler yaratır.Köpek barınağının bakım ve temizliğiKöpek barınağının sadece sağlık koşullarına ideal oluşu yeterli değildir. kullanılan her konut gibi köpek kulübesi de vakit içerisinde kirlenir, aşınır. bakım ve temizlik gerektirir. daha önce de değindik, kullanma ve bakım açısından köpek kulübelerinin yeri büyük önem taşır. kulübe, köpeğin döküntü ve artıklarının ev halkını, eve gidip geleni rahatsız etmeyeceği kadar eve uzak, bakımının kolaylıkla yapılabileceği kadar yakın olmalıdır.Köpeğin kulübesi her gün temizlenmelidir.Köpeğin minderi her gün dışarı alınmalı, silkelenmeli ve havalandırmalıdır.Kulübenin içi, tüy artıklarından, döküntülerden süpürülerek temizlenmeli, parazit bulunup bulunmadığı denetlenmelidir.")
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
                  Text("Her canlı varlık gibi köpekler de, yaşamlarını sağlıklı sürdürebilmek için, belirli ortam ve koşullara gereksinme duyar.Barındıkları yerin sağlıklı yaşamalarına elverişli olup olmadığından tutun, gereksindikleri besin türü ve oranının karşılanıp karşılanmaması, temizlik ve bakımlarının yapılıp yapılmaması, hareket etme ve dolaşma olanağı bulup bulmamalarına değin pek çok etken, sağlıkları üstünde tesirler yaratır.Köpek barınağının bakım ve temizliğiKöpek barınağının sadece sağlık koşullarına ideal oluşu yeterli değildir. kullanılan her konut gibi köpek kulübesi de vakit içerisinde kirlenir, aşınır. bakım ve temizlik gerektirir. daha önce de değindik, kullanma ve bakım açısından köpek kulübelerinin yeri büyük önem taşır. kulübe, köpeğin döküntü ve artıklarının ev halkını, eve gidip geleni rahatsız etmeyeceği kadar eve uzak, bakımının kolaylıkla yapılabileceği kadar yakın olmalıdır.Köpeğin kulübesi her gün temizlenmelidir.Köpeğin minderi her gün dışarı alınmalı, silkelenmeli ve havalandırmalıdır.Kulübenin içi, tüy artıklarından, döküntülerden süpürülerek temizlenmeli, parazit bulunup bulunmadığı denetlenmelidir.")
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
                  Text("Her canlı varlık gibi köpekler de, yaşamlarını sağlıklı sürdürebilmek için, belirli ortam ve koşullara gereksinme duyar.Barındıkları yerin sağlıklı yaşamalarına elverişli olup olmadığından tutun, gereksindikleri besin türü ve oranının karşılanıp karşılanmaması, temizlik ve bakımlarının yapılıp yapılmaması, hareket etme ve dolaşma olanağı bulup bulmamalarına değin pek çok etken, sağlıkları üstünde tesirler yaratır.Köpek barınağının bakım ve temizliğiKöpek barınağının sadece sağlık koşullarına ideal oluşu yeterli değildir. kullanılan her konut gibi köpek kulübesi de vakit içerisinde kirlenir, aşınır. bakım ve temizlik gerektirir. daha önce de değindik, kullanma ve bakım açısından köpek kulübelerinin yeri büyük önem taşır. kulübe, köpeğin döküntü ve artıklarının ev halkını, eve gidip geleni rahatsız etmeyeceği kadar eve uzak, bakımının kolaylıkla yapılabileceği kadar yakın olmalıdır.Köpeğin kulübesi her gün temizlenmelidir.Köpeğin minderi her gün dışarı alınmalı, silkelenmeli ve havalandırmalıdır.Kulübenin içi, tüy artıklarından, döküntülerden süpürülerek temizlenmeli, parazit bulunup bulunmadığı denetlenmelidir.")
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
                  Text("Her canlı varlık gibi köpekler de, yaşamlarını sağlıklı sürdürebilmek için, belirli ortam ve koşullara gereksinme duyar.Barındıkları yerin sağlıklı yaşamalarına elverişli olup olmadığından tutun, gereksindikleri besin türü ve oranının karşılanıp karşılanmaması, temizlik ve bakımlarının yapılıp yapılmaması, hareket etme ve dolaşma olanağı bulup bulmamalarına değin pek çok etken, sağlıkları üstünde tesirler yaratır.Köpek barınağının bakım ve temizliğiKöpek barınağının sadece sağlık koşullarına ideal oluşu yeterli değildir. kullanılan her konut gibi köpek kulübesi de vakit içerisinde kirlenir, aşınır. bakım ve temizlik gerektirir. daha önce de değindik, kullanma ve bakım açısından köpek kulübelerinin yeri büyük önem taşır. kulübe, köpeğin döküntü ve artıklarının ev halkını, eve gidip geleni rahatsız etmeyeceği kadar eve uzak, bakımının kolaylıkla yapılabileceği kadar yakın olmalıdır.Köpeğin kulübesi her gün temizlenmelidir.Köpeğin minderi her gün dışarı alınmalı, silkelenmeli ve havalandırmalıdır.Kulübenin içi, tüy artıklarından, döküntülerden süpürülerek temizlenmeli, parazit bulunup bulunmadığı denetlenmelidir.")
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
                  Text("Her canlı varlık gibi köpekler de, yaşamlarını sağlıklı sürdürebilmek için, belirli ortam ve koşullara gereksinme duyar.Barındıkları yerin sağlıklı yaşamalarına elverişli olup olmadığından tutun, gereksindikleri besin türü ve oranının karşılanıp karşılanmaması, temizlik ve bakımlarının yapılıp yapılmaması, hareket etme ve dolaşma olanağı bulup bulmamalarına değin pek çok etken, sağlıkları üstünde tesirler yaratır.Köpek barınağının bakım ve temizliğiKöpek barınağının sadece sağlık koşullarına ideal oluşu yeterli değildir. kullanılan her konut gibi köpek kulübesi de vakit içerisinde kirlenir, aşınır. bakım ve temizlik gerektirir. daha önce de değindik, kullanma ve bakım açısından köpek kulübelerinin yeri büyük önem taşır. kulübe, köpeğin döküntü ve artıklarının ev halkını, eve gidip geleni rahatsız etmeyeceği kadar eve uzak, bakımının kolaylıkla yapılabileceği kadar yakın olmalıdır.Köpeğin kulübesi her gün temizlenmelidir.Köpeğin minderi her gün dışarı alınmalı, silkelenmeli ve havalandırmalıdır.Kulübenin içi, tüy artıklarından, döküntülerden süpürülerek temizlenmeli, parazit bulunup bulunmadığı denetlenmelidir.")
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
                  Text("Her canlı varlık gibi köpekler de, yaşamlarını sağlıklı sürdürebilmek için, belirli ortam ve koşullara gereksinme duyar.Barındıkları yerin sağlıklı yaşamalarına elverişli olup olmadığından tutun, gereksindikleri besin türü ve oranının karşılanıp karşılanmaması, temizlik ve bakımlarının yapılıp yapılmaması, hareket etme ve dolaşma olanağı bulup bulmamalarına değin pek çok etken, sağlıkları üstünde tesirler yaratır.Köpek barınağının bakım ve temizliğiKöpek barınağının sadece sağlık koşullarına ideal oluşu yeterli değildir. kullanılan her konut gibi köpek kulübesi de vakit içerisinde kirlenir, aşınır. bakım ve temizlik gerektirir. daha önce de değindik, kullanma ve bakım açısından köpek kulübelerinin yeri büyük önem taşır. kulübe, köpeğin döküntü ve artıklarının ev halkını, eve gidip geleni rahatsız etmeyeceği kadar eve uzak, bakımının kolaylıkla yapılabileceği kadar yakın olmalıdır.Köpeğin kulübesi her gün temizlenmelidir.Köpeğin minderi her gün dışarı alınmalı, silkelenmeli ve havalandırmalıdır.Kulübenin içi, tüy artıklarından, döküntülerden süpürülerek temizlenmeli, parazit bulunup bulunmadığı denetlenmelidir.")
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
                  Text("Her canlı varlık gibi köpekler de, yaşamlarını sağlıklı sürdürebilmek için, belirli ortam ve koşullara gereksinme duyar.Barındıkları yerin sağlıklı yaşamalarına elverişli olup olmadığından tutun, gereksindikleri besin türü ve oranının karşılanıp karşılanmaması, temizlik ve bakımlarının yapılıp yapılmaması, hareket etme ve dolaşma olanağı bulup bulmamalarına değin pek çok etken, sağlıkları üstünde tesirler yaratır.Köpek barınağının bakım ve temizliğiKöpek barınağının sadece sağlık koşullarına ideal oluşu yeterli değildir. kullanılan her konut gibi köpek kulübesi de vakit içerisinde kirlenir, aşınır. bakım ve temizlik gerektirir. daha önce de değindik, kullanma ve bakım açısından köpek kulübelerinin yeri büyük önem taşır. kulübe, köpeğin döküntü ve artıklarının ev halkını, eve gidip geleni rahatsız etmeyeceği kadar eve uzak, bakımının kolaylıkla yapılabileceği kadar yakın olmalıdır.Köpeğin kulübesi her gün temizlenmelidir.Köpeğin minderi her gün dışarı alınmalı, silkelenmeli ve havalandırmalıdır.Kulübenin içi, tüy artıklarından, döküntülerden süpürülerek temizlenmeli, parazit bulunup bulunmadığı denetlenmelidir.")
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
      style: TextStyle(color: AppColors.whiteThemeClr),
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
