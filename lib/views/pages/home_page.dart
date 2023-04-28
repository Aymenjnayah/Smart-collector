import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_collector/controllers/home_controller.dart';
import 'package:smart_collector/widgets/ProfileInfoWidget.dart';

import '../../routes/app_routes.dart';
import '../../widgets/request_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              ProfileInfoWidget(
                  name: "Aymen Jnayah",
                  points: "78",
                  liters: "126",
                  image: "assets/images/aymen.jpg"),
              Obx(
                () => Expanded(
                  child: ListView.builder(
                    itemCount: controller.myList.length,
                    itemBuilder: (context, index) {
                      return RequestCard(
                        liters: "${controller.myList[index].liters}L",
                        gift: controller.myList[index].gift.toString(),
                        date: controller.myList[index].date.toString(),
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
            Get.toNamed(AppRoutes.NewRequest1);
          },
          child: Icon(Icons.add),
        ));
  }
}
