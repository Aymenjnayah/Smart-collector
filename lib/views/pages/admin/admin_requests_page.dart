import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_collector/controllers/admin/admin_requests_controller.dart';

import '../../../widgets/NewRequestAppBar.dart';
import '../../../widgets/request_card.dart';

class AdminRequestsPage extends StatelessWidget {
  final controller = Get.put(AdminRequestsController());

  AdminRequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustumAppBar(
              title: "Requests",
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  hintText: 'Search here',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Color(0xFFF2F2F2),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                ),
              ),
            ),
            const SizedBox(height: 10),
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
    );
  }
}
