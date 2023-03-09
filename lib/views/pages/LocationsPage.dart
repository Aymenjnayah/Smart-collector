import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_collector/controllers/Locations_controller.dart';

import '../../config/app_colors.dart';
import '../../config/fonts_manager.dart';
import '../../config/values_manager.dart';
import '../../widgets/medium_text_widget.dart';
import '../../widgets/request_card.dart';

class LocationsPage extends StatelessWidget {
  final LocationsController controller = Get.put(LocationsController());
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            Obx(
                  () => Expanded(
                    child: ListView.builder(
                itemCount: controller.myLocationsList.length,
                itemBuilder: (context, index) {
                    return RequestCard(
                      liters: "${controller.myLocationsList[index].liters}L",
                      gift: controller.myLocationsList[index].gift.toString(),
                      date: controller.myLocationsList[index].date.toString(),
                    );
                },
              ),
                  ),
            )
          ],
        ),
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.addItem();
          },
          child: Icon(Icons.add),
        )
    );
  }
}
