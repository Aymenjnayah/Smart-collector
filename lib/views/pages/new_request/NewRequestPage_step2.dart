import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_collector/config/values_manager.dart';

import '../../../config/app_colors.dart';
import '../../../widgets/medium_text_widget.dart';

class NewRequestPage extends StatelessWidget {
  const NewRequestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppPadding.wp20, vertical: AppSize.hs20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  child: Icon(
                    Icons.chevron_left,
                    size: 30.0,
                    color: Color.fromARGB(255, 81, 78, 78),
                  ),
                ),
                MediumTextWidget(
                  text: "Our weekly newsletter",
                  color: AppColor.Subtitle,
                  size: FontSize.fs18,
                ),
              ],
            ),
          ),

          
        ],
      )),
    );
  }
}
