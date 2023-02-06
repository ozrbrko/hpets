import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';
import 'package:hpets/core/components/widgets/widgets.dart';
import 'package:hpets/core/constants/colors.dart';
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
                      leading: Icon(Icons.question_answer_outlined),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)),
                      title: Text('Default trailing'),
                      trailing: Icon(Icons.keyboard_arrow_down),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 200,

                            child: Center(
                              child: Text(
                                'Widget',
                                style: TextStyle(color: Colors.red),
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
                      leading: Icon(Icons.question_answer_outlined),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)),
                      title: Text('Default trailing'),
                      trailing: Icon(Icons.keyboard_arrow_down),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 200,

                            child: Center(
                              child: Text(
                                'Widget',
                                style: TextStyle(color: Colors.red),
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
                      leading: Icon(Icons.question_answer_outlined),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)),
                      title: Text('Default trailing'),
                      trailing: Icon(Icons.keyboard_arrow_down),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 200,
                            child: Center(
                              child: Text(
                                'Widget',
                                style: TextStyle(color: Colors.red),
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
                      leading: Icon(Icons.question_answer_outlined),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)),
                      title: Text('Default trailing'),
                      trailing: Icon(Icons.keyboard_arrow_down),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 200,

                            child: Center(
                              child: Text(
                                'Widget',
                                style: TextStyle(color: Colors.red),
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
