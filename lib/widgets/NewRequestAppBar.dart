import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_collector/widgets/medium_text_widget.dart';
import '../config/app_colors.dart';
import '../config/values_manager.dart';

class NewRequestAppBar extends StatelessWidget {
  final String title;

  const NewRequestAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 10, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.grey.withOpacity(0.1),
            ),
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.chevron_left,
                size: 30.0,
                color: Color.fromARGB(255, 81, 78, 78),
              ),
            ),
          ),
          Text(
             title,style: TextStyle(fontSize: 18,color: AppColor.Subtitle),

          ),
        ],
      ),
    );
  }
}
