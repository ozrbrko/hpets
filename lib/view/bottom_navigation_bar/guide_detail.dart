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

                  },
                ),

              ],
            ),
          ),
        ),
      ),

    );
  }
}
