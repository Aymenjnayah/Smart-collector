import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smart_collector/controllers/home_controller.dart';
import 'package:smart_collector/widgets/ProfileInfoWidget.dart';

import '../../routes/app_routes.dart';
import '../../widgets/SubmitButton.dart';
import '../../widgets/request_card.dart';

class HomePage extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Obx(() {
              final sum = controller.myList.value.isNotEmpty
                  ? controller.myList.value.fold(
                  0, (previousValue, element) => previousValue + element.amount!.toInt())
                  : 0;

              return ProfileInfoWidget(
                name: controller.currentUser.value.name,
                points: sum.toString(),
                liters: sum.toString(),
                image: controller.currentUser.value.avatar,
              );
            }),
            Obx(
              () {
                if (controller.myList.isNotEmpty) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Your Requests",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.NewRequest1);
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.green,
                                width: 3,
                              ),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.add,
                                color: Colors.green,
                                size: 35,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Container(); // Return an empty container when myList is empty
                }
              },
            ),
            Obx(
              () {
                if (controller.myList.isEmpty) {
                  return Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/home_empty_cell.png',
                          width: 250,
                          height: 250,
                        ),
                        const Text(
                          'Get rid of cooking oil \nwith the smart collector',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            height: 1.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        const Text(
                          'Make a request and we will come \nto your home with a gift',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 15),
                        SubmitButton(
                            buttonText: "Add New Request",
                            onPressed: () =>
                                {Get.toNamed(AppRoutes.NewRequest1)})
                      ],
                    ),
                  );
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: controller.myList.length,
                      itemBuilder: (context, index) {
                        final dateFormat = DateFormat('yyyy-MM-dd HH:mm');
                        final date = controller.myList.value[index].date;
                        final formattedDate = dateFormat.format(date!);

                        return RequestCard(
                          liters: "${controller.myList.value[index].amount}L",
                          gifts: [],
                          date: formattedDate,
                          address: "${controller.myList.value[index].giftObjects?.map((gift) => gift.title).join(', ')}L",
                          onDelete: () => {
                            controller.deleteRequest(controller.myList[index].docId)
                          },
                          onTap: () => {
                            controller.showQrCode(controller.myList[index].docId)
                          },
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
