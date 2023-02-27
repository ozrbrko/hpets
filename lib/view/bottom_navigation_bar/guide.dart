import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hpets/core/constants/fonts.dart';
import 'package:hpets/view/bottom_navigation_bar/guide_detail.dart';
import '../../core/components/widgets/widgets.dart';
import '../../core/constants/colors.dart';
import '../../core/responsive/frame_size.dart';

class GuidePage extends StatefulWidget {
  const GuidePage({Key? key}) : super(key: key);

  @override
  State<GuidePage> createState() => _GuidePageState();

}

class _GuidePageState extends State<GuidePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: hpetsAppBar(context,false,"hPETS",true),
      body: Container(
        color: AppColors.whiteThemeClr,
        width: FrameSize.screenWidth,
        child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              children: <Widget>[
                Align(
                    alignment: Alignment.topLeft,
                    child: Text("lets_learn".tr,
                        style: TextStyle(
                            fontSize: 30,
                            fontFamily: themeFontBold,
                            color: AppColors.appThemeClr))),
                SizedBox(
                  height: 5,
                ),
                Expanded(
                  // not: Rehber Evcil hayvan listesi
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: List.generate(8, (index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      GuideDetailPage(index: index)));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color(0xffE7D1D1).withOpacity(0.5),
                          ),

                          child: Column(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Image.asset(
                                      "assets/images/guide_image_$index.png"),
                                ),
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Builder(
                                      builder: (BuildContext context) {
                                        switch (index) {
                                          case 0:
                                            break;
                                        }
                                        return index == 0
                                            ? Text(
                                                "cat".tr,
                                                style: TextStyle(
                                                    fontFamily:
                                                        themeFontRegular,
                                                    fontSize: 18),
                                              )
                                            : index == 1
                                                ? Text(
                                                    "dog".tr,
                                                    style: TextStyle(
                                                        fontFamily:
                                                            themeFontRegular,
                                                        fontSize: 18),
                                                  )
                                                : index == 2
                                                    ? Text(
                                                        "fish".tr,
                                                        style: TextStyle(
                                                            fontFamily:
                                                                themeFontRegular,
                                                            fontSize: 18),
                                                      )
                                                    : index == 3
                                                        ? Text(
                                                            "rabbit".tr,
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    themeFontRegular,
                                                                fontSize: 18),
                                                          )
                                                        : index == 4
                                                            ? Text(
                                                                "bird".tr,
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        themeFontRegular,
                                                                    fontSize:
                                                                        18),
                                                              )
                                                            : index == 5
                                                                ? Text(
                                                                    "turtle".tr,
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            themeFontRegular,
                                                                        fontSize:
                                                                            18),
                                                                  )
                                                                : index == 6
                                                                    ? Text(
                                                                        "hamster".tr,
                                                                        style: TextStyle(
                                                                            fontFamily:
                                                                                themeFontRegular,
                                                                            fontSize:
                                                                                18),
                                                                      )
                                                                    : index == 7
                                                                        ? Text(
                                                                            "horse".tr,
                                                                            style:
                                                                                TextStyle(fontFamily: themeFontRegular, fontSize: 18),
                                                                          )
                                                                        : Text(
                                                                            "");
                                      },
                                    ),
                                  ))
                            ],
                          ),
                          // color: Color(0xffE7D1D1).withOpacity(0.5),
                          margin: EdgeInsets.all(10.0),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
